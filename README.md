# Salita

A daily Bible-verse app for the Filipino market, built around a **home-screen
widget**. You see a verse every time you glance at your phone; tapping the
widget deep-links into the app and opens a warm, conversational **Taglish
reflection** on that verse.

- **Platform priority:** Android first (Phase 1–2). iOS/WidgetKit is Phase 3,
  and the architecture is already shaped for it — all verse-selection logic
  lives in shared Dart, never in platform code.
- **Offline-first:** the daily verse and its reflection are bundled with the
  app and rendered with **zero network dependency**. Supabase and accounts are
  optional extras (Phase 2); the app is 100% functional without them.

> **Status:** Steps 1–2 complete — scaffold, Drift schema, 60 seeded
> verse/reflection pairs, deterministic scheduler, the Today card, the
> Reflection page (translation toggle + favorite/copy/share), and
> share-as-image (1080×1920 / 1080×1080 PNG export). The widget, WorkManager
> rotation, deep links, onboarding, settings, archive, Supabase, and billing
> are scheduled for later steps — see [Roadmap](#roadmap).

---

## Tech stack

| Concern            | Choice                                                        |
| ------------------ | ------------------------------------------------------------- |
| App                | Flutter (stable), Dart                                        |
| State              | Riverpod                                                      |
| Local storage      | Drift (SQLite) — bundled + seeded on first launch             |
| Widget bridge      | `home_widget` + native Android App Widget (Kotlin) — *Step 3* |
| Background rotation | WorkManager (daily 05:00 local + on-boot) — *Step 3*         |
| Deep linking       | `app_links` → `salita://verse/{verse_id}` — *Step 3*          |
| Backend (optional) | Supabase (content sync, auth, favorites, entitlements) — *Phase 2* |
| Payments           | Google Play Billing (`in_app_purchase`) — *Phase 2*           |

---

## Content & copyright rules (do not violate)

1. **Only public-domain translations are bundled:**
   - Tagalog: **Ang Dating Biblia 1905**
   - English: **World English Bible (WEB)**
2. **No** NIV / ESV / MBB or any modern licensed translation may appear in code,
   seed data, or UI copy — ever.
3. Reflections are **original** Taglish content (120–200 words), structured as
   (a) plain meaning, (b) Biblical context, (c) daily application, plus one
   reflective question. Warm, not preachy, denominationally neutral.
4. The MVP seeds **60 curated pairs**. Every seed string is currently marked
   **DRAFT** and **must be reviewed by a human before launch** — including the
   verse text, which must be validated character-for-character against a
   canonical ADB 1905 / WEB source. See `lib/data/db/seed/seed_data.dart`.

---

## Project layout

```
lib/
├── main.dart                       # ProviderScope bootstrap
├── app.dart                        # MaterialApp, theme wiring
├── core/
│   ├── constants.dart              # deep-link scheme, widget keys, 5 AM rotation
│   ├── fallback_verse.dart         # hardcoded so the widget never blanks
│   ├── providers.dart              # Riverpod providers (db, repo, today, prefs)
│   └── theme/app_theme.dart        # Light / Dark / Sunrise themes (Lora + Inter)
├── data/
│   ├── db/
│   │   ├── database.dart           # Drift DB: seed-on-create + schedule precompute
│   │   ├── tables.dart             # verses, reflections, schedule, favorites, user_prefs
│   │   └── seed/seed_data.dart     # 60 DRAFT verse + reflection pairs
│   └── repositories/
│       └── content_repository.dart # read-facing API over the DB
├── domain/
│   └── verse_scheduler.dart        # deterministic date→verse (shared, offline)
└── features/
    └── today/today_screen.dart     # minimal Today screen (full UI in Step 2)
test/
├── verse_scheduler_test.dart       # 5 AM rotation + determinism
└── seed_data_test.dart             # seed structural invariants
```

### Why the scheduler lives in Dart

The rotation is **deterministic**: the same calendar date maps to the same
verse on every device worldwide (enables shared social moments — "grabe yung
verse today"). The math is a modulo over the sorted verse-id pool keyed by
days-since-epoch, and the visible day flips at **05:00 local** (before 5 AM you
still see yesterday's verse). Keeping this in `domain/verse_scheduler.dart`
means Android now, and iOS/WidgetKit later, can never disagree.

---

## Running the app

Prerequisites: Flutter SDK (stable, ≥ 3.22) and the Android toolchain.

```bash
flutter pub get

# Generate Drift + Riverpod code (creates the *.g.dart files, git-ignored)
dart run build_runner build --delete-conflicting-outputs

flutter run
```

On first launch the Drift DB is created and seeded automatically, and a
one-year deterministic schedule is precomputed — all offline.

### Tests

```bash
flutter test
```

Step 1 ships unit tests for the scheduler (5 AM rotation, determinism, bounds)
and seed integrity. The integration tests the product spec calls for — **date
rollover at midnight vs 5 AM, reboot recovery, deep-link cold start, timezone
change** — are added alongside the widget in Step 3, since they exercise the
native surface.

---

## Testing the widget locally *(Step 3 — not yet built)*

When the widget lands, this section will cover:

1. Build & install the debug APK, long-press the home screen → **Widgets** →
   drag the **Salita 4×2** widget.
2. Force a rotation without waiting for 05:00:
   `adb shell am broadcast -a android.appwidget.action.APPWIDGET_UPDATE`.
3. Verify **offline**: enable airplane mode, reboot, confirm the widget still
   renders today's verse from shared storage (never a blank/error state).
4. Verify the deep link: tap the widget → confirm it opens
   `salita://verse/{id}` on the correct reflection.

---

## Seeding / updating content *(Supabase — Phase 2)*

Phase 1 content is bundled in `seed_data.dart`. In Phase 2, content is authored
in Supabase and delta-synced to devices via a `content_version` check on app
open (new reflections ship without an app update). The Supabase schema mirrors
the local tables plus `profiles`, `user_favorites`, `entitlements`, and an
`events` analytics table. Setup steps will be documented here when Phase 2
lands.

---

## Play Store release checklist

- [ ] **Human review of all 60 DRAFT pairs** — reflections *and* verse text
      validated against canonical ADB 1905 / WEB public-domain sources.
- [ ] Confirm **no licensed translations** (NIV/ESV/MBB/etc.) anywhere.
- [ ] App icon, feature graphic, and screenshots (incl. the widget in action).
- [ ] `applicationId`, signing key (`upload-keystore.jks`), and `versionCode`.
- [ ] Widget verified offline from a cold boot (airplane mode) — never blank.
- [ ] Deep-link cold-start verified on a fresh install.
- [ ] Data safety form completed.
- [ ] **Privacy policy** published and linked, covering at minimum:
  - What is collected (Phase 1: nothing leaves the device; Phase 2: optional
    account email, favorites, and anonymous analytics events).
  - That the app is fully usable **without an account**.
  - Third parties (Supabase, Google Play Billing) and their purpose.
  - How to request data deletion, and a contact email.
- [ ] Google Play Billing products configured + server-side purchase
      verification (Phase 2).
- [ ] Target API level meets the current Play requirement.

---

## Roadmap

- **Step 1 ✅** Scaffold + Drift schema + 60 seeded DRAFT pairs + scheduler.
- **Step 2 ✅** Today card + Reflection page (translation toggle, favorite,
  copy, share) + share-as-image (1080×1920 / 1080×1080, off-screen capture).
- **Step 3** Widget + WorkManager 05:00 rotation + boot receiver + deep link
  (+ the native integration tests).
- **Step 4** Onboarding (forced widget walkthrough) + settings + archive + favorites.
- **Step 5** README polish + release checklist finalization.
- **Phase 2** Google Play Billing ("Salita Plus"), optional Supabase auth,
  opt-in notifications, analytics, content delta-sync.
- **Phase 3** iOS via WidgetKit + App Group shared storage (Dart logic reused).
