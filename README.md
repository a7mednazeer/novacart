# NovaCart 🛍️

A premium, production-grade Flutter e-commerce app.

## Status: Step 5 of N — Product Details ✅
(Steps 1–4 — Foundation/Splash, Onboarding/Auth, Home/Nav Shell, Categories/Search — are complete; summaries retained below.)

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

## Step 2 — Onboarding + Auth (this delivery)

**New folders**: `features/onboarding/`, `features/auth/{data,domain,presentation}`,
`features/home/` (placeholder).

1. **Onboarding**: 3-slide `PageView` (`OnboardingSlide` + `onboardingSlides`
   data), `ExpandingDotsEffect` indicator, Skip/Next/Get Started CTA.
   `OnboardingCubit` persists `hasSeenOnboarding` via `LocalStorageService`
   and the page reacts by routing to Sign In.
2. **Auth — full Clean Architecture**:
   - `domain/entities/user_entity.dart` — Firebase-agnostic user model.
   - `domain/repositories/auth_repository.dart` — the contract.
   - `domain/usecases/*` — `SignInUseCase`, `SignUpUseCase`,
     `ForgotPasswordUseCase`, `GoogleSignInUseCase`, `SignOutUseCase`.
   - `data/models/user_model.dart` — Firebase User ↔ Firestore ↔ entity mapping.
   - `data/datasources/auth_remote_datasource.dart` — the only file that
     imports `firebase_auth` for auth logic; talks to Firebase Auth +
     writes/reads a `users/{uid}` Firestore profile doc.
   - `data/repositories/auth_repository_impl.dart` — catches
     `FirebaseAuthException` and maps every common code (`user-not-found`,
     `wrong-password`, `email-already-in-use`, etc.) to a friendly
     `AuthFailure` message.
   - `presentation/cubit/auth_cubit.dart` — one cubit, reused (fresh
     instance per screen) by Sign In / Sign Up / Forgot Password / the
     Home logout button.
3. **Screens**: `SignInPage` (email/password, Remember Me, Forgot
   Password link, Google sign-in, link to Sign Up), `SignUpPage` (name/
   email/password/confirm, terms checkbox, sends email verification on
   success), `ForgotPasswordPage` (send + resend reset link, success
   state).
4. **New reusable widgets** (`core/widgets`): `AppButton` (primary/
   outlined/text, built-in loading spinner), `AppTextField` (label +
   validation + password-visibility toggle). Auth-specific:
   `AuthDivider`, `GoogleSignInButton` (code-drawn 4-color "G" mark —
   no bundled SVG required).
5. **New utils** (`core/utils`): `Validators` (email/password/name/phone/
   confirm-password rules), `AppSnackBar` (consistent success/error/info
   toasts).
6. **Router**: `onboarding`, `signIn`, `signUp`, `forgotPassword`, `home`
   routes now registered in `AppRouter`; `SplashPage` navigation is
   un-commented and live.
7. **`HomePlaceholderPage`**: a temporary screen (sign-out button +
   confirmation) so the entire Splash → Onboarding → Auth → Home loop
   is testable today. This is replaced by the real Home screen next.

### Firebase setup required for this step
Enable **Email/Password** and **Google** providers in Firebase Console →
Authentication → Sign-in method. Firestore needs a `users` collection
(created automatically on first sign-up) — add security rules restricting
each doc to its own `uid` before going to production:
```
match /users/{userId} {
  allow read, write: if request.auth != null && request.auth.uid == userId;
}
```

## Step 3 — Home Screen + Bottom Nav Shell (this delivery)

**New folders**: `features/product/` (shared catalog domain+data),
`features/home/{domain,data,presentation}`, plus lightweight
`features/categories/`, `features/wishlist/`, `features/profile/`.

1. **Shared `product` feature** — `ProductEntity`, `BannerEntity`,
   `CategoryEntity` (domain), `ProductModel`/`BannerModel` (Firestore
   mapping), and `ProductRemoteDataSource`. This is intentionally its
   own feature (not nested inside Home) because Categories, Search,
   Wishlist, Cart, and Product Details will all depend on it too.
2. **Mock-data fallback, clearly labeled** — `product_mock_data.dart`
   is queried only if Firestore's `products`/`banners` collections come
   back empty (see the big comment block at the top of that file for
   exactly how to replace it — seed Firestore, then delete the file).
3. **Home domain** — `HomeData` aggregates banners/categories/flash
   sale/best sellers/new arrivals/recommended into one object;
   `HomeRepositoryImpl` derives all four product sections from a
   single catalog fetch (sorted/filtered by `soldCount`, `isNew` +
   `createdAt`, `isFlashSale`, `rating` respectively) instead of firing
   4 separate Firestore reads.
4. **`HomeCubit`**: `HomeLoading → HomeLoaded/HomeError`, plus a
   `refresh()` used by pull-to-refresh that doesn't flash back to the
   loading skeleton.
5. **Home screen UI**: auto-playing promo banner carousel (`PageView` +
   `WormEffect` indicator), quick-access categories row, Flash Sale
   section with a live per-second `CountdownTimer`, Best Sellers / New
   Arrivals / Recommended horizontal lists, custom search-bar app bar,
   shimmer loading skeleton (`HomeLoadingSkeleton`), and a reusable
   `ErrorStateView` with retry.
6. **New reusable widgets** (`core/widgets`): `ProductCard` (Hero-tagged
   image, discount/new badges, favorite toggle — shared by every future
   catalog screen), `ShimmerBox`, `ErrorStateView`,
   `ComingSoonPlaceholder`, `ScaffoldWithNavBar`.
