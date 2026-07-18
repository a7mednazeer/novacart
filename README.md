# NovaCart 🛍️

A premium, production-grade Flutter e-commerce app.

## Status: Step 1 of N — Foundation + Splash Screen ✅

## Architecture

Clean Architecture, feature-first:

```
lib/
  core/                      # Shared across all features
    constants/               # AppColors, AppTextStyles, AppSpacing/Radius, AppAssets
    theme/                   # AppTheme (light/dark, Material 3), ThemeCubit
    di/                      # GetIt service locator
    routing/                 # GoRouter config + route name constants
    network/                 # Dio client factory
    services/                # LocalStorageService (SharedPrefs + SecureStorage)
    errors/                  # Failure types for Either<Failure, T> results
    widgets/                 # AppLogo, GradientScaffoldBackground, (more to come)
  features/
    splash/
      presentation/
        cubit/                # SplashCubit + SplashState
        pages/                # SplashPage
    auth/                     # scaffolded (data/domain/presentation) — built next
  main.dart
```

Each feature will follow: `data/` (models, datasources, repository impl) →
`domain/` (entities, repository interface, use cases) → `presentation/`
(cubit/bloc, pages, widgets). This keeps business logic testable and
independent of Firebase/Dio/UI specifics.

## Why this structure

- **`core/constants`** — a single design-system source of truth. No
  screen should hardcode a hex color or font size; everything reads
  from `AppColors` / `AppTextStyles` / `AppSpacing` so a re-brand or
  dark-mode tweak happens in one place.
- **GetIt over `Provider.of` scattering** — `sl<T>()` gives every layer
  access to exactly the dependency it needs (repository, cubit,
  service) without constructor-drilling through widgets.
- **GoRouter** — declarative, supports deep links (useful later for
  "open this product from a push notification"), and keeps navigation
  logic out of widget `build()` methods.
- **Cubit over raw `setState`** — predictable, testable state
  transitions (`SplashInitial → SplashLoading → SplashReady/Error`)
  that the UI just reacts to via `BlocListener`/`BlocBuilder`.

## Dependencies (see `pubspec.yaml`)

State: `flutter_bloc`, `equatable` · DI: `get_it` · Routing: `go_router`
Backend: `firebase_core/auth/firestore/storage/messaging` · Network:
`dio` · Storage: `shared_preferences`, `hive`, `flutter_secure_storage`
· UI: `cached_network_image`, `shimmer`, `flutter_svg`, `lottie`,
`flutter_animate`, `google_fonts` · Forms: `form_field_validator` ·
i18n: `easy_localization` · Utils: `dartz`, `logger`, `local_auth`,
`permission_handler`.

## Setup

```bash
flutter pub get
flutterfire configure   # generates firebase_options.dart — wire into main.dart
flutter pub run flutter_native_splash:create
flutter pub run flutter_launcher_icons
flutter run
```

## Assets still needed (placeholders referenced in `AppAssets`)

Drop these into `assets/images` / `assets/icons` / `assets/animations`:
`app_icon.png`, `app_icon_fg.png`, `splash_logo.png`, onboarding SVGs,
empty-state SVGs, `ic_google.svg`, `ic_apple.svg`, Lottie JSONs. The
`AppLogo` widget (brand mark + wordmark) is fully code-drawn, so the app
runs today without any of these — they only enhance onboarding/empty
states later.

## What's implemented in this step

1. **Design system**: `AppColors` (light/dark + gradients), `AppTextStyles`
   (Poppins scale), `AppSpacing`/`AppRadius`/`AppDurations`.
2. **`AppTheme`**: full Material 3 light + dark `ThemeData` (buttons,
   inputs, cards, app bar, bottom nav, snackbars, text theme).
3. **`ThemeCubit`**: persists user's light/dark choice.
4. **DI container** (`injection_container.dart`): Firebase instances, Dio
   client, `LocalStorageService`, `ThemeCubit`, `SplashCubit`.
5. **`AppRouter`**: GoRouter shell, ready to accept new routes.
6. **`AppLogo`**: custom-painted NovaCart brand mark (no external asset
   dependency) — a gradient mark with a "route arrow → destination dot"
   motif, symbolizing speed, direction, and reliable delivery.
7. **Splash screen**: gradient background, animated logo entrance
   (`flutter_animate`), brand pulse loader, `SplashCubit` resolving
   Onboarding vs Sign In vs Home (checks `hasSeenOnboarding` +
   `FirebaseAuth.currentUser`).

## Next step (awaiting your confirmation)

**Onboarding screens** (3-slide intro with `PageView` +
`smooth_page_indicator`), followed by **Sign In / Sign Up / Forgot
Password**, fully wired to Firebase Auth — matching the routes already
stubbed (commented) in `SplashPage`'s navigation listener.
