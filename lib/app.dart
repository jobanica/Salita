import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/providers.dart';
import 'core/theme/app_theme.dart';
import 'features/today/today_screen.dart';

/// Root widget. Watches the user's chosen theme and rebuilds when it changes.
class SalitaApp extends ConsumerWidget {
  const SalitaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(userPrefsProvider);
    final theme = prefs.maybeWhen(
      data: (p) => SalitaThemeId.fromId(p.widgetTheme),
      orElse: () => SalitaTheme.light,
    );

    return MaterialApp(
      title: 'Salita',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.forTheme(theme),
      home: const TodayScreen(),
      // Routing (deep links, reflection, archive, favorites, settings,
      // onboarding) is wired up in later steps.
    );
  }
}
