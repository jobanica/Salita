import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salita/features/share/share_card.dart';

void main() {
  group('ShareFormat export dimensions', () {
    test('story exports at 1080x1920', () {
      expect(ShareFormat.story.pixelSize, const Size(1080, 1920));
    });

    test('feed exports at 1080x1080', () {
      expect(ShareFormat.feed.pixelSize, const Size(1080, 1080));
    });
  });

  testWidgets('ShareCard renders reference, verse text and watermark',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ShareCard(
          reference: 'Juan 3:16',
          verseText: 'Sapagka\'t gayon na lamang ang pagsinta ng Dios…',
          format: ShareFormat.feed,
        ),
      ),
    );

    expect(find.text('Juan 3:16'), findsOneWidget);
    expect(find.textContaining('pagsinta ng Dios'), findsOneWidget);
    expect(find.text('Salita'), findsOneWidget);
  });
}
