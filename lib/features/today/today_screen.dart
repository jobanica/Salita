import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';

/// MINIMAL Today screen for Step 1.
///
/// This exists to prove the seed + deterministic scheduler work end-to-end
/// (offline): it renders today's verse from the bundled DB. The full,
/// screenshot-worthy Today card + expandable Reflection page are built in
/// Step 2.
class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = ref.watch(todayVerseProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Salita')),
      body: today.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('May problema: $e')),
        data: (item) => SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.verse.referenceDisplay,
                style: textTheme.labelLarge?.copyWith(
                  letterSpacing: 1.2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(item.verse.textTl, style: textTheme.headlineSmall),
              const SizedBox(height: 24),
              if (item.reflection != null) ...[
                Text(
                  item.reflection!.titleTaglish,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(item.reflection!.bodyTaglish, style: textTheme.bodyLarge),
                const SizedBox(height: 20),
                Text(
                  item.reflection!.applicationPrompt,
                  style: textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
