# NovaCart 🛍️

A premium, production-grade Flutter e-commerce app.

## Status: Step 8 of N — Order History + Tracking, Saved Addresses ✅
(Steps 1–7 — Foundation/Splash, Onboarding/Auth, Home/Nav Shell, Categories/Search, Product Details, Wishlist/Cart, Checkout — are complete; summaries retained below.)

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

## Step 6 — Wishlist + Cart (this delivery)

**New folders**: `features/wishlist/{domain,data,presentation}`,
`features/cart/{domain,data,presentation}`. **New shared infrastructure**:
`ProductCatalogRepository` + `GetProductsByIdsUseCase` (in `product/domain`),
`CurrentUserService` (in `core/services`), `CartIconButton` (in `core/widgets`).

**The key shift in this step**: `WishlistCubit` and `CartCubit` are
registered as **app-wide singletons** (`registerLazySingleton`, not
`registerFactory`) and provided once at the root in `main.dart` —
unlike every cubit before them, which was a fresh instance per screen.
This is what makes favoriting a product on Home instantly show as
favorited on Search, Categories, Product Details, and the Wishlist tab
with zero manual refresh: every screen reads the *same* cubit instance.

1. **Wishlist**: Firestore-backed (`users/{uid}/wishlist/{productId}`),
   real-time via `watchWishlistIds()`, optimistic toggle (UI updates
   instantly, Firestore write happens in the background, the stream
   reconciles). `ensureStarted()` is idempotent and uid-aware — safe to
   call from every screen's `initState`, and correctly re-subscribes if
   a different user signs in. The Wishlist tab now shows real favorited
   products in a grid, with pull-to-refresh and a proper empty state.
2. **Cart**: Firestore-backed (`users/{uid}/cart` +
   `users/{uid}/savedForLater`), same live-sync pattern. `CartState`
   computes subtotal, coupon discount, shipping (free over EGP 1000,
   flat EGP 50 otherwise), 14% VAT, and total as pure getters — never
   stored, always derived from the current line items. Coupon codes
   (`NOVA10`, `NOVA20`, `WELCOME15`) are validated client-side for this
   demo; documented in-code as needing a server-side check (Cloud
   Function) before accepting real payments. Full Cart screen: item
   cards with quantity stepper/remove/save-for-later, a Saved for Later
   section with "Move to Cart", coupon input, order summary, and a
   sticky Checkout bar.
3. **Every screen updated**: Home, Categories, Search, and Product
   Details all now read favorite state from the shared `WishlistCubit`
   instead of local `Set<String>` state; Product Details' Add to Cart
   button calls the real `CartCubit.addItem()`; a new shared
   `CartIconButton` (icon + live item-count badge) replaces the
   "Cart — coming soon" stub in Home/Categories/Product Details app bars.
4. **Firestore setup**: two new subcollections per user —
   `users/{uid}/wishlist` and `users/{uid}/cart` /
   `users/{uid}/savedForLater`. Add rules restricting each to its owner,
   same pattern as the `users` collection rule from Step 2:
   ```
   match /users/{userId}/{collection}/{docId} {
     allow read, write: if request.auth != null && request.auth.uid == userId;
   }
   ```

## Step 7 — Checkout (this delivery)

**New folder**: `features/checkout/{domain,data,presentation}`. **Cart
extended**: added `clearCart()` (repository → data source → cubit),
called right after a successful order.

1. **Domain**: `AddressEntity`, `PaymentMethodType` (enum with
   label/subtitle/icon via extension — Cash on Delivery, Card, Apple
   Pay, Google Pay), `OrderItemEntity` (a **snapshot** — name/price/image
   copied at purchase time, deliberately not a live catalog reference,
   so order history stays accurate even if a product is later repriced
   or removed), `OrderEntity` (+ `OrderStatus` enum for the future Order
   Tracking step).
