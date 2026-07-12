/// Which translation(s) to show. Mirrors `user_prefs.translation_preference`.
enum TranslationPref {
  tagalog('tl', 'Tagalog'),
  english('en', 'English'),
  both('both', 'Both');

  const TranslationPref(this.id, this.label);

  final String id;
  final String label;

  static TranslationPref fromId(String id) => switch (id) {
        'en' => TranslationPref.english,
        'both' => TranslationPref.both,
        _ => TranslationPref.tagalog,
      };

  bool get showTagalog => this != TranslationPref.english;
  bool get showEnglish => this != TranslationPref.tagalog;
}
