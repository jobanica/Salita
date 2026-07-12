import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/translation.dart';
import '../../data/db/database.dart';
import '../../data/repositories/content_repository.dart';
import '../share/share_service.dart';

/// The page the widget tap lands on: the verse (with a translation toggle),
/// the warm Taglish explanation, the reflective question, and the
/// Favorite / Share / Copy actions.
class ReflectionScreen extends ConsumerStatefulWidget {
  const ReflectionScreen({super.key, required this.verseId});

  final int verseId;

  @override
  ConsumerState<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends ConsumerState<ReflectionScreen> {
  TranslationPref? _translationOverride;

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(verseByIdProvider(widget.verseId));
    // Default the toggle to the user's saved preference until they change it.
    final prefTranslation = ref.watch(userPrefsProvider).maybeWhen(
          data: (p) => TranslationPref.fromId(p.translationPreference),
          orElse: () => TranslationPref.tagalog,
        );
    final translation = _translationOverride ?? prefTranslation;

    return Scaffold(
      appBar: AppBar(title: const Text('Paliwanag')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('May problema: $e')),
        data: (item) => _Body(
          item: item,
          translation: translation,
          onTranslationChanged: (t) =>
              setState(() => _translationOverride = t),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.item,
    required this.translation,
    required this.onTranslationChanged,
  });

  final VerseWithReflection item;
  final TranslationPref translation;
  final ValueChanged<TranslationPref> onTranslationChanged;

  String get _primaryText =>
      translation.showTagalog ? item.verse.textTl : item.verse.textEn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verse = item.verse;
    final reflection = item.reflection;
    final textTheme = Theme.of(context).textTheme;
    final isFavorite = ref.watch(isFavoriteProvider(verse.id));

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      children: [
        Text(
          verse.referenceDisplay,
          style: textTheme.labelLarge?.copyWith(
            letterSpacing: 1.5,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        if (translation.showTagalog)
          Text(verse.textTl, style: textTheme.headlineSmall),
        if (translation == TranslationPref.both) const SizedBox(height: 12),
        if (translation.showEnglish)
          Text(
            verse.textEn,
            style: textTheme.titleMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
            ),
          ),
        const SizedBox(height: 20),
        _TranslationToggle(
          value: translation,
          onChanged: onTranslationChanged,
        ),
        const Divider(height: 40),
        if (reflection != null) ...[
          Text(
            reflection.titleTaglish,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            reflection.bodyTaglish,
            style: textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pagninilay',
                  style: textTheme.labelMedium?.copyWith(
                    letterSpacing: 1.2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  reflection.applicationPrompt,
                  style: textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 28),
        _Actions(
          isFavorite: isFavorite,
          onFavorite: () =>
              ref.read(databaseProvider).toggleFavorite(verse.id),
          onCopy: () async {
            await Clipboard.setData(
              ClipboardData(text: '$_primaryText\n\n— ${verse.referenceDisplay}'),
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nakopya na ang verse')),
              );
            }
          },
          onShare: () => showShareSheet(
            context,
            reference: verse.referenceDisplay,
            verseText: _primaryText,
          ),
        ),
      ],
    );
  }
}

class _TranslationToggle extends StatelessWidget {
  const _TranslationToggle({required this.value, required this.onChanged});

  final TranslationPref value;
  final ValueChanged<TranslationPref> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TranslationPref>(
      segments: const [
        ButtonSegment(value: TranslationPref.tagalog, label: Text('Tagalog')),
        ButtonSegment(value: TranslationPref.english, label: Text('English')),
        ButtonSegment(value: TranslationPref.both, label: Text('Pareho')),
      ],
      selected: {value},
      showSelectedIcon: false,
      onSelectionChanged: (s) => onChanged(s.first),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    required this.isFavorite,
    required this.onFavorite,
    required this.onCopy,
    required this.onShare,
  });

  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onCopy;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionButton(
          icon: isFavorite ? Icons.favorite : Icons.favorite_border,
          label: 'Paborito',
          highlighted: isFavorite,
          onTap: onFavorite,
        ),
        _ActionButton(
          icon: Icons.ios_share,
          label: 'I-share',
          onTap: onShare,
        ),
        _ActionButton(
          icon: Icons.copy_all_outlined,
          label: 'Kopyahin',
          onTap: onCopy,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.highlighted = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = highlighted
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.onSurface;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
