// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Doorgaan';

  @override
  String get cancel => 'Annuleren';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get somethingWentWrong => 'Er is iets misgegaan';

  @override
  String get skip => 'Overslaan';

  @override
  String get next => 'Volgende';

  @override
  String get splashTagline => 'Slimmer winkelen. Sneller in huis.';

  @override
  String get onboardingGetStarted => 'Beginnen';

  @override
  String get onboarding1Title => 'Alles kopen,\nop één plek';

  @override
  String get onboarding1Desc =>
      'Ontdek duizenden producten in mode, technologie, huis en meer – alles in één app.';

  @override
  String get onboarding2Title => 'Snel & traceerbaar';

  @override
  String get onboarding2Desc =>
      'Get real-time order tracking and reliable delivery estimates, right from checkout to your doorstep.';

  @override
  String get onboarding3Title => 'Veilig afrekenen';

  @override
  String get onboarding3Desc =>
      'Pay your way with bank-grade security — cards, wallets, or cash on delivery, your choice, every time.';

  @override
  String get welcomeBack => 'Welkom terug';

  @override
  String get signInSubtitle => 'Meld u aan om verder te winkelen';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get emailHint => 'u@voorbeeld.com';

  @override
  String get passwordLabel => 'Wachtwoord';

  @override
  String get passwordHint => 'Wachtwoord invoeren';

  @override
  String get rememberMe => 'Onthoud mij';

  @override
  String get forgotPassword => 'Wachtwoord vergeten?';

  @override
  String get signIn => 'Inloggen';

  @override
  String get orContinueWith => 'of ga verder met';

  @override
  String get continueWithGoogle => 'Doorgaan met Google';

  @override
  String get noAccount => 'Nog geen account? ';

  @override
  String get createAccount => 'Account aanmaken';

  @override
  String get joinNovaCart => 'Lid worden';

  @override
  String get signUpSubtitle => 'Maak een account aan';

  @override
  String get fullNameLabel => 'Volledige naam';

  @override
  String get confirmPasswordLabel => 'Bevestig wachtwoord';

  @override
  String get agreeTerms => 'Ik ga akkoord met de voorwaarden';

  @override
  String get resetPasswordTitle => 'Wachtwoord herstellen';

  @override
  String get resetPasswordSubtitle => 'Voer uw e-mailadres in.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Link verzonden naar $email.';
  }

  @override
  String get sendResetLink => 'Link verzenden';

  @override
  String get backToSignIn => 'Terug naar inloggen';

  @override
  String get resendLink => 'Link opnieuw verzenden';

  @override
  String get checkYourEmail => 'Controleer uw e-mail';

  @override
  String get navHome => 'Home';

  @override
  String get navCategories => 'Categorieën';

  @override
  String get navWishlist => 'Wensen';

  @override
  String get navProfile => 'Profiel';

  @override
  String get searchHint => 'Wat zoekt u?';

  @override
  String get categoriesTitle => 'Categorieën';

  @override
  String get flashSaleTitle => '⚡ Flash Sale';

  @override
  String get bestSellersTitle => '🔥 Bestsellers';

  @override
  String get newArrivalsTitle => '✨ Nieuw binnen';

  @override
  String get recommendedTitle => 'Aanbevolen';

  @override
  String get recentlyViewedTitle => 'Onlangs bekeken';

  @override
  String get viewAll => 'Bekijk alles';

  @override
  String get addToCart => 'In winkelwagen';

  @override
  String get outOfStock => 'Uitverkocht';

  @override
  String get cartTitle => 'Winkelwagen';

  @override
  String get yourCartIsEmpty => 'Uw winkelwagen is leeg';

  @override
  String get addProductsMessage => 'Voeg producten toe.';

  @override
  String get startShopping => 'Begin met winkelen';

  @override
  String get savedForLaterSection => 'Bewaard';

  @override
  String get moveToCart => 'In winkelwagen';

  @override
  String get saveForLater => 'Bewaar voor later';

  @override
  String get checkout => 'Afrekenen';

  @override
  String get orderSummary => 'Overzicht';

  @override
  String get subtotal => 'Subtotaal';

  @override
  String get discountLabel => 'Korting';

  @override
  String get shippingLabel => 'Verzending';

  @override
  String get freeLabel => 'Gratis';

  @override
  String get vatLabel => 'BTW (14%)';

  @override
  String get totalLabel => 'Totaal';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Levering: $date';
  }

  @override
  String get enterCouponCode => 'Kortingscode';

  @override
  String get applyLabel => 'Toepassen';

  @override
  String couponApplied(String code) {
    return '$code toegepast';
  }

  @override
  String get wishlistTitle => 'Verlanglijst';

  @override
  String get wishlistEmptyTitle => 'Lijst is leeg';

  @override
  String get wishlistEmptyMessage => 'Markeer met een hartje.';

  @override
  String get browseProducts => 'Producten bekijken';

  @override
  String get shopNow => 'Nu kopen';

  @override
  String browseAllIn(String category) {
    return 'Alles in $category';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count resultaten voor \"$query\"';
  }

  @override
  String get noResultsFound => 'Geen resultaten';

  @override
  String get recentSearchesTitle => 'Laatste zoekopdrachten';

  @override
  String get clearAll => 'Wissen';

  @override
  String get trendingSearchesTitle => 'Trends';

  @override
  String get filterAndSort => 'Filteren';

  @override
  String filtersCount(int count) {
    return 'Filters ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artikelen',
      one: '$count artikel',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Leeg';

  @override
  String get moveItemsBackMessage => 'Zet terug uit bewaard.';

  @override
  String savedForLaterCount(int count) {
    return 'Bewaard ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Betalen · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Ongeldige code';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count producten',
      one: '$count product',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'Geen producten';

  @override
  String get tryAdjustingFiltersMessage => 'Pas filters aan.';

  @override
  String get clearFiltersLabel => 'Filters wissen';

  @override
  String get compareProductsTooltip => 'Vergelijken';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'Geen treffers voor \"$query\".';
  }

  @override
  String get noProductsMatchFiltersMessage => 'Geen overeenkomsten.';

  @override
  String get searchFieldHint => 'Zoeken...';

  @override
  String get resetLabel => 'Resetten';

  @override
  String get sortByLabel => 'Sorteren';

  @override
  String get priceRangeLabel => 'Prijs';

  @override
  String get minimumRatingLabel => 'Min. score';

  @override
  String get anyLabel => 'Alle';

  @override
  String get brandLabel => 'Merk';

  @override
  String get applyFiltersLabel => 'Toepassen';

  @override
  String get sortRelevance => 'Relevantie';

  @override
  String get sortPriceLowToHigh => 'Prijs: Laag naar hoog';

  @override
  String get sortPriceHighToLow => 'Prijs: Hoog naar laag';

  @override
  String get sortRatingHighToLow => 'Best beoordeeld';

  @override
  String get sortNewest => 'Nieuwste';

  @override
  String get productDetailsTitle => 'Details';

  @override
  String get descriptionLabel => 'Beschrijving';

  @override
  String get noDescriptionAvailable => 'Geen beschrijving.';

  @override
  String get readMoreLabel => 'Lees meer';

  @override
  String get showLessLabel => 'Minder';

  @override
  String get sizeLabel => 'Maat';

  @override
  String get colorLabel => 'Kleur';

  @override
  String get youMightAlsoLike => 'Ook interessant';

  @override
  String soldCountLabel(int count) {
    return '$count verkocht';
  }

  @override
  String sharingProductMessage(String name) {
    return '$name delen...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return '$quantity× $name toegevoegd';
  }

  @override
  String get addedToWishlistMessage => 'Toegevoegd';

  @override
  String get removedFromWishlistMessage => 'Verwijderd';

  @override
  String get ratingsAndReviewsTitle => 'Beoordelingen';

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
    return 'Bekijk alle $count';
  }

  @override
  String get estimatedDeliveryTitle => 'Bezorging';

  @override
  String arrivesByMessage(String date) {
    return 'In huis op $date';
  }

  @override
  String get freeReturnsTitle => 'Gratis retour';

  @override
  String get freeReturnsSubtitle => 'Binnen 30 dagen';

  @override
  String get secureCheckoutTitle => 'Veilig betalen';

  @override
  String get secureCheckoutSubtitle => 'Beschermde betaling';

  @override
  String get specificationsTitle => 'Specificaties';

  @override
  String get categoryLabel => 'Categorie';

  @override
  String get availableColorsLabel => 'Kleuren';

  @override
  String availableColorsValue(int count) {
    return '$count opties';
  }

  @override
  String get availableSizesLabel => 'Maten';

  @override
  String get unitsSoldLabel => 'Verkocht';

  @override
  String unitsSoldValue(int count) {
    return '+$count';
  }

  @override
  String get todayLabel => 'Vandaag';

  @override
  String daysAgoLabel(int count) {
    return '$count dagen geleden';
  }

  @override
  String monthsAgoLabel(int count) {
    return '$count maanden geleden';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Alle reviews ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Toevoegen · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Contant bij levering';

  @override
  String get paymentCard => 'Creditcard';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Betaal bij ontvangst';

  @override
  String get paymentCardSubtitle => 'Visa, Master, etc.';

  @override
  String get paymentApplePaySubtitle => 'Snel met Face ID';

  @override
  String get paymentGooglePaySubtitle => 'Snel met Google';

  @override
  String get orderStatusProcessing => 'In verwerking';

  @override
  String get orderStatusShipped => 'Verzonden';

  @override
  String get orderStatusOutForDelivery => 'Onderweg';

  @override
  String get orderStatusDelivered => 'Bezorgd';

  @override
  String get orderStatusCancelled => 'Geannuleerd';

  @override
  String get checkoutTitle => 'Betalen';

  @override
  String get selectShippingAddress => 'Kies adres';

  @override
  String get addNewAddress => 'Nieuw adres';

  @override
  String get selectPaymentMethod => 'Betaalmethode';

  @override
  String get demoCheckoutDisclaimer => 'Alleen demo.';

  @override
  String get stepAddressLabel => 'Adres';

  @override
  String get stepPaymentLabel => 'Betaling';

  @override
  String get stepReviewLabel => 'Check';

  @override
  String get changeLabel => 'Wijzig';

  @override
  String get shippingToLabel => 'Verzenden naar';

  @override
  String get backLabel => 'Terug';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Bestellen · EGP $amount';
  }

  @override
  String get defaultLabel => 'STANDAARD';

  @override
  String get phoneNumberLabel => 'Telefoon';

  @override
  String get addressHintLabel => 'Straat, nr, stad';

  @override
  String get cityLabel => 'Stad';

  @override
  String get saveAddressLabel => 'Opslaan';

  @override
  String get orderPlacedTitle => 'Bestelling geplaatst!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Bevestiging #$orderId.';
  }

  @override
  String get itemsLabel => 'Artikelen';

  @override
  String get totalPaidLabel => 'Betaald';

  @override
  String get continueShoppingLabel => 'Verder winkelen';

  @override
  String get viewOrderLabel => 'Bestelling inzien';

  @override
  String get orderTrackingTitle => 'Volgen';

  @override
  String get orderHistoryTitle => 'Mijn orders';

  @override
  String get orderNotFoundTitle => 'Niet gevonden';

  @override
  String get orderNotFoundMessage => 'Geen order.';

  @override
  String get backToOrdersLabel => 'Terug naar orders';

  @override
  String get noOrdersYetTitle => 'Geen orders';

  @override
  String get noOrdersYetMessage => 'Hier verschijnen uw orders.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Artikelen ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Aant. $count';
  }

  @override
  String get shippingAddressTitle => 'Adres';

  @override
  String get paymentMethodTitle => 'Betaling';

  @override
  String get orderCancelledMessage => 'Geannuleerd.';

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
  String get stageProcessingTitle => 'Verwerking';

  @override
  String get stageProcessingSubtitle => 'Ontvangen';

  @override
  String get stageShippedSubtitle => 'Verzonden';

  @override
  String get stageOutForDeliverySubtitle => 'Onderweg';

  @override
  String get stageDeliveredSubtitle => 'Bezorgd!';

  @override
  String get notificationsTitle => 'Meldingen';

  @override
  String get markAllReadLabel => 'Gelezen';

  @override
  String get noNotificationsYetTitle => 'Geen';

  @override
  String get noNotificationsYetMessage => 'Niets nieuws.';

  @override
  String minutesAgoShort(int count) {
    return '${count}m geleden';
  }

  @override
  String hoursAgoShort(int count) {
    return '${count}u geleden';
  }

  @override
  String daysAgoShort(int count) {
    return '${count}d geleden';
  }

  @override
  String get profileTitle => 'Profiel';

  @override
  String get yourNovaCartAccount => 'Uw account';

  @override
  String get tapToEditProfileMessage => 'Gegevens wijzigen';

  @override
  String get darkModeLabel => 'Donkere modus';

  @override
  String get languageLabel => 'Taal';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Adressen';

  @override
  String get paymentMethodsLabel => 'Betalingen';

  @override
  String get helpCenterLabel => 'Hulp';

  @override
  String get privacyPolicyLabel => 'Privacy';

  @override
  String get termsConditionsLabel => 'Voorwaarden';

  @override
  String get signOutLabel => 'Uitloggen';

  @override
  String get biometricConfirmReason => 'Biometrie bevestigen';

  @override
  String get biometricLoginLabel => 'Biometrisch inloggen';

  @override
  String get biometricLoginSubtitle => 'Face ID / Touch ID';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — binnenkort';
  }

  @override
  String get editProfileTitle => 'Profiel bewerken';

  @override
  String get profileUpdatedMessage => 'Bijgewerkt';

  @override
  String get saveChangesLabel => 'Opslaan';

  @override
  String get rtlNoteMessage => 'Layout aangepast.';

  @override
  String get noSavedAddressesTitle => 'Geen adressen';

  @override
  String get noSavedAddressesMessage => 'Voeg er een toe.';

  @override
  String get helpCenterFaqTitle => 'FAQ';

  @override
  String get faqQ1 => 'Volgen?';

  @override
  String get faqA1 => 'Profiel → Orders.';

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
  String get stillNeedHelpTitle => 'Hulp nodig?';

  @override
  String get contactSupportLabel => 'Contact';

  @override
  String get aboutFeedbackTitle => 'Over ons';

  @override
  String get loadingVersionLabel => 'Laden...';

  @override
  String versionLabel(String version) {
    return 'Versie $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Feedback';

  @override
  String get feedbackIntroMessage => 'Fout gevonden?';

  @override
  String get feedbackHintText => 'Uw mening...';

  @override
  String get submitFeedbackLabel => 'Verzenden';

  @override
  String get feedbackThanksMessage => 'Bedankt!';

  @override
  String get feedbackErrorMessage => 'Fout bij verzenden.';

  @override
  String get privacySection1Heading => 'Data';

  @override
  String get privacySection1Body => 'Wij beschermen uw data.';

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
  String get termsSection1Heading => 'Voorwaarden';

  @override
  String get termsSection1Body => 'Gebruik van NovaCart...';

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
  String get unlockNovaCartTitle => 'Ontgrendelen';

  @override
  String get waitingForAuthMessage => 'Check...';

  @override
  String get couldntVerifyMessage => 'Fout';

  @override
  String get useFaceIdMessage => 'Gebruik Face ID.';

  @override
  String get signInWithPasswordInstead => 'Wachtwoord gebruiken';

  @override
  String get voiceSearchComingSoon => 'Binnenkort';

  @override
  String get fullNameHint => 'Naam';

  @override
  String get compareProductsTitle => 'Vergelijken';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Leeg';

  @override
  String get nothingToCompareMessage => 'Kies 2-3 producten.';

  @override
  String get browseCategoriesLabel => 'Categorieën';

  @override
  String get priceLabel => 'Prijs';

  @override
  String get ratingLabel => 'Score';

  @override
  String get colorsLabel => 'Kleuren';

  @override
  String get sizesLabel => 'Maten';

  @override
  String get supportChatTitle => 'Support';

  @override
  String get typeMessageHint => 'Bericht...';

  @override
  String get categoryWomensFashion => 'Dames';

  @override
  String get categoryMensFashion => 'Heren';

  @override
  String get categorySkincare => 'Skincare';

  @override
  String get categoryBeauty => 'Beauty';

  @override
  String get categoryHeadphones => 'Audio';

  @override
  String get categoryCameras => 'Camera';

  @override
  String get categoryLaptopsElectronics => 'Tech';

  @override
  String get categoryBabyToys => 'Kids';
}
