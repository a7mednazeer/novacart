import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ko'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh')
  ];

  /// The app's name, shown on the splash screen
  ///
  /// In en, this message translates to:
  /// **'NovaCart'**
  String get appName;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get retry;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Shop smarter. Arrive faster.'**
  String get splashTagline;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Shop Everything,\nAll in One Place'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Desc.
  ///
  /// In en, this message translates to:
  /// **'Explore thousands of curated products across fashion, tech, home and more — all from one seamless app.'**
  String get onboarding1Desc;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Fast, Trackable\nDelivery'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Desc.
  ///
  /// In en, this message translates to:
  /// **'Get real-time order tracking and reliable delivery estimates, right from checkout to your doorstep.'**
  String get onboarding2Desc;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Secure & Trusted\nCheckout'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Desc.
  ///
  /// In en, this message translates to:
  /// **'Pay your way with bank-grade security — cards, wallets, or cash on delivery, your choice, every time.'**
  String get onboarding3Desc;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue shopping with NovaCart'**
  String get signInSubtitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get orContinueWith;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get noAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @joinNovaCart.
  ///
  /// In en, this message translates to:
  /// **'Join NovaCart'**
  String get joinNovaCart;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to start shopping smarter'**
  String get signUpSubtitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @agreeTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms & Conditions and Privacy Policy'**
  String get agreeTerms;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the email associated with your account and we\'ll send you a link to reset your password.'**
  String get resetPasswordSubtitle;

  /// No description provided for @resetLinkSentMessage.
  ///
  /// In en, this message translates to:
  /// **'We sent a password reset link to {email}. Follow the instructions in the email to set a new password.'**
  String resetLinkSentMessage(String email);

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @backToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign In'**
  String get backToSignIn;

  /// No description provided for @resendLink.
  ///
  /// In en, this message translates to:
  /// **'Resend Link'**
  String get resendLink;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get checkYourEmail;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get navCategories;

  /// No description provided for @navWishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get navWishlist;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'What do you search for?'**
  String get searchHint;

  /// No description provided for @categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesTitle;

  /// No description provided for @flashSaleTitle.
  ///
  /// In en, this message translates to:
  /// **'⚡ Flash Sale'**
  String get flashSaleTitle;

  /// No description provided for @bestSellersTitle.
  ///
  /// In en, this message translates to:
  /// **'🔥 Best Sellers'**
  String get bestSellersTitle;

  /// No description provided for @newArrivalsTitle.
  ///
  /// In en, this message translates to:
  /// **'✨ New Arrivals'**
  String get newArrivalsTitle;

  /// No description provided for @recommendedTitle.
  ///
  /// In en, this message translates to:
  /// **'Recommended for You'**
  String get recommendedTitle;

  /// No description provided for @recentlyViewedTitle.
  ///
  /// In en, this message translates to:
  /// **'Recently Viewed'**
  String get recentlyViewedTitle;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @cartTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartTitle;

  /// No description provided for @yourCartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartIsEmpty;

  /// No description provided for @addProductsMessage.
  ///
  /// In en, this message translates to:
  /// **'Add products to your cart to see them here.'**
  String get addProductsMessage;

  /// No description provided for @startShopping.
  ///
  /// In en, this message translates to:
  /// **'Start Shopping'**
  String get startShopping;

  /// No description provided for @savedForLaterSection.
  ///
  /// In en, this message translates to:
  /// **'Saved for Later'**
  String get savedForLaterSection;

  /// No description provided for @moveToCart.
  ///
  /// In en, this message translates to:
  /// **'Move to Cart'**
  String get moveToCart;

  /// No description provided for @saveForLater.
  ///
  /// In en, this message translates to:
  /// **'Save for Later'**
  String get saveForLater;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @discountLabel.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discountLabel;

  /// No description provided for @shippingLabel.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shippingLabel;

  /// No description provided for @freeLabel.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get freeLabel;

  /// No description provided for @vatLabel.
  ///
  /// In en, this message translates to:
  /// **'VAT (14%)'**
  String get vatLabel;

  /// No description provided for @totalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalLabel;

  /// No description provided for @estimatedDeliveryLabel.
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery: {date}'**
  String estimatedDeliveryLabel(String date);

  /// No description provided for @enterCouponCode.
  ///
  /// In en, this message translates to:
  /// **'Enter coupon code'**
  String get enterCouponCode;

  /// No description provided for @applyLabel.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applyLabel;

  /// No description provided for @couponApplied.
  ///
  /// In en, this message translates to:
  /// **'{code} applied'**
  String couponApplied(String code);

  /// No description provided for @wishlistTitle.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlistTitle;

  /// No description provided for @wishlistEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty'**
  String get wishlistEmptyTitle;

  /// No description provided for @wishlistEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Tap the heart on any product to save it here for later.'**
  String get wishlistEmptyMessage;

  /// No description provided for @browseProducts.
  ///
  /// In en, this message translates to:
  /// **'Browse Products'**
  String get browseProducts;

  /// No description provided for @shopNow.
  ///
  /// In en, this message translates to:
  /// **'Shop Now'**
  String get shopNow;

  /// No description provided for @browseAllIn.
  ///
  /// In en, this message translates to:
  /// **'Browse all products in {category}'**
  String browseAllIn(String category);

  /// No description provided for @searchResultsFor.
  ///
  /// In en, this message translates to:
  /// **'{count} results for \"{query}\"'**
  String searchResultsFor(int count, String query);

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @recentSearchesTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearchesTitle;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @trendingSearchesTitle.
  ///
  /// In en, this message translates to:
  /// **'Trending Searches'**
  String get trendingSearchesTitle;

  /// No description provided for @filterAndSort.
  ///
  /// In en, this message translates to:
  /// **'Filter & Sort'**
  String get filterAndSort;

  /// No description provided for @filtersCount.
  ///
  /// In en, this message translates to:
  /// **'Filters ({count})'**
  String filtersCount(int count);

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} item} other{{count} items}}'**
  String itemCount(int count);

  /// No description provided for @cartIsEmptyShort.
  ///
  /// In en, this message translates to:
  /// **'Cart is empty'**
  String get cartIsEmptyShort;

  /// No description provided for @moveItemsBackMessage.
  ///
  /// In en, this message translates to:
  /// **'Move items back from Saved for Later, or keep shopping.'**
  String get moveItemsBackMessage;

  /// No description provided for @savedForLaterCount.
  ///
  /// In en, this message translates to:
  /// **'Saved for Later ({count})'**
  String savedForLaterCount(int count);

  /// No description provided for @checkoutWithTotal.
  ///
  /// In en, this message translates to:
  /// **'Checkout · EGP {amount}'**
  String checkoutWithTotal(String amount);

  /// No description provided for @invalidCouponMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired coupon code'**
  String get invalidCouponMessage;

  /// No description provided for @productsCountLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} product} other{{count} products}}'**
  String productsCountLabel(int count);

  /// No description provided for @noProductsFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsFoundTitle;

  /// No description provided for @tryAdjustingFiltersMessage.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your filters to see more results.'**
  String get tryAdjustingFiltersMessage;

  /// No description provided for @clearFiltersLabel.
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get clearFiltersLabel;

  /// No description provided for @compareProductsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Compare products'**
  String get compareProductsTooltip;

  /// No description provided for @compareProductsWithCount.
  ///
  /// In en, this message translates to:
  /// **'Compare ({count})'**
  String compareProductsWithCount(int count);

  /// No description provided for @selectAtLeastTwoToCompare.
  ///
  /// In en, this message translates to:
  /// **'Select at least 2 to compare'**
  String get selectAtLeastTwoToCompare;

  /// No description provided for @noResultsForQuery.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find anything for \"{query}\". Try a different keyword.'**
  String noResultsForQuery(String query);

  /// No description provided for @noProductsMatchFiltersMessage.
  ///
  /// In en, this message translates to:
  /// **'No products match your filters. Try adjusting them.'**
  String get noProductsMatchFiltersMessage;

  /// No description provided for @searchFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Search products, brands…'**
  String get searchFieldHint;

  /// No description provided for @resetLabel.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetLabel;

  /// No description provided for @sortByLabel.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortByLabel;

  /// No description provided for @priceRangeLabel.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRangeLabel;

  /// No description provided for @minimumRatingLabel.
  ///
  /// In en, this message translates to:
  /// **'Minimum Rating'**
  String get minimumRatingLabel;

  /// No description provided for @anyLabel.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get anyLabel;

  /// No description provided for @brandLabel.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brandLabel;

  /// No description provided for @applyFiltersLabel.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFiltersLabel;

  /// No description provided for @sortRelevance.
  ///
  /// In en, this message translates to:
  /// **'Relevance'**
  String get sortRelevance;

  /// No description provided for @sortPriceLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: Low to High'**
  String get sortPriceLowToHigh;

  /// No description provided for @sortPriceHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Price: High to Low'**
  String get sortPriceHighToLow;

  /// No description provided for @sortRatingHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Highest Rated'**
  String get sortRatingHighToLow;

  /// No description provided for @sortNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest First'**
  String get sortNewest;

  /// No description provided for @productDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetailsTitle;

  /// No description provided for @descriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionLabel;

  /// No description provided for @noDescriptionAvailable.
  ///
  /// In en, this message translates to:
  /// **'No description available for this product yet.'**
  String get noDescriptionAvailable;

  /// No description provided for @readMoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMoreLabel;

  /// No description provided for @showLessLabel.
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLessLabel;

  /// No description provided for @sizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get sizeLabel;

  /// No description provided for @colorLabel.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get colorLabel;

  /// No description provided for @youMightAlsoLike.
  ///
  /// In en, this message translates to:
  /// **'You Might Also Like'**
  String get youMightAlsoLike;

  /// No description provided for @soldCountLabel.
  ///
  /// In en, this message translates to:
  /// **'{count} sold'**
  String soldCountLabel(int count);

  /// No description provided for @sharingProductMessage.
  ///
  /// In en, this message translates to:
  /// **'Sharing {name}…'**
  String sharingProductMessage(String name);

  /// No description provided for @addedToCartMessage.
  ///
  /// In en, this message translates to:
  /// **'Added {quantity}× {name} to cart'**
  String addedToCartMessage(int quantity, String name);

  /// No description provided for @addedToWishlistMessage.
  ///
  /// In en, this message translates to:
  /// **'Added to wishlist'**
  String get addedToWishlistMessage;

  /// No description provided for @removedFromWishlistMessage.
  ///
  /// In en, this message translates to:
  /// **'Removed from wishlist'**
  String get removedFromWishlistMessage;

  /// No description provided for @ratingsAndReviewsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ratings & Reviews'**
  String get ratingsAndReviewsTitle;

  /// No description provided for @reviewsCountLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} review} other{{count} reviews}}'**
  String reviewsCountLabel(int count);

  /// No description provided for @viewAllReviewsLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{View 1 review} other{View all {count} reviews}}'**
  String viewAllReviewsLabel(int count);

  /// No description provided for @estimatedDeliveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery'**
  String get estimatedDeliveryTitle;

  /// No description provided for @arrivesByMessage.
  ///
  /// In en, this message translates to:
  /// **'Arrives by {date} if ordered today'**
  String arrivesByMessage(String date);

  /// No description provided for @freeReturnsTitle.
  ///
  /// In en, this message translates to:
  /// **'Free returns'**
  String get freeReturnsTitle;

  /// No description provided for @freeReturnsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'30-day return window, no questions asked'**
  String get freeReturnsSubtitle;

  /// No description provided for @secureCheckoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Secure checkout'**
  String get secureCheckoutTitle;

  /// No description provided for @secureCheckoutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery, cards, and digital wallets accepted'**
  String get secureCheckoutSubtitle;

  /// No description provided for @specificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Specifications'**
  String get specificationsTitle;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// No description provided for @availableColorsLabel.
  ///
  /// In en, this message translates to:
  /// **'Available Colors'**
  String get availableColorsLabel;

  /// No description provided for @availableColorsValue.
  ///
  /// In en, this message translates to:
  /// **'{count} options'**
  String availableColorsValue(int count);

  /// No description provided for @availableSizesLabel.
  ///
  /// In en, this message translates to:
  /// **'Available Sizes'**
  String get availableSizesLabel;

  /// No description provided for @unitsSoldLabel.
  ///
  /// In en, this message translates to:
  /// **'Units Sold'**
  String get unitsSoldLabel;

  /// No description provided for @unitsSoldValue.
  ///
  /// In en, this message translates to:
  /// **'{count}+'**
  String unitsSoldValue(int count);

  /// No description provided for @todayLabel.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayLabel;

  /// No description provided for @daysAgoLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 day ago} other{{count} days ago}}'**
  String daysAgoLabel(int count);

  /// No description provided for @monthsAgoLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 month ago} other{{count} months ago}}'**
  String monthsAgoLabel(int count);

  /// No description provided for @allReviewsTitle.
  ///
  /// In en, this message translates to:
  /// **'All Reviews ({count})'**
  String allReviewsTitle(int count);

  /// No description provided for @addToCartWithTotal.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart · EGP {amount}'**
  String addToCartWithTotal(String amount);

  /// No description provided for @paymentCashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get paymentCashOnDelivery;

  /// No description provided for @paymentCard.
  ///
  /// In en, this message translates to:
  /// **'Credit / Debit Card'**
  String get paymentCard;

  /// No description provided for @paymentApplePay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get paymentApplePay;

  /// No description provided for @paymentGooglePay.
  ///
  /// In en, this message translates to:
  /// **'Google Pay'**
  String get paymentGooglePay;

  /// No description provided for @paymentCodSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pay when your order arrives'**
  String get paymentCodSubtitle;

  /// No description provided for @paymentCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Visa, Mastercard, and more'**
  String get paymentCardSubtitle;

  /// No description provided for @paymentApplePaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pay instantly with Face ID / Touch ID'**
  String get paymentApplePaySubtitle;

  /// No description provided for @paymentGooglePaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pay instantly with your Google account'**
  String get paymentGooglePaySubtitle;

  /// No description provided for @orderStatusProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get orderStatusProcessing;

  /// No description provided for @orderStatusShipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get orderStatusShipped;

  /// No description provided for @orderStatusOutForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Out for Delivery'**
  String get orderStatusOutForDelivery;

  /// No description provided for @orderStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get orderStatusDelivered;

  /// No description provided for @orderStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get orderStatusCancelled;

  /// No description provided for @checkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// No description provided for @selectShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Select a shipping address'**
  String get selectShippingAddress;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addNewAddress;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select a payment method'**
  String get selectPaymentMethod;

  /// No description provided for @demoCheckoutDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is a demo checkout — no real payment will be charged.'**
  String get demoCheckoutDisclaimer;

  /// No description provided for @stepAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get stepAddressLabel;

  /// No description provided for @stepPaymentLabel.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get stepPaymentLabel;

  /// No description provided for @stepReviewLabel.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get stepReviewLabel;

  /// No description provided for @changeLabel.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeLabel;

  /// No description provided for @shippingToLabel.
  ///
  /// In en, this message translates to:
  /// **'Shipping to'**
  String get shippingToLabel;

  /// No description provided for @backLabel.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backLabel;

  /// No description provided for @placeOrderWithTotal.
  ///
  /// In en, this message translates to:
  /// **'Place Order · EGP {amount}'**
  String placeOrderWithTotal(String amount);

  /// No description provided for @defaultLabel.
  ///
  /// In en, this message translates to:
  /// **'DEFAULT'**
  String get defaultLabel;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberLabel;

  /// No description provided for @addressHintLabel.
  ///
  /// In en, this message translates to:
  /// **'Street, building, apartment number'**
  String get addressHintLabel;

  /// No description provided for @cityLabel.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get cityLabel;

  /// No description provided for @saveAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get saveAddressLabel;

  /// No description provided for @orderPlacedTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Placed!'**
  String get orderPlacedTitle;

  /// No description provided for @orderConfirmedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your order #{orderId} has been confirmed.'**
  String orderConfirmedMessage(String orderId);

  /// No description provided for @itemsLabel.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get itemsLabel;

  /// No description provided for @totalPaidLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Paid'**
  String get totalPaidLabel;

  /// No description provided for @continueShoppingLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShoppingLabel;

  /// No description provided for @viewOrderLabel.
  ///
  /// In en, this message translates to:
  /// **'View Order'**
  String get viewOrderLabel;

  /// No description provided for @orderTrackingTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Tracking'**
  String get orderTrackingTitle;

  /// No description provided for @orderHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistoryTitle;

  /// No description provided for @orderNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Order not found'**
  String get orderNotFoundTitle;

  /// No description provided for @orderNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find this order.'**
  String get orderNotFoundMessage;

  /// No description provided for @backToOrdersLabel.
  ///
  /// In en, this message translates to:
  /// **'Back to Orders'**
  String get backToOrdersLabel;

  /// No description provided for @noOrdersYetTitle.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get noOrdersYetTitle;

  /// No description provided for @noOrdersYetMessage.
  ///
  /// In en, this message translates to:
  /// **'Your past orders will show up here once you place one.'**
  String get noOrdersYetMessage;

  /// No description provided for @itemsWithCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Items ({count})'**
  String itemsWithCountLabel(int count);

  /// No description provided for @qtyLabel.
  ///
  /// In en, this message translates to:
  /// **'Qty {count}'**
  String qtyLabel(int count);

  /// No description provided for @shippingAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shippingAddressTitle;

  /// No description provided for @paymentMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethodTitle;

  /// No description provided for @orderCancelledMessage.
  ///
  /// In en, this message translates to:
  /// **'This order was cancelled.'**
  String get orderCancelledMessage;

  /// No description provided for @orderNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Order #{id}'**
  String orderNumberLabel(String id);

  /// No description provided for @moreItemsCount.
  ///
  /// In en, this message translates to:
  /// **'+{count}'**
  String moreItemsCount(int count);

  /// No description provided for @dateWithItemCount.
  ///
  /// In en, this message translates to:
  /// **'{date} · {itemText}'**
  String dateWithItemCount(String date, String itemText);

  /// No description provided for @stageProcessingTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Processing'**
  String get stageProcessingTitle;

  /// No description provided for @stageProcessingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ve received your order'**
  String get stageProcessingSubtitle;

  /// No description provided for @stageShippedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your order has left our warehouse'**
  String get stageShippedSubtitle;

  /// No description provided for @stageOutForDeliverySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your order is on its way'**
  String get stageOutForDeliverySubtitle;

  /// No description provided for @stageDeliveredSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your order!'**
  String get stageDeliveredSubtitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @markAllReadLabel.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get markAllReadLabel;

  /// No description provided for @noNotificationsYetTitle.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotificationsYetTitle;

  /// No description provided for @noNotificationsYetMessage.
  ///
  /// In en, this message translates to:
  /// **'Order updates and promotions will show up here.'**
  String get noNotificationsYetMessage;

  /// No description provided for @minutesAgoShort.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String minutesAgoShort(int count);

  /// No description provided for @hoursAgoShort.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String hoursAgoShort(int count);

  /// No description provided for @daysAgoShort.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String daysAgoShort(int count);

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @yourNovaCartAccount.
  ///
  /// In en, this message translates to:
  /// **'Your NovaCart Account'**
  String get yourNovaCartAccount;

  /// No description provided for @tapToEditProfileMessage.
  ///
  /// In en, this message translates to:
  /// **'Tap to edit your name & phone number'**
  String get tapToEditProfileMessage;

  /// No description provided for @darkModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkModeLabel;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @savedAddressesLabel.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddressesLabel;

  /// No description provided for @paymentMethodsLabel.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethodsLabel;

  /// No description provided for @helpCenterLabel.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenterLabel;

  /// No description provided for @privacyPolicyLabel.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyLabel;

  /// No description provided for @termsConditionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditionsLabel;

  /// No description provided for @signOutLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOutLabel;

  /// No description provided for @biometricConfirmReason.
  ///
  /// In en, this message translates to:
  /// **'Confirm to enable biometric login'**
  String get biometricConfirmReason;

  /// No description provided for @biometricLoginLabel.
  ///
  /// In en, this message translates to:
  /// **'Biometric Login'**
  String get biometricLoginLabel;

  /// No description provided for @biometricLoginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Require Face ID / Touch ID to open the app'**
  String get biometricLoginSubtitle;

  /// No description provided for @comingSoonSuffix.
  ///
  /// In en, this message translates to:
  /// **'{feature} — coming soon'**
  String comingSoonSuffix(String feature);

  /// No description provided for @editProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileTitle;

  /// No description provided for @profileUpdatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileUpdatedMessage;

  /// No description provided for @saveChangesLabel.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesLabel;

  /// No description provided for @rtlNoteMessage.
  ///
  /// In en, this message translates to:
  /// **'Layout direction updates instantly. Full Arabic text translation is coming in a future update.'**
  String get rtlNoteMessage;

  /// No description provided for @noSavedAddressesTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved addresses'**
  String get noSavedAddressesTitle;

  /// No description provided for @noSavedAddressesMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a shipping address to speed up checkout next time.'**
  String get noSavedAddressesMessage;

  /// No description provided for @helpCenterFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get helpCenterFaqTitle;

  /// No description provided for @faqQ1.
  ///
  /// In en, this message translates to:
  /// **'How do I track my order?'**
  String get faqQ1;

  /// No description provided for @faqA1.
  ///
  /// In en, this message translates to:
  /// **'Go to Profile → Order History, tap any order to see its live status timeline.'**
  String get faqA1;

  /// No description provided for @faqQ2.
  ///
  /// In en, this message translates to:
  /// **'What payment methods are accepted?'**
  String get faqQ2;

  /// No description provided for @faqA2.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery, Credit/Debit Card, Apple Pay, and Google Pay.'**
  String get faqA2;

  /// No description provided for @faqQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I return an item?'**
  String get faqQ3;

  /// No description provided for @faqA3.
  ///
  /// In en, this message translates to:
  /// **'Items are eligible for return within 30 days of delivery. Contact support from this screen to start a return.'**
  String get faqA3;

  /// No description provided for @faqQ4.
  ///
  /// In en, this message translates to:
  /// **'How long does delivery take?'**
  String get faqQ4;

  /// No description provided for @faqA4.
  ///
  /// In en, this message translates to:
  /// **'Most orders arrive within 3-5 business days. You\'ll see an estimated delivery date at checkout and in your order tracking.'**
  String get faqA4;

  /// No description provided for @faqQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I apply a coupon code?'**
  String get faqQ5;

  /// No description provided for @faqA5.
  ///
  /// In en, this message translates to:
  /// **'Enter it in the Cart screen just above the order summary, then tap Apply.'**
  String get faqA5;

  /// No description provided for @stillNeedHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Still need help?'**
  String get stillNeedHelpTitle;

  /// No description provided for @contactSupportLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupportLabel;

  /// No description provided for @aboutFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'About & Feedback'**
  String get aboutFeedbackTitle;

  /// No description provided for @loadingVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Loading version…'**
  String get loadingVersionLabel;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionLabel(String version);

  /// No description provided for @sendUsFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Send us feedback'**
  String get sendUsFeedbackTitle;

  /// No description provided for @feedbackIntroMessage.
  ///
  /// In en, this message translates to:
  /// **'Found a bug or have an idea to make NovaCart better? We read every message.'**
  String get feedbackIntroMessage;

  /// No description provided for @feedbackHintText.
  ///
  /// In en, this message translates to:
  /// **'Tell us what you think…'**
  String get feedbackHintText;

  /// No description provided for @submitFeedbackLabel.
  ///
  /// In en, this message translates to:
  /// **'Submit Feedback'**
  String get submitFeedbackLabel;

  /// No description provided for @feedbackThanksMessage.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your feedback!'**
  String get feedbackThanksMessage;

  /// No description provided for @feedbackErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not submit feedback. Please try again.'**
  String get feedbackErrorMessage;

  /// No description provided for @privacySection1Heading.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect'**
  String get privacySection1Heading;

  /// No description provided for @privacySection1Body.
  ///
  /// In en, this message translates to:
  /// **'We collect the information you provide directly (name, email, phone, shipping addresses) and information generated by using the app (order history, wishlist, browsing activity) to operate NovaCart.'**
  String get privacySection1Body;

  /// No description provided for @privacySection2Heading.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Information'**
  String get privacySection2Heading;

  /// No description provided for @privacySection2Body.
  ///
  /// In en, this message translates to:
  /// **'Your information is used to process orders, provide customer support, personalize product recommendations, and send order/promotional notifications you can opt out of at any time.'**
  String get privacySection2Body;

  /// No description provided for @privacySection3Heading.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get privacySection3Heading;

  /// No description provided for @privacySection3Body.
  ///
  /// In en, this message translates to:
  /// **'All data is stored using Firebase\'s secure infrastructure with per-user access rules — no other user or unauthenticated request can read your orders, addresses, or wishlist.'**
  String get privacySection3Body;

  /// No description provided for @privacySection4Heading.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get privacySection4Heading;

  /// No description provided for @privacySection4Body.
  ///
  /// In en, this message translates to:
  /// **'You can edit or delete your personal information, saved addresses, and account at any time from the Profile section.'**
  String get privacySection4Body;

  /// No description provided for @termsSection1Heading.
  ///
  /// In en, this message translates to:
  /// **'Acceptance of Terms'**
  String get termsSection1Heading;

  /// No description provided for @termsSection1Body.
  ///
  /// In en, this message translates to:
  /// **'By creating a NovaCart account or placing an order, you agree to these Terms & Conditions.'**
  String get termsSection1Body;

  /// No description provided for @termsSection2Heading.
  ///
  /// In en, this message translates to:
  /// **'Orders & Payment'**
  String get termsSection2Heading;

  /// No description provided for @termsSection2Body.
  ///
  /// In en, this message translates to:
  /// **'All orders are subject to product availability. Prices are shown in EGP and include any applicable taxes at checkout.'**
  String get termsSection2Body;

  /// No description provided for @termsSection3Heading.
  ///
  /// In en, this message translates to:
  /// **'Shipping & Returns'**
  String get termsSection3Heading;

  /// No description provided for @termsSection3Body.
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery windows are shown at checkout. Items may be returned within 30 days of delivery in original condition.'**
  String get termsSection3Body;

  /// No description provided for @termsSection4Heading.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get termsSection4Heading;

  /// No description provided for @termsSection4Body.
  ///
  /// In en, this message translates to:
  /// **'NovaCart is not liable for indirect or consequential damages arising from the use of this app, to the maximum extent permitted by law.'**
  String get termsSection4Body;

  /// No description provided for @unlockNovaCartTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock NovaCart'**
  String get unlockNovaCartTitle;

  /// No description provided for @waitingForAuthMessage.
  ///
  /// In en, this message translates to:
  /// **'Waiting for authentication…'**
  String get waitingForAuthMessage;

  /// No description provided for @couldntVerifyMessage.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t verify it\'s you'**
  String get couldntVerifyMessage;

  /// No description provided for @useFaceIdMessage.
  ///
  /// In en, this message translates to:
  /// **'Use Face ID, Touch ID, or your device PIN to continue.'**
  String get useFaceIdMessage;

  /// No description provided for @signInWithPasswordInstead.
  ///
  /// In en, this message translates to:
  /// **'Sign in with password instead'**
  String get signInWithPasswordInstead;

  /// No description provided for @voiceSearchComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Voice search is coming in a future update'**
  String get voiceSearchComingSoon;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your full name'**
  String get fullNameHint;

  /// No description provided for @compareProductsTitle.
  ///
  /// In en, this message translates to:
  /// **'Compare Products'**
  String get compareProductsTitle;

  /// No description provided for @selectToCompare.
  ///
  /// In en, this message translates to:
  /// **'Select 2-{max} products to compare'**
  String selectToCompare(int max);

  /// No description provided for @nothingToCompareTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing to compare yet'**
  String get nothingToCompareTitle;

  /// No description provided for @nothingToCompareMessage.
  ///
  /// In en, this message translates to:
  /// **'Select 2-3 products from a category to compare them side by side.'**
  String get nothingToCompareMessage;

  /// No description provided for @browseCategoriesLabel.
  ///
  /// In en, this message translates to:
  /// **'Browse Categories'**
  String get browseCategoriesLabel;

  /// No description provided for @priceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get priceLabel;

  /// No description provided for @ratingLabel.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get ratingLabel;

  /// No description provided for @colorsLabel.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get colorsLabel;

  /// No description provided for @sizesLabel.
  ///
  /// In en, this message translates to:
  /// **'Sizes'**
  String get sizesLabel;

  /// No description provided for @supportChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Support Chat'**
  String get supportChatTitle;

  /// No description provided for @typeMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Type a message…'**
  String get typeMessageHint;

  /// No description provided for @categoryWomensFashion.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Fashion'**
  String get categoryWomensFashion;

  /// No description provided for @categoryMensFashion.
  ///
  /// In en, this message translates to:
  /// **'Men\'s Fashion'**
  String get categoryMensFashion;

  /// No description provided for @categorySkincare.
  ///
  /// In en, this message translates to:
  /// **'Skincare'**
  String get categorySkincare;

  /// No description provided for @categoryBeauty.
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get categoryBeauty;

  /// No description provided for @categoryHeadphones.
  ///
  /// In en, this message translates to:
  /// **'Headphones'**
  String get categoryHeadphones;

  /// No description provided for @categoryCameras.
  ///
  /// In en, this message translates to:
  /// **'Cameras'**
  String get categoryCameras;

  /// No description provided for @categoryLaptopsElectronics.
  ///
  /// In en, this message translates to:
  /// **'Laptops & Electronics'**
  String get categoryLaptopsElectronics;

  /// No description provided for @categoryBabyToys.
  ///
  /// In en, this message translates to:
  /// **'Baby & Toys'**
  String get categoryBabyToys;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'it',
        'ko',
        'nl',
        'pt',
        'ru',
        'tr',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
