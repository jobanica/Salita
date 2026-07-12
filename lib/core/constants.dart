/// App-wide constants for Salita.
///
/// Keep anything that native code (Android widget/WorkManager) and Dart both
/// need to agree on in ONE place. The HomeWidget shared-prefs keys below are
/// read by the Kotlin widget provider — if you rename them here, update the
/// Kotlin side too (android/.../SalitaWidgetProvider.kt).
library;

class AppConstants {
  AppConstants._();

  /// Deep-link scheme. Widget tap opens `salita://verse/{verse_id}`.
  static const String deepLinkScheme = 'salita';
  static const String deepLinkVerseHost = 'verse';

  /// Local hour at which the widget verse rotates to the new day's verse.
  /// The schedule is keyed by *calendar date*, but the visible rotation flips
  /// at 05:00 local time (see [rotationHour]). Before 5 AM the widget still
  /// shows the previous day's verse so early risers aren't jarred at midnight.
  static const int rotationHour = 5;

  /// Number of past days kept browsable in the free Archive (Phase 1).
  static const int freeArchiveDays = 30;

  /// Max characters shown in the widget before truncation. Full text is in-app.
  static const int widgetVerseCharLimit = 140;

  /// WorkManager unique task name for the daily rotation job.
  static const String dailyRotationTaskName = 'salita_daily_rotation';
  static const String dailyRotationTaskTag = 'salita_widget';

  /// Android widget provider name (must match the <receiver> in AndroidManifest).
  static const String androidWidgetName = 'SalitaWidgetProvider';
  static const String iOSWidgetName = 'SalitaWidget'; // Phase 3
  static const String appGroupId = 'group.com.salita.app'; // Phase 3 (iOS)
}

/// HomeWidget shared-storage keys. The app WRITES these; the widget READS them.
/// This is the offline bridge — the widget never touches the Drift DB directly.
class WidgetKeys {
  WidgetKeys._();

  static const String verseId = 'widget_verse_id';
  static const String reference = 'widget_reference';
  static const String verseText = 'widget_verse_text';
  static const String theme = 'widget_theme';
  static const String lastUpdatedIso = 'widget_last_updated';
}

/// Local-storage keys for user preferences bridged to the widget.
class PrefKeys {
  PrefKeys._();

  static const String onboardingComplete = 'onboarding_complete';
  static const String translationPreference = 'translation_preference';
  static const String widgetTheme = 'widget_theme';
  static const String fontSize = 'font_size';
  static const String notificationTime = 'notification_time';
}
