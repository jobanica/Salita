import 'dart:async';

import 'package:drift/drift.dart';

import '../../core/fallback_verse.dart';
import '../../domain/verse_scheduler.dart';
import '../db/database.dart';

/// A verse paired with its reflection — the unit the UI works with.
class VerseWithReflection {
  final Verse verse;
  final Reflection? reflection;

  const VerseWithReflection(this.verse, this.reflection);
}

/// Read-facing API over the seeded Drift database.
///
/// Keeps all verse-selection routed through [VerseScheduler] so the app, the
/// widget writer, and (Phase 3) iOS all agree on which verse a date maps to.
class ContentRepository {
  ContentRepository(this._db);

  final AppDatabase _db;

  /// The verse that should be visible *right now*, honouring the 5 AM rotation.
  Future<VerseWithReflection> today() => forDate(DateTime.now());

  /// Resolve the verse+reflection for the calendar day that [now] falls into
  /// (after applying the 5 AM rotation rule via [VerseScheduler.visibleDate]).
  Future<VerseWithReflection> forDate(DateTime now) async {
    final date = VerseScheduler.visibleDate(now);
    var verseId = await _db.verseIdForDate(date);

    // The precomputed schedule only covers a rolling window. If the requested
    // date isn't in it (e.g. the app sat unopened past the window), fall back
    // to computing deterministically from the verse pool so we still match
    // every other device — then lazily extend the schedule.
    if (verseId == null) {
      final ids = await _sortedVerseIds();
      if (ids.isNotEmpty) {
        verseId = VerseScheduler.verseIdForDate(date, ids);
        unawaited(_db.rebuildSchedule());
      }
    }

    return _byId(verseId ?? FallbackVerse.verseId);
  }

  Future<VerseWithReflection> byVerseId(int verseId) => _byId(verseId);

  Future<VerseWithReflection> _byId(int verseId) async {
    final verse = await _db.verseById(verseId);
    if (verse == null) {
      // Should never happen with a seeded DB, but never crash the reflection
      // page on a bad deep link — fall back to a known-good verse.
      final fallback = await _db.verseById(FallbackVerse.verseId);
      if (fallback == null) {
        return VerseWithReflection(_syntheticFallbackVerse(), null);
      }
      return VerseWithReflection(
        fallback,
        await _db.reflectionForVerse(fallback.id),
      );
    }
    return VerseWithReflection(verse, await _db.reflectionForVerse(verseId));
  }

  /// Past [days] verses for the Archive screen, most recent first.
  Future<List<VerseWithReflection>> archive(int days) async {
    final entries = await _db.recentSchedule(days);
    final result = <VerseWithReflection>[];
    for (final e in entries) {
      result.add(await _byId(e.verseId));
    }
    return result;
  }

  Future<List<int>> _sortedVerseIds() async {
    final verses = await _db.select(_db.verses).get();
    final ids = verses.map((v) => v.id).toList()..sort();
    return ids;
  }

  /// Absolute last-resort verse if even the DB read fails.
  Verse _syntheticFallbackVerse() => Verse(
        id: FallbackVerse.verseId,
        book: 'Juan',
        chapter: 3,
        verseStart: 16,
        verseEnd: 16,
        textTl: FallbackVerse.textTagalog,
        textEn: FallbackVerse.textEnglish,
        referenceDisplay: FallbackVerse.reference,
      );
}
