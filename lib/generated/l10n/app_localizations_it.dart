// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Continua';

  @override
  String get cancel => 'Annulla';

  @override
  String get retry => 'Riprova';

  @override
  String get somethingWentWrong => 'Qualcosa è andato storto';

  @override
  String get skip => 'Salta';

  @override
  String get next => 'Avanti';

  @override
  String get splashTagline => 'Acquista con intelligenza. Arriva prima.';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get onboarding1Title => 'Acquista tutto,\nin un unico posto';

  @override
  String get onboarding1Desc =>
      'Esplora migliaia di prodotti selezionati in moda, tecnologia, casa e altro ancora, tutto da un\'unica app intuitiva.';

  @override
  String get onboarding2Title => 'Consegna veloce\ne tracciabile';

  @override
  String get onboarding2Desc =>
      'Ottieni il monitoraggio degli ordini in tempo reale e stime di consegna affidabili, direttamente dalla cassa alla tua porta.';

  @override
  String get onboarding3Title => 'Pagamento sicuro\ne affidabile';

  @override
  String get onboarding3Desc =>
      'Paga come preferisci con sicurezza di livello bancario: carte, portafogli o contrassegno, a tua scelta, ogni volta.';

  @override
  String get welcomeBack => 'Bentornato';

  @override
  String get signInSubtitle =>
      'Accedi per continuare a fare acquisti con NovaCart';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get emailHint => 'tu@esempio.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Inserisci la tua password';

  @override
  String get rememberMe => 'Ricordami';

  @override
  String get forgotPassword => 'Password dimenticata?';

  @override
  String get signIn => 'Accedi';

  @override
  String get orContinueWith => 'o continua con';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get noAccount => 'Non hai un account? ';

  @override
  String get createAccount => 'Crea account';

  @override
  String get joinNovaCart => 'Unisciti a NovaCart';

  @override
  String get signUpSubtitle =>
      'Crea un account per iniziare a fare acquisti con intelligenza';

  @override
  String get fullNameLabel => 'Nome completo';

  @override
  String get confirmPasswordLabel => 'Conferma password';

  @override
  String get agreeTerms =>
      'Accetto i Termini e Condizioni e l\'Informativa sulla Privacy';

  @override
  String get resetPasswordTitle => 'Reimposta la tua password';

  @override
  String get resetPasswordSubtitle =>
      'Inserisci l\'e-mail associata al tuo account e ti invieremo un link per reimpostare la password.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Abbiamo inviato un link per la reimpostazione della password a $email. Segui le istruzioni nell\'e-mail.';
  }

  @override
  String get sendResetLink => 'Invia link di reimpostazione';

  @override
  String get backToSignIn => 'Torna al login';

  @override
  String get resendLink => 'Reinvia link';

  @override
  String get checkYourEmail => 'Controlla la tua e-mail';

  @override
  String get navHome => 'Home';

  @override
  String get navCategories => 'Categorie';

  @override
  String get navWishlist => 'Desideri';

  @override
  String get navProfile => 'Profilo';

  @override
  String get searchHint => 'Cosa stai cercando?';

  @override
  String get categoriesTitle => 'Categorie';

  @override
  String get flashSaleTitle => '⚡ Offerta Lampo';

  @override
  String get bestSellersTitle => '🔥 I più venduti';

  @override
  String get newArrivalsTitle => '✨ Nuovi arrivi';

  @override
  String get recommendedTitle => 'Consigliati per te';

  @override
  String get recentlyViewedTitle => 'Visti di recente';

  @override
  String get viewAll => 'Vedi tutto';

  @override
  String get addToCart => 'Aggiungi al carrello';

  @override
  String get outOfStock => 'Esaurito';

  @override
  String get cartTitle => 'Carrello';

  @override
  String get yourCartIsEmpty => 'Il tuo carrello è vuoto';

  @override
  String get addProductsMessage =>
      'Aggiungi prodotti al carrello per vederli qui.';

  @override
  String get startShopping => 'Inizia a fare acquisti';

  @override
  String get savedForLaterSection => 'Salvati per dopo';

  @override
  String get moveToCart => 'Sposta nel carrello';

  @override
  String get saveForLater => 'Salva per dopo';

  @override
  String get checkout => 'Pagamento';

  @override
  String get orderSummary => 'Riepilogo ordine';

  @override
  String get subtotal => 'Subtotale';

  @override
  String get discountLabel => 'Sconto';

  @override
  String get shippingLabel => 'Spedizione';

  @override
  String get freeLabel => 'Gratis';

  @override
  String get vatLabel => 'IVA (14%)';

  @override
  String get totalLabel => 'Totale';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Consegna prevista: $date';
  }

  @override
  String get enterCouponCode => 'Inserisci codice coupon';

  @override
  String get applyLabel => 'Applica';

  @override
  String couponApplied(String code) {
    return 'Codice $code applicato';
  }

  @override
  String get wishlistTitle => 'Desideri';

  @override
  String get wishlistEmptyTitle => 'La tua lista dei desideri è vuota';

  @override
  String get wishlistEmptyMessage =>
      'Tocca il cuore su qualsiasi prodotto per salvarlo qui.';

  @override
  String get browseProducts => 'Sfoglia prodotti';

  @override
  String get shopNow => 'Acquista ora';

  @override
  String browseAllIn(String category) {
    return 'Vedi tutti i prodotti in $category';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count risultati per \"$query\"';
  }

  @override
  String get noResultsFound => 'Nessun risultato trovato';

  @override
  String get recentSearchesTitle => 'Ricerche recenti';

  @override
  String get clearAll => 'Cancella tutto';

  @override
  String get trendingSearchesTitle => 'Tendenze';

  @override
  String get filterAndSort => 'Filtra e ordina';

  @override
  String filtersCount(int count) {
    return 'Filtri ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count articoli',
      one: '$count articolo',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Carrello vuoto';

  @override
  String get moveItemsBackMessage =>
      'Sposta indietro gli articoli dai salvati o continua gli acquisti.';

  @override
  String savedForLaterCount(int count) {
    return 'Salvati per dopo ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Pagamento · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Codice coupon non valido o scaduto';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prodotti',
      one: '$count prodotto',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'Nessun prodotto trovato';

  @override
  String get tryAdjustingFiltersMessage =>
      'Prova a regolare i filtri per vedere più risultati.';

  @override
  String get clearFiltersLabel => 'Rimuovi filtri';

  @override
  String get compareProductsTooltip => 'Confronta prodotti';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'Non abbiamo trovato nulla per \"$query\". Prova un\'altra parola chiave.';
  }

  @override
  String get noProductsMatchFiltersMessage =>
      'Nessun prodotto corrisponde ai tuoi filtri. Prova a regolarli.';

  @override
  String get searchFieldHint => 'Cerca prodotti, marche...';

  @override
  String get resetLabel => 'Reimposta';

  @override
  String get sortByLabel => 'Ordina per';

  @override
  String get priceRangeLabel => 'Fascia di prezzo';

  @override
  String get minimumRatingLabel => 'Valutazione minima';

  @override
  String get anyLabel => 'Qualsiasi';

  @override
  String get brandLabel => 'Marca';

  @override
  String get applyFiltersLabel => 'Applica filtri';

  @override
  String get sortRelevance => 'Rilevanza';

  @override
  String get sortPriceLowToHigh => 'Prezzo: dal più basso';

  @override
  String get sortPriceHighToLow => 'Prezzo: dal più alto';

  @override
  String get sortRatingHighToLow => 'I più votati';

  @override
  String get sortNewest => 'I più recenti';

  @override
  String get productDetailsTitle => 'Dettagli prodotto';

  @override
  String get descriptionLabel => 'Descrizione';

  @override
  String get noDescriptionAvailable =>
      'Nessuna descrizione disponibile per questo prodotto al momento.';

  @override
  String get readMoreLabel => 'Leggi di più';

  @override
  String get showLessLabel => 'Mostra meno';

  @override
  String get sizeLabel => 'Taglia';

  @override
  String get colorLabel => 'Colore';

  @override
  String get youMightAlsoLike => 'Ti potrebbe piacere anche';

  @override
  String soldCountLabel(int count) {
    return '$count venduti';
  }

  @override
  String sharingProductMessage(String name) {
    return 'Condividendo $name...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return 'Aggiunto $quantity× $name al carrello';
  }

  @override
  String get addedToWishlistMessage => 'Aggiunto ai desideri';

  @override
  String get removedFromWishlistMessage => 'Rimosso dai desideri';

  @override
  String get ratingsAndReviewsTitle => 'Valutazioni e recensioni';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count recensioni',
      one: '$count recensione',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    return 'Vedi tutte le $count recensioni';
  }

  @override
  String get estimatedDeliveryTitle => 'Consegna prevista';

  @override
  String arrivesByMessage(String date) {
    return 'Arriva entro il $date se ordinato oggi';
  }

  @override
  String get freeReturnsTitle => 'Resi gratuiti';

  @override
  String get freeReturnsSubtitle => 'Entro 30 giorni, senza domande';

  @override
  String get secureCheckoutTitle => 'Pagamento sicuro';

  @override
  String get secureCheckoutSubtitle =>
      'Contrassegno, carte e portafogli digitali accettati';

  @override
  String get specificationsTitle => 'Specifiche';

  @override
  String get categoryLabel => 'Categoria';

  @override
  String get availableColorsLabel => 'Colori disponibili';

  @override
  String availableColorsValue(int count) {
    return '$count opzioni';
  }

  @override
  String get availableSizesLabel => 'Taglie disponibili';

  @override
  String get unitsSoldLabel => 'Unità vendute';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => 'Oggi';

  @override
  String daysAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni fa',
      one: '1 giorno fa',
    );
    return '$_temp0';
  }

  @override
  String monthsAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesi fa',
      one: '1 mese fa',
    );
    return '$_temp0';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Tutte le recensioni ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Aggiungi al carrello · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Contrassegno';

  @override
  String get paymentCard => 'Carta di credito / debito';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Paga all\'arrivo dell\'ordine';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard e altre';

  @override
  String get paymentApplePaySubtitle =>
      'Paga istantaneamente con Face ID / Touch ID';

  @override
  String get paymentGooglePaySubtitle =>
      'Paga istantaneamente con il tuo account Google';

  @override
  String get orderStatusProcessing => 'In lavorazione';

  @override
  String get orderStatusShipped => 'Spedito';

  @override
  String get orderStatusOutForDelivery => 'In consegna';

  @override
  String get orderStatusDelivered => 'Consegnato';

  @override
  String get orderStatusCancelled => 'Annullato';

  @override
  String get checkoutTitle => 'Pagamento';

  @override
  String get selectShippingAddress => 'Seleziona un indirizzo di spedizione';

  @override
  String get addNewAddress => 'Aggiungi nuovo indirizzo';

  @override
  String get selectPaymentMethod => 'Seleziona un metodo di pagamento';

  @override
  String get demoCheckoutDisclaimer =>
      'Questo è un pagamento demo — non verrà addebitato alcun importo reale.';

  @override
  String get stepAddressLabel => 'Indirizzo';

  @override
  String get stepPaymentLabel => 'Pagamento';

  @override
  String get stepReviewLabel => 'Riepilogo';

  @override
  String get changeLabel => 'Cambia';

  @override
  String get shippingToLabel => 'Spedizione a';

  @override
  String get backLabel => 'Indietro';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Effettua ordine · EGP $amount';
  }

  @override
  String get defaultLabel => 'PREDEFINITO';

  @override
  String get phoneNumberLabel => 'Numero di telefono';

  @override
  String get addressHintLabel => 'Via, edificio, numero appartamento';

  @override
  String get cityLabel => 'Città';

  @override
  String get saveAddressLabel => 'Salva indirizzo';

  @override
  String get orderPlacedTitle => 'Ordine effettuato!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Il tuo ordine #$orderId è stato confermato.';
  }

  @override
  String get itemsLabel => 'Articoli';

  @override
  String get totalPaidLabel => 'Totale pagato';

  @override
  String get continueShoppingLabel => 'Continua lo shopping';

  @override
  String get viewOrderLabel => 'Vedi ordine';

  @override
  String get orderTrackingTitle => 'Tracciamento ordine';

  @override
  String get orderHistoryTitle => 'Cronologia ordini';

  @override
  String get orderNotFoundTitle => 'Ordine non trovato';

  @override
  String get orderNotFoundMessage => 'Non abbiamo trovato questo ordine.';

  @override
  String get backToOrdersLabel => 'Torna ai miei ordini';

  @override
  String get noOrdersYetTitle => 'Nessun ordine';

  @override
  String get noOrdersYetMessage =>
      'I tuoi ordini passati appariranno qui una volta effettuato uno.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Articoli ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Qtà $count';
  }

  @override
  String get shippingAddressTitle => 'Indirizzo di spedizione';

  @override
  String get paymentMethodTitle => 'Metodo di pagamento';

  @override
  String get orderCancelledMessage => 'Questo ordine è stato annullato.';

  @override
  String orderNumberLabel(String id) {
    return 'Ordine #$id';
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
  String get stageProcessingTitle => 'Elaborazione ordine';

  @override
  String get stageProcessingSubtitle => 'Abbiamo ricevuto il tuo ordine';

  @override
  String get stageShippedSubtitle =>
      'Il tuo ordine ha lasciato il nostro magazzino';

  @override
  String get stageOutForDeliverySubtitle => 'Il tuo ordine è in arrivo';

  @override
  String get stageDeliveredSubtitle => 'Goditi il tuo ordine!';

  @override
  String get notificationsTitle => 'Notifiche';

  @override
  String get markAllReadLabel => 'Segna tutto come letto';

  @override
  String get noNotificationsYetTitle => 'Nessuna notifica';

  @override
  String get noNotificationsYetMessage =>
      'Gli aggiornamenti dell\'ordine e le promozioni appariranno qui.';

  @override
  String minutesAgoShort(int count) {
    return '${count}m fa';
  }

  @override
  String hoursAgoShort(int count) {
    return '${count}h fa';
  }

  @override
  String daysAgoShort(int count) {
    return '${count}g fa';
  }

  @override
  String get profileTitle => 'Profilo';

  @override
  String get yourNovaCartAccount => 'Il tuo account NovaCart';

  @override
  String get tapToEditProfileMessage => 'Tocca per modificare nome e telefono';

  @override
  String get darkModeLabel => 'Modalità scura';

  @override
  String get languageLabel => 'Lingua';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Indirizzi salvati';

  @override
  String get paymentMethodsLabel => 'Metodi di pagamento';

  @override
  String get helpCenterLabel => 'Centro assistenza';

  @override
  String get privacyPolicyLabel => 'Informativa sulla privacy';

  @override
  String get termsConditionsLabel => 'Termini e condizioni';

  @override
  String get signOutLabel => 'Disconnetti';

  @override
  String get biometricConfirmReason =>
      'Conferma per abilitare l\'accesso biometrico';

  @override
  String get biometricLoginLabel => 'Accesso biometrico';

  @override
  String get biometricLoginSubtitle =>
      'Richiedi Face ID / Touch ID per aprire l\'app';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — presto disponibile';
  }

  @override
  String get editProfileTitle => 'Modifica profilo';

  @override
  String get profileUpdatedMessage => 'Profilo aggiornato';

  @override
  String get saveChangesLabel => 'Salva modifiche';

  @override
  String get rtlNoteMessage =>
      'La direzione del layout viene aggiornata istantaneamente. La traduzione completa del testo in arabo arriverà in un futuro aggiornamento.';

  @override
  String get noSavedAddressesTitle => 'Nessun indirizzo salvato';

  @override
  String get noSavedAddressesMessage =>
      'Aggiungi un indirizzo di spedizione per velocizzare il pagamento la prossima volta.';

  @override
  String get helpCenterFaqTitle => 'Domande frequenti';

  @override
  String get faqQ1 => 'Come traccio il mio ordine?';

  @override
  String get faqA1 =>
      'Vai su Profilo → Cronologia ordini e tocca un ordine per vedere il suo stato in tempo reale.';

  @override
  String get faqQ2 => 'Quali metodi di pagamento sono accettati?';

  @override
  String get faqA2 =>
      'Contrassegno, carta di credito/debito, Apple Pay e Google Pay.';

  @override
  String get faqQ3 => 'Come restituisco un articolo?';

  @override
  String get faqA3 =>
      'Gli articoli possono essere restituiti entro 30 giorni dalla consegna. Contatta l\'assistenza.';

  @override
  String get faqQ4 => 'Quanto tempo richiede la consegna?';

  @override
  String get faqA4 =>
      'La maggior parte degli ordini arriva entro 3-5 giorni lavorativi.';

  @override
  String get faqQ5 => 'Come applico un codice coupon?';

  @override
  String get faqA5 =>
      'Inseriscilo nella schermata del Carrello, sopra il riepilogo dell\'ordine, e tocca Applica.';

  @override
  String get stillNeedHelpTitle => 'Hai ancora bisogno di aiuto?';

  @override
  String get contactSupportLabel => 'Contatta l\'assistenza';

  @override
  String get aboutFeedbackTitle => 'Informazioni e feedback';

  @override
  String get loadingVersionLabel => 'Caricamento versione...';

  @override
  String versionLabel(String version) {
    return 'Versione $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Inviaci un feedback';

  @override
  String get feedbackIntroMessage =>
      'Hai trovato un bug o hai un\'idea per migliorare NovaCart? Leggiamo ogni messaggio.';

  @override
  String get feedbackHintText => 'Dicci cosa ne pensi...';

  @override
  String get submitFeedbackLabel => 'Invia feedback';

  @override
  String get feedbackThanksMessage => 'Grazie per il tuo feedback!';

  @override
  String get feedbackErrorMessage =>
      'Impossibile inviare il feedback. Riprova.';

  @override
  String get privacySection1Heading => 'Informazioni che raccogliamo';

  @override
  String get privacySection1Body =>
      'Raccogliamo le informazioni fornite direttamente (nome, e-mail, telefono) e generate dall\'uso dell\'app.';

  @override
  String get privacySection2Heading => 'Come usiamo le tue informazioni';

  @override
  String get privacySection2Body =>
      'Le informazioni sono usate per elaborare gli ordini e fornire assistenza.';

  @override
  String get privacySection3Heading => 'Sicurezza dei dati';

  @override
  String get privacySection3Body =>
      'Tutti i dati sono memorizzati in modo sicuro utilizzando l\'infrastruttura di Firebase.';

  @override
  String get privacySection4Heading => 'I tuoi diritti';

  @override
  String get privacySection4Body =>
      'Puoi modificare o eliminare le tue informazioni personali in qualsiasi momento.';

  @override
  String get termsSection1Heading => 'Accettazione dei termini';

  @override
  String get termsSection1Body =>
      'Creando un account, accetti questi Termini e Condizioni.';

  @override
  String get termsSection2Heading => 'Ordini e pagamenti';

  @override
  String get termsSection2Body =>
      'Tutti gli ordini sono soggetti alla disponibilità dei prodotti.';

  @override
  String get termsSection3Heading => 'Spedizioni e resi';

  @override
  String get termsSection3Body =>
      'I tempi di consegna sono mostrati al pagamento.';

  @override
  String get termsSection4Heading => 'Limitazione di responsabilità';

  @override
  String get termsSection4Body =>
      'NovaCart non è responsabile per danni indiretti derivanti dall\'uso dell\'app.';

  @override
  String get unlockNovaCartTitle => 'Sblocca NovaCart';

  @override
  String get waitingForAuthMessage => 'In attesa di autenticazione...';

  @override
  String get couldntVerifyMessage => 'Impossibile verificarti';

  @override
  String get useFaceIdMessage =>
      'Usa Face ID, Touch ID o il PIN del dispositivo.';

  @override
  String get signInWithPasswordInstead => 'Accedi invece con password';

  @override
  String get voiceSearchComingSoon =>
      'La ricerca vocale arriverà in un futuro aggiornamento';

  @override
  String get fullNameHint => 'Il tuo nome completo';

  @override
  String get compareProductsTitle => 'Confronta prodotti';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Niente da confrontare ancora';

  @override
  String get nothingToCompareMessage =>
      'Seleziona 2-3 prodotti per confrontarli fianco a fianco.';

  @override
  String get browseCategoriesLabel => 'Sfoglia categorie';

  @override
  String get priceLabel => 'Prezzo';

  @override
  String get ratingLabel => 'Voto';

  @override
  String get colorsLabel => 'Colori';

  @override
  String get sizesLabel => 'Taglie';

  @override
  String get supportChatTitle => 'Chat di supporto';

  @override
  String get typeMessageHint => 'Scrivi un messaggio...';

  @override
  String get categoryWomensFashion => 'Moda Donna';

  @override
  String get categoryMensFashion => 'Moda Uomo';

  @override
  String get categorySkincare => 'Cura della pelle';

  @override
  String get categoryBeauty => 'Bellezza';

  @override
  String get categoryHeadphones => 'Cuffie';

  @override
  String get categoryCameras => 'Fotocamere';

  @override
  String get categoryLaptopsElectronics => 'Informatica';

  @override
  String get categoryBabyToys => 'Bimbi e Giocattoli';
}
