import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/verse_scheduler.dart';
import 'seed/seed_data.dart';
import 'tables.dart';

part 'database.g.dart';

/// The bundled, offline-first content database.
///
/// On first open the DB is empty, so [_seedIfEmpty] loads the 60 bundled
/// verse+reflection pairs and precomputes a deterministic [Schedule]. All of
/// this happens with zero network access.
@DriftDatabase(
  tables: [Verses, Reflections, Schedule, Favorites, UserPrefs],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
          if (details.wasCreated) {
            await _seedContent();
            await _ensurePrefsRow();
            await _rebuildSchedule();
          }
        },
      );

  // --------------------------------------------------------------------------
  // Seeding
  // --------------------------------------------------------------------------

  /// Loads the bundled DRAFT content. Verses use public-domain text only.
  Future<void> _seedContent() async {
    await batch((b) {
      for (final v in seedVerses) {
        b.insert(verses, v);
      }
      for (final r in seedReflections) {
        b.insert(reflections, r);
      }
    });
  }

  Future<void> _ensurePrefsRow() async {
    await into(userPrefs).insertOnConflictUpdate(
      const UserPrefsCompanion(id: Value(1)),
    );
  }

  /// Precomputes the deterministic date→verse rotation for a full year starting
  /// today. Recomputable at any time; safe to call again after content sync.
  Future<void> _rebuildSchedule() async {
    final ids = await select(verses).map((v) => v.id).get();
    if (ids.isEmpty) return;
    ids.sort();

    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day);

    await batch((b) {
      for (var offset = 0; offset < 365; offset++) {
        final date = start.add(Duration(days: offset));
        // Deterministic: index derived from days-since-epoch so any device
        // computing the same date lands on the same verse (see VerseScheduler).
        final verseId = VerseScheduler.verseIdForDate(date, ids);
        b.insert(
          schedule,
          ScheduleCompanion.insert(date: date, verseId: verseId),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  /// Public hook so the app can extend/refresh the schedule (e.g. after a
  /// content delta-sync in Phase 2, or when the precomputed window runs low).
  Future<void> rebuildSchedule() => _rebuildSchedule();

  // --------------------------------------------------------------------------
  // Queries used across the app
  // --------------------------------------------------------------------------

  Future<Verse?> verseById(int id) =>
      (select(verses)..where((v) => v.id.equals(id))).getSingleOrNull();

  Future<Reflection?> reflectionForVerse(int verseId) =>
      (select(reflections)..where((r) => r.verseId.equals(verseId)))
          .getSingleOrNull();

  Future<int?> verseIdForDate(DateTime date) async {
    final day = DateTime(date.year, date.month, date.day);
    final row = await (select(schedule)..where((s) => s.date.equals(day)))
        .getSingleOrNull();
    return row?.verseId;
  }

  /// Verse ids for the past [days] days, most recent first (Archive screen).
  Future<List<ScheduleEntry>> recentSchedule(int days) {
    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: days));
    return (select(schedule)
          ..where((s) => s.date.isBiggerOrEqualValue(start))
          ..where((s) => s.date.isSmallerOrEqualValue(
              DateTime(today.year, today.month, today.day)))
          ..orderBy([(s) => OrderingTerm.desc(s.date)]))
        .get();
  }

  Stream<List<Favorite>> watchFavorites() =>
      (select(favorites)..orderBy([(f) => OrderingTerm.desc(f.favoritedAt)]))
          .watch();

  Future<void> toggleFavorite(int verseId) async {
    final existing = await (select(favorites)
          ..where((f) => f.verseId.equals(verseId)))
        .getSingleOrNull();
    if (existing != null) {
      await (delete(favorites)..where((f) => f.verseId.equals(verseId))).go();
    } else {
      await into(favorites).insert(FavoritesCompanion.insert(verseId: verseId));
    }
  }

  Future<UserPref> getPrefs() async {
    await _ensurePrefsRow();
    return (select(userPrefs)..where((u) => u.id.equals(1))).getSingle();
  }

  Future<void> updatePrefs(UserPrefsCompanion prefs) async {
    await (update(userPrefs)..where((u) => u.id.equals(1)))
        .write(prefs.copyWith(id: const Value(1)));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationSupportDirectory();
    final file = File(p.join(dir.path, 'salita.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
