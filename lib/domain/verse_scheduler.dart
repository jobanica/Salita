import '../core/constants.dart';

/// Pure, platform-agnostic verse-selection logic.
///
/// CRITICAL ARCHITECTURE RULE: all verse-selection and date-rollover logic
/// lives HERE, in shared Dart — never in Kotlin or Swift. Android (now) and
/// iOS/WidgetKit (Phase 3) both derive their verse from these functions so the
/// two platforms can never drift apart, and so the choice is deterministic:
/// the same calendar date maps to the same verse on every device worldwide.
class VerseScheduler {
  const VerseScheduler();

  /// The date whose verse should currently be *visible*.
  ///
  /// The rotation flips at [AppConstants.rotationHour] (05:00) local time, not
  /// at midnight. Between 00:00 and 05:00 we still show the previous calendar
  /// day's verse, so someone checking their phone at 2 AM sees a stable verse
  /// rather than a surprise flip at midnight.
  static DateTime visibleDate(DateTime now) {
    final effective = now.hour < AppConstants.rotationHour
        ? now.subtract(const Duration(days: 1))
        : now;
    return DateTime(effective.year, effective.month, effective.day);
  }

  /// Number of whole days between the Unix epoch and [date] (local midnight).
  /// This is the deterministic seed shared across all devices.
  static int epochDay(DateTime date) {
    final midnight = DateTime(date.year, date.month, date.day);
    return midnight.millisecondsSinceEpoch ~/ Duration.millisecondsPerDay;
  }

  /// Maps a date to an index into a verse pool of size [poolSize].
  ///
  /// [sortedVerseIds] MUST be sorted identically on every device (we sort by
  /// numeric verse id) so the modulo lands on the same verse everywhere.
  static int indexForDate(DateTime date, int poolSize) {
    assert(poolSize > 0, 'poolSize must be positive');
    return epochDay(date) % poolSize;
  }

  /// Convenience: resolve the verse id for a date given the sorted id pool.
  static int verseIdForDate(DateTime date, List<int> sortedVerseIds) {
    return sortedVerseIds[indexForDate(date, sortedVerseIds.length)];
  }
}
