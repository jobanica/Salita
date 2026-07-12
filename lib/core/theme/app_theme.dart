import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The three MVP widget/app themes. Phase 2 adds six more behind "Salita Plus".
///
/// Design direction: calm, premium, devotional — warm off-white + deep navy by
/// default; a Sunrise gradient reserved for share images and an optional theme.
enum SalitaTheme { light, dark, sunrise }

extension SalitaThemeId on SalitaTheme {
  String get id => switch (this) {
        SalitaTheme.light => 'light',
        SalitaTheme.dark => 'dark',
        SalitaTheme.sunrise => 'sunrise',
      };

  String get label => switch (this) {
        SalitaTheme.light => 'Light',
        SalitaTheme.dark => 'Dark',
        SalitaTheme.sunrise => 'Sunrise',
      };

  static SalitaTheme fromId(String id) => switch (id) {
        'dark' => SalitaTheme.dark,
        'sunrise' => SalitaTheme.sunrise,
        _ => SalitaTheme.light,
      };
}

/// Brand palette.
class SalitaColors {
  SalitaColors._();

  static const Color offWhite = Color(0xFFFBF8F3); // warm paper
  static const Color deepNavy = Color(0xFF1C2438); // verse text
  static const Color navySurface = Color(0xFF141A2A);
  static const Color muted = Color(0xFF6B7280);
  static const Color accent = Color(0xFFC9A24B); // muted gold

  // Sunrise gradient (used for share cards + the Sunrise theme).
  static const List<Color> sunriseGradient = [
    Color(0xFFFFE3C4),
    Color(0xFFFFB27A),
    Color(0xFFE8809B),
  ];
}

class AppTheme {
  AppTheme._();

  /// Serif display for verses (Lora); clean sans (Inter) for UI.
  static TextTheme _textTheme(TextTheme base, Color onSurface) {
    final serif = GoogleFonts.loraTextTheme(base);
    final sans = GoogleFonts.interTextTheme(base);
    return sans.copyWith(
      // Verse text uses the serif display faces.
      displayLarge: serif.displayLarge?.copyWith(color: onSurface),
      displayMedium: serif.displayMedium?.copyWith(color: onSurface),
      displaySmall: serif.displaySmall?.copyWith(color: onSurface),
      headlineMedium: serif.headlineMedium?.copyWith(color: onSurface),
      headlineSmall: serif.headlineSmall?.copyWith(color: onSurface),
    ).apply(bodyColor: onSurface, displayColor: onSurface);
  }

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: SalitaColors.deepNavy,
      brightness: Brightness.light,
      surface: SalitaColors.offWhite,
    );
    final base = ThemeData(brightness: Brightness.light);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: SalitaColors.offWhite,
      textTheme: _textTheme(base.textTheme, SalitaColors.deepNavy),
      appBarTheme: const AppBarTheme(
        backgroundColor: SalitaColors.offWhite,
        elevation: 0,
        foregroundColor: SalitaColors.deepNavy,
      ),
    );
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: SalitaColors.accent,
      brightness: Brightness.dark,
      surface: SalitaColors.navySurface,
    );
    final base = ThemeData(brightness: Brightness.dark);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: SalitaColors.navySurface,
      textTheme: _textTheme(base.textTheme, SalitaColors.offWhite),
      appBarTheme: const AppBarTheme(
        backgroundColor: SalitaColors.navySurface,
        elevation: 0,
        foregroundColor: SalitaColors.offWhite,
      ),
    );
  }

  /// Sunrise is a warm light theme; the gradient itself is applied per-surface
  /// (e.g. share cards, the Today hero) via [SalitaColors.sunriseGradient].
  static ThemeData sunrise() {
    final scheme = ColorScheme.fromSeed(
      seedColor: SalitaColors.sunriseGradient[2],
      brightness: Brightness.light,
      surface: SalitaColors.sunriseGradient[0],
    );
    final base = ThemeData(brightness: Brightness.light);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: SalitaColors.sunriseGradient[0],
      textTheme: _textTheme(base.textTheme, SalitaColors.deepNavy),
      appBarTheme: AppBarTheme(
        backgroundColor: SalitaColors.sunriseGradient[0],
        elevation: 0,
        foregroundColor: SalitaColors.deepNavy,
      ),
    );
  }

  static ThemeData forTheme(SalitaTheme theme) => switch (theme) {
        SalitaTheme.light => light(),
        SalitaTheme.dark => dark(),
        SalitaTheme.sunrise => sunrise(),
      };
}
