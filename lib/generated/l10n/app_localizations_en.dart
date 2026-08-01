// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Continue';

  @override
  String get cancel => 'Cancel';

  @override
  String get retry => 'Try Again';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get splashTagline => 'Shop smarter. Arrive faster.';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboarding1Title => 'Shop Everything,\nAll in One Place';

  @override
  String get onboarding1Desc =>
      'Explore thousands of curated products across fashion, tech, home and more — all from one seamless app.';

  @override
  String get onboarding2Title => 'Fast, Trackable\nDelivery';

  @override
  String get onboarding2Desc =>
      'Get real-time order tracking and reliable delivery estimates, right from checkout to your doorstep.';

  @override
  String get onboarding3Title => 'Secure & Trusted\nCheckout';

  @override
  String get onboarding3Desc =>
      'Pay your way with bank-grade security — cards, wallets, or cash on delivery, your choice, every time.';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get signInSubtitle => 'Sign in to continue shopping with NovaCart';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'you@example.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get signIn => 'Sign In';

  @override
  String get orContinueWith => 'or continue with';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get noAccount => 'Don\'t have an account? ';

  @override
  String get createAccount => 'Create Account';

  @override
  String get joinNovaCart => 'Join NovaCart';

  @override
  String get signUpSubtitle => 'Create an account to start shopping smarter';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get agreeTerms =>
      'I agree to the Terms & Conditions and Privacy Policy';

  @override
  String get resetPasswordTitle => 'Reset your password';

  @override
  String get resetPasswordSubtitle =>
      'Enter the email associated with your account and we\'ll send you a link to reset your password.';

  @override
  String resetLinkSentMessage(String email) {
    return 'We sent a password reset link to $email. Follow the instructions in the email to set a new password.';
  }

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get backToSignIn => 'Back to Sign In';

  @override
  String get resendLink => 'Resend Link';

  @override
  String get checkYourEmail => 'Check your email';

  @override
  String get navHome => 'Home';

  @override
  String get navCategories => 'Categories';

  @override
  String get navWishlist => 'Wishlist';

  @override
  String get navProfile => 'Profile';

  @override
  String get searchHint => 'What do you search for?';

  @override
  String get categoriesTitle => 'Categories';

  @override
  String get flashSaleTitle => '⚡ Flash Sale';

  @override
  String get bestSellersTitle => '🔥 Best Sellers';

  @override
  String get newArrivalsTitle => '✨ New Arrivals';

  @override
  String get recommendedTitle => 'Recommended for You';

  @override
  String get recentlyViewedTitle => 'Recently Viewed';

  @override
  String get viewAll => 'View all';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get cartTitle => 'Cart';

  @override
  String get yourCartIsEmpty => 'Your cart is empty';

  @override
  String get addProductsMessage =>
      'Add products to your cart to see them here.';

  @override
  String get startShopping => 'Start Shopping';

  @override
  String get savedForLaterSection => 'Saved for Later';

  @override
  String get moveToCart => 'Move to Cart';

  @override
  String get saveForLater => 'Save for Later';

  @override
  String get checkout => 'Checkout';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get discountLabel => 'Discount';

  @override
  String get shippingLabel => 'Shipping';

  @override
  String get freeLabel => 'Free';

  @override
  String get vatLabel => 'VAT (14%)';

  @override
  String get totalLabel => 'Total';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Estimated delivery: $date';
  }

  @override
  String get enterCouponCode => 'Enter coupon code';

  @override
  String get applyLabel => 'Apply';

  @override
  String couponApplied(String code) {
    return '$code applied';
  }

  @override
  String get wishlistTitle => 'Wishlist';

  @override
  String get wishlistEmptyTitle => 'Your wishlist is empty';

  @override
  String get wishlistEmptyMessage =>
      'Tap the heart on any product to save it here for later.';

  @override
  String get browseProducts => 'Browse Products';

  @override
  String get shopNow => 'Shop Now';

  @override
  String browseAllIn(String category) {
    return 'Browse all products in $category';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count results for \"$query\"';
  }

  @override
  String get noResultsFound => 'No results found';

  @override
  String get recentSearchesTitle => 'Recent Searches';

  @override
  String get clearAll => 'Clear All';

  @override
  String get trendingSearchesTitle => 'Trending Searches';

  @override
  String get filterAndSort => 'Filter & Sort';

  @override
  String filtersCount(int count) {
    return 'Filters ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Cart is empty';

  @override
  String get moveItemsBackMessage =>
      'Move items back from Saved for Later, or keep shopping.';

  @override
  String savedForLaterCount(int count) {
    return 'Saved for Later ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Checkout · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Invalid or expired coupon code';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count products',
      one: '$count product',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'No products found';

  @override
  String get tryAdjustingFiltersMessage =>
      'Try adjusting your filters to see more results.';

  @override
  String get clearFiltersLabel => 'Clear Filters';

  @override
  String get compareProductsTooltip => 'Compare products';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'We couldn\'t find anything for \"$query\". Try a different keyword.';
  }

  @override
  String get noProductsMatchFiltersMessage =>
      'No products match your filters. Try adjusting them.';

  @override
  String get searchFieldHint => 'Search products, brands…';

  @override
  String get resetLabel => 'Reset';

  @override
  String get sortByLabel => 'Sort By';

  @override
  String get priceRangeLabel => 'Price Range';

  @override
  String get minimumRatingLabel => 'Minimum Rating';

  @override
  String get anyLabel => 'Any';

  @override
  String get brandLabel => 'Brand';

  @override
  String get applyFiltersLabel => 'Apply Filters';

  @override
  String get sortRelevance => 'Relevance';

  @override
  String get sortPriceLowToHigh => 'Price: Low to High';

  @override
  String get sortPriceHighToLow => 'Price: High to Low';

  @override
  String get sortRatingHighToLow => 'Highest Rated';

  @override
  String get sortNewest => 'Newest First';

  @override
  String get productDetailsTitle => 'Product Details';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get noDescriptionAvailable =>
      'No description available for this product yet.';

  @override
  String get readMoreLabel => 'Read More';

  @override
  String get showLessLabel => 'Show Less';

  @override
  String get sizeLabel => 'Size';

  @override
  String get colorLabel => 'Color';

  @override
  String get youMightAlsoLike => 'You Might Also Like';

  @override
  String soldCountLabel(int count) {
    return '$count sold';
  }

  @override
  String sharingProductMessage(String name) {
    return 'Sharing $name…';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return 'Added $quantity× $name to cart';
  }

  @override
  String get addedToWishlistMessage => 'Added to wishlist';

  @override
  String get removedFromWishlistMessage => 'Removed from wishlist';

  @override
  String get ratingsAndReviewsTitle => 'Ratings & Reviews';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '$count review',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'View all $count reviews',
      one: 'View 1 review',
    );
    return '$_temp0';
  }

  @override
  String get estimatedDeliveryTitle => 'Estimated delivery';

  @override
  String arrivesByMessage(String date) {
    return 'Arrives by $date if ordered today';
  }

  @override
  String get freeReturnsTitle => 'Free returns';

  @override
  String get freeReturnsSubtitle => '30-day return window, no questions asked';

  @override
  String get secureCheckoutTitle => 'Secure checkout';

  @override
  String get secureCheckoutSubtitle =>
      'Cash on delivery, cards, and digital wallets accepted';

  @override
  String get specificationsTitle => 'Specifications';

  @override
  String get categoryLabel => 'Category';

  @override
  String get availableColorsLabel => 'Available Colors';

  @override
  String availableColorsValue(int count) {
    return '$count options';
  }

  @override
  String get availableSizesLabel => 'Available Sizes';

  @override
  String get unitsSoldLabel => 'Units Sold';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => 'Today';

  @override
  String daysAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String monthsAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months ago',
      one: '1 month ago',
    );
    return '$_temp0';
  }

  @override
  String allReviewsTitle(int count) {
    return 'All Reviews ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Add to Cart · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Cash on Delivery';

  @override
  String get paymentCard => 'Credit / Debit Card';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Pay when your order arrives';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard, and more';

  @override
  String get paymentApplePaySubtitle => 'Pay instantly with Face ID / Touch ID';

  @override
  String get paymentGooglePaySubtitle =>
      'Pay instantly with your Google account';

  @override
  String get orderStatusProcessing => 'Processing';

  @override
  String get orderStatusShipped => 'Shipped';

  @override
  String get orderStatusOutForDelivery => 'Out for Delivery';

  @override
  String get orderStatusDelivered => 'Delivered';

  @override
  String get orderStatusCancelled => 'Cancelled';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get selectShippingAddress => 'Select a shipping address';

  @override
  String get addNewAddress => 'Add New Address';

  @override
  String get selectPaymentMethod => 'Select a payment method';

  @override
  String get demoCheckoutDisclaimer =>
      'This is a demo checkout — no real payment will be charged.';

  @override
  String get stepAddressLabel => 'Address';

  @override
  String get stepPaymentLabel => 'Payment';

  @override
  String get stepReviewLabel => 'Review';

  @override
  String get changeLabel => 'Change';

  @override
  String get shippingToLabel => 'Shipping to';

  @override
  String get backLabel => 'Back';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Place Order · EGP $amount';
  }

  @override
  String get defaultLabel => 'DEFAULT';

  @override
  String get phoneNumberLabel => 'Phone Number';

  @override
  String get addressHintLabel => 'Street, building, apartment number';

  @override
  String get cityLabel => 'City';

  @override
  String get saveAddressLabel => 'Save Address';

  @override
  String get orderPlacedTitle => 'Order Placed!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Your order #$orderId has been confirmed.';
  }

  @override
  String get itemsLabel => 'Items';

  @override
  String get totalPaidLabel => 'Total Paid';

  @override
  String get continueShoppingLabel => 'Continue Shopping';

  @override
  String get viewOrderLabel => 'View Order';

  @override
  String get orderTrackingTitle => 'Order Tracking';

  @override
  String get orderHistoryTitle => 'Order History';

  @override
  String get orderNotFoundTitle => 'Order not found';

  @override
  String get orderNotFoundMessage => 'We couldn\'t find this order.';

  @override
  String get backToOrdersLabel => 'Back to Orders';

  @override
  String get noOrdersYetTitle => 'No orders yet';

  @override
  String get noOrdersYetMessage =>
      'Your past orders will show up here once you place one.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Items ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Qty $count';
  }

  @override
  String get shippingAddressTitle => 'Shipping Address';

  @override
  String get paymentMethodTitle => 'Payment Method';

  @override
  String get orderCancelledMessage => 'This order was cancelled.';

  @override
  String orderNumberLabel(String id) {
    return 'Order #$id';
  }

  @override
  String moreItemsCount(int count) {
    return '+$count';
  }

  @override
  String dateWithItemCount(String date, String itemText) {
    return '$date · $itemText';
  }

  @override
  String get stageProcessingTitle => 'Order Processing';

  @override
  String get stageProcessingSubtitle => 'We\'ve received your order';

  @override
  String get stageShippedSubtitle => 'Your order has left our warehouse';

  @override
  String get stageOutForDeliverySubtitle => 'Your order is on its way';

  @override
  String get stageDeliveredSubtitle => 'Enjoy your order!';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get markAllReadLabel => 'Mark all read';

  @override
  String get noNotificationsYetTitle => 'No notifications yet';

  @override
  String get noNotificationsYetMessage =>
      'Order updates and promotions will show up here.';

  @override
  String minutesAgoShort(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgoShort(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgoShort(int count) {
    return '${count}d ago';
  }

  @override
  String get profileTitle => 'Profile';

  @override
  String get yourNovaCartAccount => 'Your NovaCart Account';

  @override
  String get tapToEditProfileMessage => 'Tap to edit your name & phone number';

  @override
  String get darkModeLabel => 'Dark Mode';

  @override
  String get languageLabel => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Saved Addresses';

  @override
  String get paymentMethodsLabel => 'Payment Methods';

  @override
  String get helpCenterLabel => 'Help Center';

  @override
  String get privacyPolicyLabel => 'Privacy Policy';

  @override
  String get termsConditionsLabel => 'Terms & Conditions';

  @override
  String get signOutLabel => 'Sign Out';

  @override
  String get biometricConfirmReason => 'Confirm to enable biometric login';

  @override
  String get biometricLoginLabel => 'Biometric Login';

  @override
  String get biometricLoginSubtitle =>
      'Require Face ID / Touch ID to open the app';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — coming soon';
  }

  @override
  String get editProfileTitle => 'Edit Profile';

  @override
  String get profileUpdatedMessage => 'Profile updated';

  @override
  String get saveChangesLabel => 'Save Changes';

  @override
  String get rtlNoteMessage =>
      'Layout direction updates instantly. Full Arabic text translation is coming in a future update.';

  @override
  String get noSavedAddressesTitle => 'No saved addresses';

  @override
  String get noSavedAddressesMessage =>
      'Add a shipping address to speed up checkout next time.';

  @override
  String get helpCenterFaqTitle => 'Frequently Asked Questions';

  @override
  String get faqQ1 => 'How do I track my order?';

  @override
  String get faqA1 =>
      'Go to Profile → Order History, tap any order to see its live status timeline.';

  @override
  String get faqQ2 => 'What payment methods are accepted?';

  @override
  String get faqA2 =>
      'Cash on Delivery, Credit/Debit Card, Apple Pay, and Google Pay.';

  @override
  String get faqQ3 => 'How do I return an item?';

  @override
  String get faqA3 =>
      'Items are eligible for return within 30 days of delivery. Contact support from this screen to start a return.';

  @override
  String get faqQ4 => 'How long does delivery take?';

  @override
  String get faqA4 =>
      'Most orders arrive within 3-5 business days. You\'ll see an estimated delivery date at checkout and in your order tracking.';

  @override
  String get faqQ5 => 'How do I apply a coupon code?';

  @override
  String get faqA5 =>
      'Enter it in the Cart screen just above the order summary, then tap Apply.';

  @override
  String get stillNeedHelpTitle => 'Still need help?';

  @override
  String get contactSupportLabel => 'Contact Support';

  @override
  String get aboutFeedbackTitle => 'About & Feedback';

  @override
  String get loadingVersionLabel => 'Loading version…';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Send us feedback';

  @override
  String get feedbackIntroMessage =>
      'Found a bug or have an idea to make NovaCart better? We read every message.';

  @override
  String get feedbackHintText => 'Tell us what you think…';

  @override
  String get submitFeedbackLabel => 'Submit Feedback';

  @override
  String get feedbackThanksMessage => 'Thanks for your feedback!';

  @override
  String get feedbackErrorMessage =>
      'Could not submit feedback. Please try again.';

  @override
  String get privacySection1Heading => 'Information We Collect';

  @override
  String get privacySection1Body =>
      'We collect the information you provide directly (name, email, phone, shipping addresses) and information generated by using the app (order history, wishlist, browsing activity) to operate NovaCart.';

  @override
  String get privacySection2Heading => 'How We Use Your Information';

  @override
  String get privacySection2Body =>
      'Your information is used to process orders, provide customer support, personalize product recommendations, and send order/promotional notifications you can opt out of at any time.';

  @override
  String get privacySection3Heading => 'Data Security';

  @override
  String get privacySection3Body =>
      'All data is stored using Firebase\'s secure infrastructure with per-user access rules — no other user or unauthenticated request can read your orders, addresses, or wishlist.';

  @override
  String get privacySection4Heading => 'Your Rights';

  @override
  String get privacySection4Body =>
      'You can edit or delete your personal information, saved addresses, and account at any time from the Profile section.';

  @override
  String get termsSection1Heading => 'Acceptance of Terms';

  @override
  String get termsSection1Body =>
      'By creating a NovaCart account or placing an order, you agree to these Terms & Conditions.';

  @override
  String get termsSection2Heading => 'Orders & Payment';

  @override
  String get termsSection2Body =>
      'All orders are subject to product availability. Prices are shown in EGP and include any applicable taxes at checkout.';

  @override
  String get termsSection3Heading => 'Shipping & Returns';

  @override
  String get termsSection3Body =>
      'Estimated delivery windows are shown at checkout. Items may be returned within 30 days of delivery in original condition.';

  @override
  String get termsSection4Heading => 'Limitation of Liability';

  @override
  String get termsSection4Body =>
      'NovaCart is not liable for indirect or consequential damages arising from the use of this app, to the maximum extent permitted by law.';

  @override
  String get unlockNovaCartTitle => 'Unlock NovaCart';

  @override
  String get waitingForAuthMessage => 'Waiting for authentication…';

  @override
  String get couldntVerifyMessage => 'Couldn\'t verify it\'s you';

  @override
  String get useFaceIdMessage =>
      'Use Face ID, Touch ID, or your device PIN to continue.';

  @override
  String get signInWithPasswordInstead => 'Sign in with password instead';

  @override
  String get voiceSearchComingSoon =>
      'Voice search is coming in a future update';

  @override
  String get fullNameHint => 'Your full name';

  @override
  String get compareProductsTitle => 'Compare Products';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Nothing to compare yet';

  @override
  String get nothingToCompareMessage =>
      'Select 2-3 products from a category to compare them side by side.';

  @override
  String get browseCategoriesLabel => 'Browse Categories';

  @override
  String get priceLabel => 'Price';

  @override
  String get ratingLabel => 'Rating';

  @override
  String get colorsLabel => 'Colors';

  @override
  String get sizesLabel => 'Sizes';

  @override
  String get supportChatTitle => 'Support Chat';

  @override
  String get typeMessageHint => 'Type a message…';

  @override
  String get categoryWomensFashion => 'Women\'s Fashion';

  @override
  String get categoryMensFashion => 'Men\'s Fashion';

  @override
  String get categorySkincare => 'Skincare';

  @override
  String get categoryBeauty => 'Beauty';

  @override
  String get categoryHeadphones => 'Headphones';

  @override
  String get categoryCameras => 'Cameras';

  @override
  String get categoryLaptopsElectronics => 'Laptops & Electronics';

  @override
  String get categoryBabyToys => 'Baby & Toys';
}
