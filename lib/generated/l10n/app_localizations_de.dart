// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Weiter';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get retry => 'Wiederholen';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen';

  @override
  String get skip => 'Überspringen';

  @override
  String get next => 'Weiter';

  @override
  String get splashTagline => 'Smarter einkaufen. Schneller ankommen.';

  @override
  String get onboardingGetStarted => 'Loslegen';

  @override
  String get onboarding1Title => 'Alles an\neinem Ort kaufen';

  @override
  String get onboarding1Desc =>
      'Entdecken Sie Tausende kuratierte Produkte aus Mode, Technik, Haushalt und mehr – alles in einer nahtlosen App.';

  @override
  String get onboarding2Title => 'Schnelle & verfolgbare\nLieferung';

  @override
  String get onboarding2Desc =>
      'Erhalten Sie Echtzeit-Bestellverfolgung und zuverlässige Lieferprognosen, direkt von der Kasse bis an Ihre Haustür.';

  @override
  String get onboarding3Title => 'Sicherer & vertrauenswürdiger\nCheckout';

  @override
  String get onboarding3Desc =>
      'Bezahlen Sie nach Ihren Wünschen mit banküblicher Sicherheit: Karten, Wallets oder Nachnahme, Ihre Wahl, jedes Mal.';

  @override
  String get welcomeBack => 'Willkommen zurück';

  @override
  String get signInSubtitle =>
      'Melden Sie sich an, um Ihren Einkauf bei NovaCart fortzusetzen';

  @override
  String get emailLabel => 'E-Mail';

  @override
  String get emailHint => 'du@beispiel.com';

  @override
  String get passwordLabel => 'Passwort';

  @override
  String get passwordHint => 'Geben Sie Ihr Passwort ein';

  @override
  String get rememberMe => 'Angemeldet bleiben';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get signIn => 'Anmelden';

  @override
  String get orContinueWith => 'oder weiter mit';

  @override
  String get continueWithGoogle => 'Mit Google fortfahren';

  @override
  String get noAccount => 'Haben Sie noch kein Konto? ';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get joinNovaCart => 'NovaCart beitreten';

  @override
  String get signUpSubtitle =>
      'Erstellen Sie ein Konto, um smarter einzukaufen';

  @override
  String get fullNameLabel => 'Vollständiger Name';

  @override
  String get confirmPasswordLabel => 'Passwort bestätigen';

  @override
  String get agreeTerms =>
      'Ich stimme den AGB und der Datenschutzrichtlinie zu';

  @override
  String get resetPasswordTitle => 'Passwort zurücksetzen';

  @override
  String get resetPasswordSubtitle =>
      'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein, und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Wir haben einen Link zum Zurücksetzen des Passworts an $email gesendet. Folgen Sie den Anweisungen in der E-Mail, um ein neues Passwort festzulegen.';
  }

  @override
  String get sendResetLink => 'Link senden';

  @override
  String get backToSignIn => 'Zurück zur Anmeldung';

  @override
  String get resendLink => 'Link erneut senden';

  @override
  String get checkYourEmail => 'Prüfen Sie Ihren Posteingang';

  @override
  String get navHome => 'Startseite';

  @override
  String get navCategories => 'Kategorien';

  @override
  String get navWishlist => 'Wunschliste';

  @override
  String get navProfile => 'Profil';

  @override
  String get searchHint => 'Wonach suchen Sie?';

  @override
  String get categoriesTitle => 'Kategorien';

  @override
  String get flashSaleTitle => '⚡ Blitzangebot';

  @override
  String get bestSellersTitle => '🔥 Bestseller';

  @override
  String get newArrivalsTitle => '✨ Neuheiten';

  @override
  String get recommendedTitle => 'Für Sie empfohlen';

  @override
  String get recentlyViewedTitle => 'Zuletzt angesehen';

  @override
  String get viewAll => 'Alle anzeigen';

  @override
  String get addToCart => 'In den Warenkorb';

  @override
  String get outOfStock => 'Ausverkauft';

  @override
  String get cartTitle => 'Warenkorb';

  @override
  String get yourCartIsEmpty => 'Ihr Warenkorb ist leer';

  @override
  String get addProductsMessage =>
      'Fügen Sie Produkte zu Ihrem Warenkorb hinzu, um sie hier zu sehen.';

  @override
  String get startShopping => 'Jetzt shoppen';

  @override
  String get savedForLaterSection => 'Gemerkt';

  @override
  String get moveToCart => 'In den Warenkorb';

  @override
  String get saveForLater => 'Merken';

  @override
  String get checkout => 'Bezahlen';

  @override
  String get orderSummary => 'Bestellübersicht';

  @override
  String get subtotal => 'Zwischensumme';

  @override
  String get discountLabel => 'Rabatt';

  @override
  String get shippingLabel => 'Versand';

  @override
  String get freeLabel => 'Kostenlos';

  @override
  String get vatLabel => 'MwSt. (14%)';

  @override
  String get totalLabel => 'Gesamt';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Lieferung bis: $date';
  }

  @override
  String get enterCouponCode => 'Gutscheincode eingeben';

  @override
  String get applyLabel => 'Anwenden';

  @override
  String couponApplied(String code) {
    return '$code angewendet';
  }

  @override
  String get wishlistTitle => 'Wunschliste';

  @override
  String get wishlistEmptyTitle => 'Ihre Wunschliste ist leer';

  @override
  String get wishlistEmptyMessage =>
      'Tippen Sie auf das Herz bei einem Produkt, um es hier zu speichern.';

  @override
  String get browseProducts => 'Produkte ansehen';

  @override
  String get shopNow => 'Jetzt kaufen';

  @override
  String browseAllIn(String category) {
    return 'Alle Produkte in $category anzeigen';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count Ergebnisse für \"$query\"';
  }

  @override
  String get noResultsFound => 'Keine Ergebnisse gefunden';

  @override
  String get recentSearchesTitle => 'Letzte Suchen';

  @override
  String get clearAll => 'Leeren';

  @override
  String get trendingSearchesTitle => 'Trends';

  @override
  String get filterAndSort => 'Filtern & Sortieren';

  @override
  String filtersCount(int count) {
    return 'Filter ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Artikel',
      one: '$count Artikel',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Warenkorb leer';

  @override
  String get moveItemsBackMessage =>
      'Verschieben Sie Artikel aus \'Gemerkt\' zurück oder shoppen Sie weiter.';

  @override
  String savedForLaterCount(int count) {
    return 'Gemerkt ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Bezahlen · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Gutscheincode ungültig oder abgelaufen';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Produkte',
      one: '$count Produkt',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'Keine Produkte gefunden';

  @override
  String get tryAdjustingFiltersMessage =>
      'Versuchen Sie, Ihre Filter anzupassen, um mehr Ergebnisse zu sehen.';

  @override
  String get clearFiltersLabel => 'Filter löschen';

  @override
  String get compareProductsTooltip => 'Produkte vergleichen';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'Wir konnten nichts für \"$query\" finden. Versuchen Sie ein anderes Stichwort.';
  }

  @override
  String get noProductsMatchFiltersMessage =>
      'Keine Produkte entsprechen Ihren Filtern. Versuchen Sie diese anzupassen.';

  @override
  String get searchFieldHint => 'Suchen nach Produkten, Marken...';

  @override
  String get resetLabel => 'Zurücksetzen';

  @override
  String get sortByLabel => 'Sortieren nach';

  @override
  String get priceRangeLabel => 'Preisklasse';

  @override
  String get minimumRatingLabel => 'Mindestbewertung';

  @override
  String get anyLabel => 'Alle';

  @override
  String get brandLabel => 'Marke';

  @override
  String get applyFiltersLabel => 'Filter anwenden';

  @override
  String get sortRelevance => 'Relevanz';

  @override
  String get sortPriceLowToHigh => 'Preis: Niedrig zu Hoch';

  @override
  String get sortPriceHighToLow => 'Preis: Hoch zu Niedrig';

  @override
  String get sortRatingHighToLow => 'Bestbewertet';

  @override
  String get sortNewest => 'Neueste zuerst';

  @override
  String get productDetailsTitle => 'Produktdetails';

  @override
  String get descriptionLabel => 'Beschreibung';

  @override
  String get noDescriptionAvailable =>
      'Für dieses Produkt ist derzeit keine Beschreibung verfügbar.';

  @override
  String get readMoreLabel => 'Mehr lesen';

  @override
  String get showLessLabel => 'Weniger anzeigen';

  @override
  String get sizeLabel => 'Größe';

  @override
  String get colorLabel => 'Farbe';

  @override
  String get youMightAlsoLike => 'Das könnte Ihnen auch gefallen';

  @override
  String soldCountLabel(int count) {
    return '$count verkauft';
  }

  @override
  String sharingProductMessage(String name) {
    return '$name wird geteilt...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return '$quantity× $name zum Warenkorb hinzugefügt';
  }

  @override
  String get addedToWishlistMessage => 'Zur Wunschliste hinzugefügt';

  @override
  String get removedFromWishlistMessage => 'Von der Wunschliste entfernt';

  @override
  String get ratingsAndReviewsTitle => 'Bewertungen & Rezensionen';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bewertungen',
      one: '$count Bewertung',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    return 'Alle $count Bewertungen anzeigen';
  }

  @override
  String get estimatedDeliveryTitle => 'Voraussichtliche Lieferung';

  @override
  String arrivesByMessage(String date) {
    return 'Ankunft bis $date, wenn heute bestellt';
  }

  @override
  String get freeReturnsTitle => 'Kostenlose Rücksendung';

  @override
  String get freeReturnsSubtitle => '30 Tage Rückgaberecht, ohne Fragen';

  @override
  String get secureCheckoutTitle => 'Sicherer Checkout';

  @override
  String get secureCheckoutSubtitle =>
      'Nachnahme, Karten und digitale Wallets werden akzeptiert';

  @override
  String get specificationsTitle => 'Spezifikationen';

  @override
  String get categoryLabel => 'Kategorie';

  @override
  String get availableColorsLabel => 'Verfügbare Farben';

  @override
  String availableColorsValue(int count) {
    return '$count Optionen';
  }

  @override
  String get availableSizesLabel => 'Verfügbare Größen';

  @override
  String get unitsSoldLabel => 'Verkaufte Einheiten';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => 'Heute';

  @override
  String daysAgoLabel(int count) {
    return 'vor $count Tagen';
  }

  @override
  String monthsAgoLabel(int count) {
    return 'vor $count Monaten';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Alle Bewertungen ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'In den Warenkorb · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Nachnahme';

  @override
  String get paymentCard => 'Kredit- / Debitkarte';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Zahlen Sie bei Ankunft Ihrer Bestellung';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard und mehr';

  @override
  String get paymentApplePaySubtitle =>
      'Sofort bezahlen mit Face ID / Touch ID';

  @override
  String get paymentGooglePaySubtitle =>
      'Sofort bezahlen mit Ihrem Google-Konto';

  @override
  String get orderStatusProcessing => 'In Bearbeitung';

  @override
  String get orderStatusShipped => 'Versandt';

  @override
  String get orderStatusOutForDelivery => 'In Zustellung';

  @override
  String get orderStatusDelivered => 'Zugestellt';

  @override
  String get orderStatusCancelled => 'Storniert';

  @override
  String get checkoutTitle => 'Bezahlen';

  @override
  String get selectShippingAddress => 'Lieferadresse wählen';

  @override
  String get addNewAddress => 'Neue Adresse hinzufügen';

  @override
  String get selectPaymentMethod => 'Zahlungsart wählen';

  @override
  String get demoCheckoutDisclaimer =>
      'Dies ist eine Demo-Bestellung – es erfolgt keine echte Belastung.';

  @override
  String get stepAddressLabel => 'Adresse';

  @override
  String get stepPaymentLabel => 'Zahlung';

  @override
  String get stepReviewLabel => 'Prüfen';

  @override
  String get changeLabel => 'Ändern';

  @override
  String get shippingToLabel => 'Versand an';

  @override
  String get backLabel => 'Zurück';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Bestellung aufgeben · EGP $amount';
  }

  @override
  String get defaultLabel => 'STANDARD';

  @override
  String get phoneNumberLabel => 'Telefonnummer';

  @override
  String get addressHintLabel => 'Straße, Hausnummer, App.-Nr.';

  @override
  String get cityLabel => 'Stadt';

  @override
  String get saveAddressLabel => 'Adresse speichern';

  @override
  String get orderPlacedTitle => 'Bestellung aufgegeben!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Ihre Bestellung #$orderId wurde bestätigt.';
  }

  @override
  String get itemsLabel => 'Artikel';

  @override
  String get totalPaidLabel => 'Gesamtbetrag';

  @override
  String get continueShoppingLabel => 'Weiter shoppen';

  @override
  String get viewOrderLabel => 'Bestellung anzeigen';

  @override
  String get orderTrackingTitle => 'Sendungsverfolgung';

  @override
  String get orderHistoryTitle => 'Bestellverlauf';

  @override
  String get orderNotFoundTitle => 'Bestellung nicht gefunden';

  @override
  String get orderNotFoundMessage =>
      'Wir konnten diese Bestellung nicht finden.';

  @override
  String get backToOrdersLabel => 'Zurück zu Bestellungen';

  @override
  String get noOrdersYetTitle => 'Noch keine Bestellungen';

  @override
  String get noOrdersYetMessage =>
      'Ihre vergangenen Bestellungen erscheinen hier, sobald Sie eine aufgegeben haben.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Artikel ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Menge $count';
  }

  @override
  String get shippingAddressTitle => 'Lieferadresse';

  @override
  String get paymentMethodTitle => 'Zahlungsart';

  @override
  String get orderCancelledMessage => 'Diese Bestellung wurde storniert.';

  @override
  String orderNumberLabel(String id) {
    return 'Bestellung #$id';
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
  String get stageProcessingTitle => 'Bestellverarbeitung';

  @override
  String get stageProcessingSubtitle => 'Wir haben Ihre Bestellung erhalten';

  @override
  String get stageShippedSubtitle =>
      'Ihre Bestellung hat unser Lager verlassen';

  @override
  String get stageOutForDeliverySubtitle => 'Ihre Bestellung ist auf dem Weg';

  @override
  String get stageDeliveredSubtitle => 'Viel Freude mit Ihrer Bestellung!';

  @override
  String get notificationsTitle => 'Mitteilungen';

  @override
  String get markAllReadLabel => 'Alle als gelesen markieren';

  @override
  String get noNotificationsYetTitle => 'Noch keine Mitteilungen';

  @override
  String get noNotificationsYetMessage =>
      'Bestell-Updates und Angebote werden hier angezeigt.';

  @override
  String minutesAgoShort(int count) {
    return 'vor ${count}m';
  }

  @override
  String hoursAgoShort(int count) {
    return 'vor ${count}h';
  }

  @override
  String daysAgoShort(int count) {
    return 'vor ${count}d';
  }

  @override
  String get profileTitle => 'Profil';

  @override
  String get yourNovaCartAccount => 'Ihr NovaCart-Konto';

  @override
  String get tapToEditProfileMessage =>
      'Tippen Sie, um Namen & Telefonnummer zu bearbeiten';

  @override
  String get darkModeLabel => 'Dunkelmodus';

  @override
  String get languageLabel => 'Sprache';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Gespeicherte Adressen';

  @override
  String get paymentMethodsLabel => 'Zahlungsmethoden';

  @override
  String get helpCenterLabel => 'Hilfezentrum';

  @override
  String get privacyPolicyLabel => 'Datenschutzrichtlinie';

  @override
  String get termsConditionsLabel => 'Allgemeine Geschäftsbedingungen';

  @override
  String get signOutLabel => 'Abmelden';

  @override
  String get biometricConfirmReason =>
      'Bestätigen, um biometrische Anmeldung zu aktivieren';

  @override
  String get biometricLoginLabel => 'Biometrische Anmeldung';

  @override
  String get biometricLoginSubtitle =>
      'Face ID / Touch ID zum Öffnen der App anfordern';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature – demnächst verfügbar';
  }

  @override
  String get editProfileTitle => 'Profil bearbeiten';

  @override
  String get profileUpdatedMessage => 'Profil aktualisiert';

  @override
  String get saveChangesLabel => 'Änderungen speichern';

  @override
  String get rtlNoteMessage =>
      'Die Layout-Ausrichtung wird sofort aktualisiert. Die vollständige arabische Textübersetzung folgt in einem zukünftigen Update.';

  @override
  String get noSavedAddressesTitle => 'Keine gespeicherten Adressen';

  @override
  String get noSavedAddressesMessage =>
      'Fügen Sie eine Lieferadresse hinzu, um den Checkout nächstes Mal zu beschleunigen.';

  @override
  String get helpCenterFaqTitle => 'Häufig gestellte Fragen';

  @override
  String get faqQ1 => 'Wie verfolge ich meine Bestellung?';

  @override
  String get faqA1 =>
      'Gehen Sie zu Profil → Bestellverlauf und tippen Sie auf eine Bestellung, um den Live-Status zu sehen.';

  @override
  String get faqQ2 => 'Welche Zahlungsmethoden werden akzeptiert?';

  @override
  String get faqA2 =>
      'Nachnahme, Kredit-/Debitkarte, Apple Pay und Google Pay.';

  @override
  String get faqQ3 => 'Wie sende ich einen Artikel zurück?';

  @override
  String get faqA3 =>
      'Artikel können innerhalb von 30 Tagen nach Lieferung zurückgegeben werden. Kontaktieren Sie den Support.';

  @override
  String get faqQ4 => 'Wie lange dauert die Lieferung?';

  @override
  String get faqA4 =>
      'Die meisten Bestellungen kommen innerhalb von 3-5 Werktagen an.';

  @override
  String get faqQ5 => 'Wie löse ich einen Gutscheincode ein?';

  @override
  String get faqA5 =>
      'Geben Sie ihn im Warenkorb über der Bestellübersicht ein und tippen Sie auf Anwenden.';

  @override
  String get stillNeedHelpTitle => 'Brauchen Sie noch Hilfe?';

  @override
  String get contactSupportLabel => 'Support kontaktieren';

  @override
  String get aboutFeedbackTitle => 'Über & Feedback';

  @override
  String get loadingVersionLabel => 'Version wird geladen...';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Senden Sie uns Feedback';

  @override
  String get feedbackIntroMessage =>
      'Haben Sie einen Fehler gefunden oder eine Idee?';

  @override
  String get feedbackHintText => 'Sagen Sie uns Ihre Meinung...';

  @override
  String get submitFeedbackLabel => 'Feedback senden';

  @override
  String get feedbackThanksMessage => 'Vielen Dank für Ihr Feedback!';

  @override
  String get feedbackErrorMessage =>
      'Feedback konnte nicht gesendet werden. Bitte versuchen Sie es erneut.';

  @override
  String get privacySection1Heading => 'Informationen, die wir sammeln';

  @override
  String get privacySection1Body =>
      'Wir sammeln Informationen, die Sie direkt bereitstellen (Name, E-Mail, Telefon, Adressen).';

  @override
  String get privacySection2Heading => 'Wie wir Ihre Informationen verwenden';

  @override
  String get privacySection2Body =>
      'Ihre Informationen werden zur Bearbeitung von Bestellungen und für den Support verwendet.';

  @override
  String get privacySection3Heading => 'Datensicherheit';

  @override
  String get privacySection3Body =>
      'Alle Daten werden sicher in der Infrastruktur von Firebase gespeichert.';

  @override
  String get privacySection4Heading => 'Ihre Rechte';

  @override
  String get privacySection4Body =>
      'Sie können Ihre persönlichen Informationen jederzeit im Profil bearbeiten oder löschen.';

  @override
  String get termsSection1Heading => 'Annahme der Bedingungen';

  @override
  String get termsSection1Body =>
      'Mit der Erstellung eines Kontos akzeptieren Sie diese Bedingungen.';

  @override
  String get termsSection2Heading => 'Bestellungen & Zahlung';

  @override
  String get termsSection2Body =>
      'Alle Bestellungen unterliegen der Produktverfügbarkeit.';

  @override
  String get termsSection3Heading => 'Versand & Rücksendung';

  @override
  String get termsSection3Body =>
      'Voraussichtliche Lieferzeiten werden beim Checkout angezeigt.';

  @override
  String get termsSection4Heading => 'Haftungsbeschränkung';

  @override
  String get termsSection4Body =>
      'NovaCart haftet nicht für indirekte Schäden aus der Nutzung der App.';

  @override
  String get unlockNovaCartTitle => 'NovaCart entsperren';

  @override
  String get waitingForAuthMessage => 'Warten auf Authentifizierung...';

  @override
  String get couldntVerifyMessage => 'Verifizierung fehlgeschlagen';

  @override
  String get useFaceIdMessage =>
      'Verwenden Sie Face ID, Touch ID oder Ihre PIN.';

  @override
  String get signInWithPasswordInstead => 'Stattdessen mit Passwort anmelden';

  @override
  String get voiceSearchComingSoon =>
      'Sprachsuche kommt in einem zukünftigen Update';

  @override
  String get fullNameHint => 'Ihr vollständiger Name';

  @override
  String get compareProductsTitle => 'Produkte vergleichen';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Noch nichts zum Vergleichen';

  @override
  String get nothingToCompareMessage =>
      'Wählen Sie 2-3 Produkte aus einer Kategorie aus.';

  @override
  String get browseCategoriesLabel => 'Kategorien durchsuchen';

  @override
  String get priceLabel => 'Preis';

  @override
  String get ratingLabel => 'Bewertung';

  @override
  String get colorsLabel => 'Farben';

  @override
  String get sizesLabel => 'Größen';

  @override
  String get supportChatTitle => 'Support-Chat';

  @override
  String get typeMessageHint => 'Nachricht schreiben...';

  @override
  String get categoryWomensFashion => 'Damenmode';

  @override
  String get categoryMensFashion => 'Herrenmode';

  @override
  String get categorySkincare => 'Hautpflege';

  @override
  String get categoryBeauty => 'Schönheit';

  @override
  String get categoryHeadphones => 'Kopfhörer';

  @override
  String get categoryCameras => 'Kameras';

  @override
  String get categoryLaptopsElectronics => 'Laptops & Elektronik';

  @override
  String get categoryBabyToys => 'Baby & Spielzeug';
}
