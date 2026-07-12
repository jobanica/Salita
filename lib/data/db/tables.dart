import 'package:drift/drift.dart';

/// Drift table definitions for Salita's local content store.
///
/// The local SQLite DB is the SOURCE OF TRUTH for content and is seeded from
/// bundled data on first launch. Supabase (Phase 2) only mirrors/syncs this.
///
/// Schema is intentionally sized for 365+ verses even though MVP seeds 60.

/// Canonical verse text. Public-domain translations ONLY.
/// TL = Ang Dating Biblia 1905, EN = World English Bible (WEB).
@DataClassName('Verse')
class Verses extends Table {
  IntColumn get id => integer()();
  TextColumn get book => text()();
  IntColumn get chapter => integer()();
  IntColumn get verseStart => integer()();

  /// For multi-verse passages (e.g. "Roma 8:38-39"). Equals [verseStart] for
  /// single-verse entries.
  IntColumn get verseEnd => integer()();

  TextColumn get textTl => text()();
  TextColumn get textEn => text()();

  /// Display reference in Filipino book naming, e.g. "Juan 3:16".
  TextColumn get referenceDisplay => text()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Original Taglish reflection for a verse. 120–200 words, 3-part structure.
@DataClassName('Reflection')
class Reflections extends Table {
  IntColumn get id => integer()();
  IntColumn get verseId =>
      integer().references(Verses, #id, onDelete: KeyAction.cascade)();
  TextColumn get titleTaglish => text()();
  TextColumn get bodyTaglish => text()();

  /// One reflective question to sit at the end of the reflection page.
  TextColumn get applicationPrompt => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Precomputed deterministic rotation: one verse per calendar date.
/// Same date == same verse for every user (offline + shared social moment).
@DataClassName('ScheduleEntry')
class Schedule extends Table {
  /// Calendar date at local midnight (time component is always 00:00).
  DateTimeColumn get date => dateTime()();
  IntColumn get verseId => integer().references(Verses, #id)();

  @override
  Set<Column> get primaryKey => {date};
}

/// Locally favorited verses. Synced to Supabase when signed in (Phase 2).
@DataClassName('Favorite')
class Favorites extends Table {
  IntColumn get verseId =>
      integer().references(Verses, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get favoritedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {verseId};
}

/// Single-row user preference store (id is always 1).
@DataClassName('UserPref')
class UserPrefs extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();

  /// One of: light | dark | sunrise (see AppTheme).
  TextColumn get widgetTheme =>
      text().withDefault(const Constant('light'))();

  /// UI + verse font scale multiplier (0.85 .. 1.4).
  RealColumn get fontSize => real().withDefault(const Constant(1.0))();

  /// One of: tl | en | both.
  TextColumn get translationPreference =>
      text().withDefault(const Constant('tl'))();

  /// Opt-in daily notification time as "HH:mm" local, or null if off.
  TextColumn get notificationTime => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
