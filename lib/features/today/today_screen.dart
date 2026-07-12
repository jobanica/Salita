import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/translation.dart';
import '../reflection/reflection_screen.dart';
import '../share/share_service.dart';
import 'widgets/verse_card.dart';

/// The Today screen: a screenshot-worthy verse hero for the day. Tapping the
/// card (or the CTA) opens the full Reflection page.
class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = ref.watch(todayVerseProvider);
    final translation = ref.watch(userPrefsProvider).maybeWhen(
          data: (p) => TranslationPref.fromId(p.translationPreference),
          orElse: () => TranslationPref.tagalog,
        );

    return Scaffold(
      body: SafeArea(
        child: today.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('May problema: $e')),
          data: (item) {
            final verseId = item.verse.id;
            void openReflection() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ReflectionScreen(verseId: verseId),
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              children: [
                Text(
                  _greeting(DateTime.now()),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Ang salita para sa araw na ito',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.6),
                      ),
                ),
                const SizedBox(height: 24),
                VerseCard(
                  verse: item.verse,
                  translation: translation,
                  onTap: openReflection,
                ),
                const SizedBox(height: 20),
                if (item.reflection != null)
                  Text(
                    item.reflection!.titleTaglish,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: openReflection,
                        icon: const Icon(Icons.menu_book_outlined),
                        label: const Text('Basahin ang paliwanag'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton.filledTonal(
                      onPressed: () => showShareSheet(
                        context,
                        reference: item.verse.referenceDisplay,
                        verseText: translation.showTagalog
                            ? item.verse.textTl
                            : item.verse.textEn,
                      ),
                      icon: const Icon(Icons.ios_share),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _greeting(DateTime now) {
    final h = now.hour;
    if (h < 12) return 'Magandang umaga';
    if (h < 18) return 'Magandang hapon';
    return 'Magandang gabi';
  }
}