7. **Bottom nav shell**: `AppRouter` now uses
   `StatefulShellRoute.indexedStack` with 4 branches (Home, Categories,
   Wishlist, Profile) — each tab keeps its own navigation stack.
   Categories/Wishlist are "coming soon" placeholders (their real
   build steps are next); **Profile is already functional** — dark
   mode toggle and sign out both fully wired (not stubs).

### Firebase setup for this step (optional right now)
The app works today with zero Firestore data thanks to the mock
fallback. When ready to go live, seed two collections:
- `products` — shape matches `ProductModel.toFirestore()`
- `banners` — shape matches the fields read in `BannerModel.fromFirestore()`

## Step 4 — Categories + Search (this delivery)

**New folders**: `features/categories/{domain,data,presentation}`,
`features/search/{domain,data,presentation}`. Extended `features/product/`
with `SubcategoryEntity`, `ProductFilter`, and `FilterProducts`.

1. **Shared filter/sort infrastructure** (in `product/domain`, reused by
   both features — this is the key architectural point of this step):
   `ProductFilter` (price range, min rating, brands, sort option) and
   `FilterProducts.call()`, a pure function both `CategoryProductsCubit`
   and `SearchCubit` call with their own product list. One filter UI
   (`showProductFilterSheet`, in `core/widgets`) is shared by both
   screens too.
2. **Categories tab** (replaces the earlier placeholder): a sidebar of
   top-level categories (`CategorySidebar`) + a content pane
   (`SubcategoryGrid`) showing a category banner and its subcategories
   (`Women's Fashion`/`Men's Fashion` have full subcategory sets
   matching the original design; other categories fall back to a
   "Browse All" button — realistic for categories that don't need
   deep subcategorization).
3. **Category Products screen** (pushed on top of the shell, has a back
   button): 2-column product grid, live result count, Filter & Sort
   button opening the shared bottom sheet, shimmer skeleton while
   loading, and a proper empty state ("No products found" + "Clear
   Filters" action) — distinct from the error state, which has "Try
   Again" instead.
4. **Search screen**: debounced instant search (400ms — `SearchCubit`
   owns its own `Timer`), recent search history (persisted via new
   `LocalStorageService.recentSearches` methods — add/remove/clear),
   trending-search suggestion chips, the same filter sheet + product
   grid as Categories, and distinct empty states for "no results for
   this query" vs. "no results after filtering." Voice search has a
   clearly-labeled stub (`mic` icon → snackbar) rather than a half-built
   `speech_to_text` integration; wiring a real mic requires a
   permissions flow that deserves review before shipping.
5. **New reusable widgets** (`core/widgets`): `EmptyStateView` (valid
   empty result, no retry — contrast with `ErrorStateView`),
   `ProductFilterSheet`.
6. **Data layer**: `ProductRemoteDataSource.getProductsByCategory()`
   added; `SearchRepositoryImpl` filters the shared catalog client-side
   by name/brand/category (documented as a placeholder for a real
   search index like Algolia once the catalog grows beyond what a
   client-side filter can handle quickly).

## Step 5 — Product Details (this delivery)

**New folder**: `features/product_details/{domain,data,presentation}`.
**Relocated**: `ProductHorizontalList` moved from `features/home/presentation/widgets`
into `core/widgets` since Product Details' "You Might Also Like" section
needed it too — the first real cross-feature reuse beyond the Product
entity itself.

1. **Domain**: `ReviewEntity`, `ProductDetailsData` (aggregates product +
   reviews + similar products + a computed `ratingBreakdown` histogram,
   same pattern as `HomeData`).
2. **Data**: `ProductDetailsRepositoryImpl` finds the product by id in
   the shared catalog, computes "similar products" as same-category
   products excluding itself, and pairs it with `generateMockReviews()`
   — a deterministic per-product mock review generator (clearly labeled
   or replace with a real `products/{id}/reviews` Firestore
   subcollection once ready).
3. **`ProductDetailsCubit`**: loads the aggregate and owns the screen's
   interactive state — selected color, selected size, quantity,
   favorite toggle — all as immutable state transitions, not `setState`.
4. **Screen**: swipeable image gallery with a pinch-to-zoom full-screen
   viewer (`photo_view`), Hero transition from the product card's image
   (the Hero tag was set up back in Step 3 anticipating this), color
   swatches parsed from hex, size chips, "Read More" expandable
   description, rating breakdown bars + review cards + "view all
   reviews" bottom sheet, shipping/return/specs info, similar products
   row, and a sticky bottom Add-to-Cart bar with a quantity stepper and
   live total price — animated in with `flutter_animate`.
5. **Routing**: `AppRoutes.productDetails` is now a real path parameter
   route (`/product-details/:id`) with a `productDetailsPath(id)`
   helper; every "Opening {product}…" stub across Home, Categories, and
   Search now pushes here for real.
6. **Wishlist note**: the heart-toggle on this screen (and on
   `ProductCard` everywhere) is still local/presentation-only — the
   Wishlist build step replaces it with a shared, Firestore-backed
   cubit so favoriting a product anywhere in the app stays in sync.

## Next step (awaiting your confirmation)

**Wishlist** (replacing today's local-only favorite toggles with a real,
synced-to-Firestore implementation shared across Home/Categories/Search/
Product Details) and **Cart** (quantities, remove, coupons, tax/shipping
calculation, save-for-later) — the two screens every "Add to Cart" /
heart tap has been stubbed toward.
