import 'package:flutter_test/flutter_test.dart';
import 'package:salita/data/db/seed/seed_data.dart';

/// Guards on the bundled DRAFT content. These do NOT validate scripture text
/// (a human must do that against canonical ADB 1905 / WEB sources) — they only
/// enforce structural invariants so the seed can't silently rot.
void main() {
  test('seeds exactly 60 verse + reflection pairs for the MVP', () {
    expect(seedVerses.length, 60);
    expect(seedReflections.length, 60);
  });

  test('every reflection points at an existing verse id', () {
    final verseIds = seedVerses.map((v) => v.id.value).toSet();
    for (final r in seedReflections) {
      expect(verseIds.contains(r.verseId.value), isTrue,
          reason: 'reflection ${r.id.value} references missing verse');
    }
  });

  test('verse ids are unique and contiguous 1..60', () {
    final ids = seedVerses.map((v) => v.id.value).toList()..sort();
    expect(ids, List<int>.generate(60, (i) => i + 1));
  });
}