2. **`CheckoutCubit` is a per-session factory**, not a singleton like
   Wishlist/Cart — its state (current step, selected address/payment)
   has no reason to outlive one checkout attempt. It takes cart items
   and computed totals as *parameters* to `placeOrder()` rather than
   depending on `CartCubit` directly, keeping the two features
   decoupled — the page reads `CartCubit` and passes the data in.
3. **Screen**: a 3-step flow (Address → Payment → Review) with a
   progress header, address list + "Add New Address" bottom sheet
   (Firestore-backed, auto-selects the new one), 4 payment method tiles
   with a demo disclaimer for non-COD methods (card/Apple Pay/Google Pay
   are visual only — no real payment processing, clearly commented as
   the Stripe/PSP integration point), and a Review step reusing the
   same `OrderSummaryCard` from Cart. Placing an order writes to
   Firestore, clears the cart, and pushes an animated **Order
   Confirmation** screen (success checkmark, order summary, "Continue
   Shopping").
4. **Coupons carry through**: whatever coupon was applied in Cart
   travels with the order (`couponCode` field) so order history will
   later show exactly what discount was used.
5. **Firestore setup**: two more per-user subcollections —
   `users/{uid}/addresses` and `users/{uid}/orders` — same ownership
   rule pattern as before.

## Step 8 — Order History + Tracking, Saved Addresses (this delivery)

**New folder**: `features/orders/presentation/{cubit,pages,widgets}` —
presentation-only, deliberately reusing Checkout's `OrderRepository`/
`OrderEntity` rather than duplicating the order domain model. **New in
Checkout**: `AddressManagementCubit` (a generic address-book cubit,
distinct from `CheckoutCubit`'s session-scoped one) plus
`DeleteAddressUseCase`/`SetDefaultAddressUseCase`.

1. **A bug fix worth flagging**: `CheckoutCubit.placeOrder()` was
   emitting the pre-save `OrderEntity` (with an empty `id`) instead of
   the Firestore-assigned one returned by `PlaceOrderUseCase` — added
   `OrderEntity.copyWith()` and fixed the cubit to attach the real id.
   Without this, "View Order" and Order History navigation would have
   pushed to a non-existent order id.
2. **`OrderHistoryCubit`**: live list of the signed-in user's orders,
   newest first (Firestore `orderBy('createdAt', descending: true)`).
3. **`OrderDetailsCubit`**: takes an order id via GetIt's
   `registerFactoryParam` (`sl<OrderDetailsCubit>(param1: orderId)`) —
   the first parameterized DI registration in the app — and filters the
   same `watchOrders` stream to one order rather than adding a second
   Firestore read pattern for what's the same underlying data.
4. **`OrderStatusTimeline`**: a 4-stage visual tracker (Processing →
   Shipped → Out for Delivery → Delivered). Since there's no courier
   webhook/Cloud Function in this scaffold to push real status updates,
   progress is derived from elapsed time between `createdAt` and
   `estimatedDelivery` — clearly commented as a demo simulation to
   delete once real status updates land.
5. **Order History screen**: order cards (thumbnails, item count,
   status badge, total) → tap opens Order Tracking for that order.
6. **Saved Addresses screen** (Profile): full CRUD reusing Checkout's
   `AddressCard` and `showAddAddressSheet` widgets — swipe-to-delete,
   tap-to-set-default, empty state.
7. **Profile tiles wired for real**: "Order History" → Order History
   list, "Saved Addresses" → the new management screen. "Payment
   Methods" and "Help Center" remain clearly-labeled stubs for now.
8. **Order Confirmation's "View Order"** now pushes straight to that
   order's real tracking page instead of a snackbar stub.

## Next step (awaiting your confirmation)

**Notifications** (push notification handling + in-app notification
center, wiring up Firebase Cloud Messaging) and **remaining Profile
completion** (edit personal info, language switch, Help
Center/FAQ/Contact Support, Privacy Policy/Terms, app version, feedback
screen) — the last major pieces from the original feature list.
