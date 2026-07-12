/// Hardcoded fallback verse.
///
/// ENGINEERING RULE: the widget must NEVER render a blank/error state. If the
/// seeded DB or the shared-prefs bridge is somehow unavailable at widget render
/// time (fresh install before first sync, corrupted prefs, cold boot race),
/// the Kotlin side falls back to a mirror of these values, and the Dart side
/// writes these into shared prefs as a last resort.
///
/// Public-domain text only (TL: Ang Dating Biblia 1905, EN: World English Bible).
class FallbackVerse {
  FallbackVerse._();

  static const int verseId = 1; // Juan 3:16 — also seed row #1
  static const String reference = 'Juan 3:16';
  static const String textTagalog =
      'Sapagka\'t gayon na lamang ang pagsinta ng Dios sa sanglibutan, na '
      'ibinigay niya ang kaniyang bugtong na Anak, upang ang sinomang sa kaniya\'y '
      'sumampalataya ay huwag mapahamak, kundi magkaroon ng buhay na walang hanggan.';
  static const String textEnglish =
      'For God so loved the world, that he gave his one and only Son, that '
      'whoever believes in him should not perish, but have eternal life.';
}
