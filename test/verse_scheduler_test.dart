import 'package:flutter_test/flutter_test.dart';
import 'package:salita/domain/verse_scheduler.dart';

void main() {
  group('VerseScheduler.visibleDate (5 AM rotation)', () {
    test('before 5 AM shows the previous calendar day', () {
      final at2am = DateTime(2026, 7, 12, 2, 30);
      expect(VerseScheduler.visibleDate(at2am), DateTime(2026, 7, 11));
    });

    test('exactly 5 AM flips to the current day', () {
      final at5am = DateTime(2026, 7, 12, 5, 0);
      expect(VerseScheduler.visibleDate(at5am), DateTime(2026, 7, 12));
    });

    test('after 5 AM shows the current calendar day', () {
      final at9am = DateTime(2026, 7, 12, 9, 15);
      expect(VerseScheduler.visibleDate(at9am), DateTime(2026, 7, 12));
    });

    test('just before midnight still shows the current day', () {
      final at2359 = DateTime(2026, 7, 12, 23, 59);
      expect(VerseScheduler.visibleDate(at2359), DateTime(2026, 7, 12));
    });
  });

  group('VerseScheduler determinism', () {
    test('same date maps to the same verse regardless of time-of-day', () {
      final ids = List<int>.generate(60, (i) => i + 1);
      final morning = DateTime(2026, 7, 12, 8);
      final evening = DateTime(2026, 7, 12, 20);
      expect(
        VerseScheduler.verseIdForDate(
          VerseScheduler.visibleDate(morning),
          ids,
        ),
        VerseScheduler.verseIdForDate(
          VerseScheduler.visibleDate(evening),
          ids,
        ),
      );
    });

    test('consecutive days advance the verse index by one', () {
      final ids = List<int>.generate(60, (i) => i + 1);
      final d1 = DateTime(2026, 7, 12);
      final d2 = DateTime(2026, 7, 13);
      final i1 = VerseScheduler.indexForDate(d1, ids.length);
      final i2 = VerseScheduler.indexForDate(d2, ids.length);
      expect((i1 + 1) % ids.length, i2);
    });

    test('index always stays within the verse pool bounds', () {
      const poolSize = 60;
      for (var offset = 0; offset < 400; offset++) {
        final date = DateTime(2026, 1, 1).add(Duration(days: offset));
        final idx = VerseScheduler.indexForDate(date, poolSize);
        expect(idx, inInclusiveRange(0, poolSize - 1));
      }
    });
  });
}
