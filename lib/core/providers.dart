import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/db/database.dart';
import '../data/repositories/content_repository.dart';

/// The single app-wide Drift database instance. Opened lazily; seeded on first
/// launch (see [AppDatabase.migration]). Kept alive for the whole app session.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// Read-facing content API used by every screen and the widget writer.
final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository(ref.watch(databaseProvider));
});

/// Today's verse (honours the 5 AM rotation). Screens watch this.
final todayVerseProvider = FutureProvider((ref) {
  return ref.watch(contentRepositoryProvider).today();
});

/// A specific verse + its reflection by id. Backs the Reflection page (and,
/// in Step 3, widget deep links: salita://verse/{id}).
final verseByIdProvider = FutureProvider.family((ref, int verseId) {
  return ref.watch(contentRepositoryProvider).byVerseId(verseId);
});

/// User preferences row (theme, font size, translation preference, etc.).
final userPrefsProvider = FutureProvider((ref) {
  return ref.watch(databaseProvider).getPrefs();
});

/// Live list of favorited verses (most recent first). Backs the Favorites
/// screen and the favorite toggle on the Reflection page.
final favoritesProvider = StreamProvider<List<Favorite>>((ref) {
  return ref.watch(databaseProvider).watchFavorites();
});

/// Whether a given verse id is currently favorited.
final isFavoriteProvider = Provider.family<bool, int>((ref, verseId) {
  final favorites = ref.watch(favoritesProvider).valueOrNull ?? const [];
  return favorites.any((f) => f.verseId == verseId);
});
