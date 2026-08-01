// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Continuer';

  @override
  String get cancel => 'Annuler';

  @override
  String get retry => 'Réessayer';

  @override
  String get somethingWentWrong => 'Un problème est survenu';

  @override
  String get skip => 'Passer';

  @override
  String get next => 'Suivant';

  @override
  String get splashTagline => 'Achetez plus intelligemment. Arrivez plus vite.';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get onboarding1Title => 'Tout acheter,\nau même endroit';

  @override
  String get onboarding1Desc =>
      'Explorez des milliers de produits sélectionnés dans la mode, la technologie, la maison et plus encore, le tout à partir d\'une seule application fluide.';

  @override
  String get onboarding2Title => 'Livraison rapide\net traçable';

  @override
  String get onboarding2Desc =>
      'Bénéficiez d\'un suivi de commande en temps réel et d\'estimations de livraison fiables, du paiement à votre porte.';

  @override
  String get onboarding3Title => 'Paiement sécurisé\net de confiance';

  @override
  String get onboarding3Desc =>
      'Payez à votre façon avec une sécurité de niveau bancaire : cartes, portefeuilles ou paiement à la livraison, votre choix, à chaque fois.';

  @override
  String get welcomeBack => 'Bon retour';

  @override
  String get signInSubtitle =>
      'Connectez-vous pour continuer vos achats avec NovaCart';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get emailHint => 'vous@exemple.com';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get passwordHint => 'Entrez votre mot de passe';

  @override
  String get rememberMe => 'Se souvenir de moi';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get signIn => 'Se connecter';

  @override
  String get orContinueWith => 'ou continuer avec';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get noAccount => 'Vous n\'avez pas de compte ? ';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get joinNovaCart => 'Rejoindre NovaCart';

  @override
  String get signUpSubtitle =>
      'Créez un compte pour commencer à acheter plus intelligemment';

  @override
  String get fullNameLabel => 'Nom complet';

  @override
  String get confirmPasswordLabel => 'Confirmer le mot de passe';

  @override
  String get agreeTerms =>
      'J\'accepte les conditions générales et la politique de confidentialité';

  @override
  String get resetPasswordTitle => 'Réinitialiser votre mot de passe';

  @override
  String get resetPasswordSubtitle =>
      'Entrez l\'e-mail associé à votre compte et nous vous enverrons un lien pour réinitialiser votre mot de passe.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Nous avons envoyé un lien de réinitialisation de mot de passe à $email. Suivez les instructions de l\'e-mail pour définir un nouveau mot de passe.';
  }

  @override
  String get sendResetLink => 'Envoyer le lien';

  @override
  String get backToSignIn => 'Retour à la connexion';

  @override
  String get resendLink => 'Renvoyer le lien';

  @override
  String get checkYourEmail => 'Vérifiez vos e-mails';

  @override
  String get navHome => 'Accueil';

  @override
  String get navCategories => 'Catégories';

  @override
  String get navWishlist => 'Favoris';

  @override
  String get navProfile => 'Profil';

  @override
  String get searchHint => 'Que recherchez-vous ?';

  @override
  String get categoriesTitle => 'Catégories';

  @override
  String get flashSaleTitle => '⚡ Vente Flash';

  @override
  String get bestSellersTitle => '🔥 Meilleures ventes';

  @override
  String get newArrivalsTitle => '✨ Nouveautés';

  @override
  String get recommendedTitle => 'Recommandé pour vous';

  @override
  String get recentlyViewedTitle => 'Vus récemment';

  @override
  String get viewAll => 'Voir tout';

  @override
  String get addToCart => 'Ajouter au panier';

  @override
  String get outOfStock => 'En rupture de stock';

  @override
  String get cartTitle => 'Panier';

  @override
  String get yourCartIsEmpty => 'Votre panier est vide';

  @override
  String get addProductsMessage =>
      'Ajoutez des produits à votre panier pour les voir ici.';

  @override
  String get startShopping => 'Commencer vos achats';

  @override
  String get savedForLaterSection => 'Mis de côté';

  @override
  String get moveToCart => 'Mettre au panier';

  @override
  String get saveForLater => 'Mettre de côté';

  @override
  String get checkout => 'Payer';

  @override
  String get orderSummary => 'Résumé de la commande';

  @override
  String get subtotal => 'Sous-total';

  @override
  String get discountLabel => 'Remise';

  @override
  String get shippingLabel => 'Livraison';

  @override
  String get freeLabel => 'Gratuit';

  @override
  String get vatLabel => 'TVA (14%)';

  @override
  String get totalLabel => 'Total';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Livraison estimée : $date';
  }

  @override
  String get enterCouponCode => 'Entrer le code coupon';

  @override
  String get applyLabel => 'Appliquer';

  @override
  String couponApplied(String code) {
    return '$code appliqué';
  }

  @override
  String get wishlistTitle => 'Favoris';

  @override
  String get wishlistEmptyTitle => 'Votre liste de souhaits est vide';

  @override
  String get wishlistEmptyMessage =>
      'Appuyez sur le cœur sur n\'importe quel produit pour l\'enregistrer ici.';

  @override
  String get browseProducts => 'Parcourir les produits';

  @override
  String get shopNow => 'Acheter maintenant';

  @override
  String browseAllIn(String category) {
    return 'Voir tous les produits dans $category';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count résultats pour \"$query\"';
  }

  @override
  String get noResultsFound => 'Aucun résultat trouvé';

  @override
  String get recentSearchesTitle => 'Recherches récentes';

  @override
  String get clearAll => 'Tout effacer';

  @override
  String get trendingSearchesTitle => 'Tendances';

  @override
  String get filterAndSort => 'Filtrer et trier';

  @override
  String filtersCount(int count) {
    return 'Filtres ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count articles',
      one: '$count article',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Panier vide';

  @override
  String get moveItemsBackMessage =>
      'Récupérez les articles de mis de côté ou continuez vos achats.';

  @override
  String savedForLaterCount(int count) {
    return 'Mis de côté ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Payer · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Code coupon invalide ou expiré';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produits',
      one: '$count produit',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'Aucun produit trouvé';

  @override
  String get tryAdjustingFiltersMessage =>
      'Essayez d\'ajuster vos filtres pour voir plus de résultats.';

  @override
  String get clearFiltersLabel => 'Effacer les filtres';

  @override
  String get compareProductsTooltip => 'Comparer les produits';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'Nous n\'avons rien trouvé pour \"$query\". Essayez un autre mot-clé.';
  }

  @override
  String get noProductsMatchFiltersMessage =>
      'Aucun produit ne correspond à vos filtres. Essayez de les ajuster.';

  @override
  String get searchFieldHint => 'Rechercher des produits, des marques...';

  @override
  String get resetLabel => 'Réinitialiser';

  @override
  String get sortByLabel => 'Trier par';

  @override
  String get priceRangeLabel => 'Plage de prix';

  @override
  String get minimumRatingLabel => 'Note minimale';

  @override
  String get anyLabel => 'Tout';

  @override
  String get brandLabel => 'Marque';

  @override
  String get applyFiltersLabel => 'Appliquer les filtres';

  @override
  String get sortRelevance => 'Pertinence';

  @override
  String get sortPriceLowToHigh => 'Prix : Croissant';

  @override
  String get sortPriceHighToLow => 'Prix : Décroissant';

  @override
  String get sortRatingHighToLow => 'Mieux notés';

  @override
  String get sortNewest => 'Nouveautés';

  @override
  String get productDetailsTitle => 'Détails du produit';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get noDescriptionAvailable =>
      'Aucune description disponible pour ce produit pour le moment.';

  @override
  String get readMoreLabel => 'Lire plus';

  @override
  String get showLessLabel => 'Moins';

  @override
  String get sizeLabel => 'Taille';

  @override
  String get colorLabel => 'Couleur';

  @override
  String get youMightAlsoLike => 'Vous pourriez aussi aimer';

  @override
  String soldCountLabel(int count) {
    return '$count vendus';
  }

  @override
  String sharingProductMessage(String name) {
    return 'Partage de $name...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return 'Ajouté $quantity× $name au panier';
  }

  @override
  String get addedToWishlistMessage => 'Ajouté aux favoris';

  @override
  String get removedFromWishlistMessage => 'Retiré des favoris';

  @override
  String get ratingsAndReviewsTitle => 'Notes et avis';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count avis',
      one: '$count avis',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Voir les $count avis',
      one: 'Voir 1 avis',
    );
    return '$_temp0';
  }

  @override
  String get estimatedDeliveryTitle => 'Livraison estimée';

  @override
  String arrivesByMessage(String date) {
    return 'Arrive d\'ici le $date si commandé aujourd\'hui';
  }

  @override
  String get freeReturnsTitle => 'Retours gratuits';

  @override
  String get freeReturnsSubtitle =>
      'Délai de 30 jours, sans poser de questions';

  @override
  String get secureCheckoutTitle => 'Paiement sécurisé';

  @override
  String get secureCheckoutSubtitle =>
      'Paiement à la livraison, cartes et portefeuilles numériques acceptés';

  @override
  String get specificationsTitle => 'Spécifications';

  @override
  String get categoryLabel => 'Catégorie';

  @override
  String get availableColorsLabel => 'Couleurs disponibles';

  @override
  String availableColorsValue(int count) {
    return '$count options';
  }

  @override
  String get availableSizesLabel => 'Tailles disponibles';

  @override
  String get unitsSoldLabel => 'Unités vendues';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => 'Aujourd\'hui';

  @override
  String daysAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il y a $count jours',
      one: 'Il y a 1 jour',
    );
    return '$_temp0';
  }

  @override
  String monthsAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il y a $count mois',
      one: 'Il y a 1 mois',
    );
    return '$_temp0';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Tous les avis ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Ajouter au panier · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Paiement à la livraison';

  @override
  String get paymentCard => 'Carte de crédit / débit';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Payez à l\'arrivée de votre commande';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard et plus';

  @override
  String get paymentApplePaySubtitle =>
      'Payez instantanément avec Face ID / Touch ID';

  @override
  String get paymentGooglePaySubtitle =>
      'Payez instantanément avec votre compte Google';

  @override
  String get orderStatusProcessing => 'Traitement';

  @override
  String get orderStatusShipped => 'Expédié';

  @override
  String get orderStatusOutForDelivery => 'En cours de livraison';

  @override
  String get orderStatusDelivered => 'Livré';

  @override
  String get orderStatusCancelled => 'Annulé';

  @override
  String get checkoutTitle => 'Paiement';

  @override
  String get selectShippingAddress => 'Sélectionnez une adresse de livraison';

  @override
  String get addNewAddress => 'Ajouter une nouvelle adresse';

  @override
  String get selectPaymentMethod => 'Sélectionnez un mode de paiement';

  @override
  String get demoCheckoutDisclaimer =>
      'Ceci est un paiement de démonstration — aucun frais réel ne sera facturé.';

  @override
  String get stepAddressLabel => 'Adresse';

  @override
  String get stepPaymentLabel => 'Paiement';

  @override
  String get stepReviewLabel => 'Résumé';

  @override
  String get changeLabel => 'Modifier';

  @override
  String get shippingToLabel => 'Livraison à';

  @override
  String get backLabel => 'Retour';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Commander · EGP $amount';
  }

  @override
  String get defaultLabel => 'PAR DÉFAUT';

  @override
  String get phoneNumberLabel => 'Numéro de téléphone';

  @override
  String get addressHintLabel => 'Rue, bâtiment, numéro d\'appartement';

  @override
  String get cityLabel => 'Ville';

  @override
  String get saveAddressLabel => 'Enregistrer l\'adresse';

  @override
  String get orderPlacedTitle => 'Commande passée !';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Votre commande #$orderId a été confirmée.';
  }

  @override
  String get itemsLabel => 'Articles';

  @override
  String get totalPaidLabel => 'Total payé';

  @override
  String get continueShoppingLabel => 'Continuer les achats';

  @override
  String get viewOrderLabel => 'Voir la commande';

  @override
  String get orderTrackingTitle => 'Suivi de commande';

  @override
  String get orderHistoryTitle => 'Historique des commandes';

  @override
  String get orderNotFoundTitle => 'Commande non trouvée';

  @override
  String get orderNotFoundMessage =>
      'Nous n\'avons pas pu trouver cette commande.';

  @override
  String get backToOrdersLabel => 'Retour aux commandes';

  @override
  String get noOrdersYetTitle => 'Pas encore de commandes';

  @override
  String get noOrdersYetMessage =>
      'Vos commandes passées apparaîtront ici une fois que vous en aurez passé une.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Articles ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Qté $count';
  }

  @override
  String get shippingAddressTitle => 'Adresse de livraison';

  @override
  String get paymentMethodTitle => 'Mode de paiement';

  @override
  String get orderCancelledMessage => 'Cette commande a été annulée.';

  @override
  String orderNumberLabel(String id) {
    return 'Commande #$id';
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
  String get stageProcessingTitle => 'Traitement de la commande';

  @override
  String get stageProcessingSubtitle => 'Nous avons reçu votre commande';

  @override
  String get stageShippedSubtitle => 'Votre commande a quitté notre entrepôt';

  @override
  String get stageOutForDeliverySubtitle => 'Votre commande est en chemin';

  @override
  String get stageDeliveredSubtitle => 'Profitez de votre commande !';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get markAllReadLabel => 'Tout marquer comme lu';

  @override
  String get noNotificationsYetTitle => 'Pas encore de notifications';

  @override
  String get noNotificationsYetMessage =>
      'Les mises à jour des commandes et les promotions apparaîtront ici.';

  @override
  String minutesAgoShort(int count) {
    return 'il y a ${count}m';
  }

  @override
  String hoursAgoShort(int count) {
    return 'il y a ${count}h';
  }

  @override
  String daysAgoShort(int count) {
    return 'il y a ${count}j';
  }

  @override
  String get profileTitle => 'Profil';

  @override
  String get yourNovaCartAccount => 'Votre compte NovaCart';

  @override
  String get tapToEditProfileMessage =>
      'Appuyez pour modifier votre nom et votre numéro de téléphone';

  @override
  String get darkModeLabel => 'Mode sombre';

  @override
  String get languageLabel => 'Langue';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Adresses enregistrées';

  @override
  String get paymentMethodsLabel => 'Modes de paiement';

  @override
  String get helpCenterLabel => 'Centre d\'aide';

  @override
  String get privacyPolicyLabel => 'Politique de confidentialité';

  @override
  String get termsConditionsLabel => 'Conditions générales';

  @override
  String get signOutLabel => 'Se déconnecter';

  @override
  String get biometricConfirmReason =>
      'Confirmer pour activer la connexion biométrique';

  @override
  String get biometricLoginLabel => 'Connexion biométrique';

  @override
  String get biometricLoginSubtitle =>
      'Exiger Face ID / Touch ID pour ouvrir l\'application';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — bientôt disponible';
  }

  @override
  String get editProfileTitle => 'Modifier le profil';

  @override
  String get profileUpdatedMessage => 'Profil mis à jour';

  @override
  String get saveChangesLabel => 'Enregistrer les modifications';

  @override
  String get rtlNoteMessage =>
      'La direction de la mise en page est mise à jour instantanément. La traduction complète du texte en arabe arrivera dans une future mise à jour.';

  @override
  String get noSavedAddressesTitle => 'Aucune adresse enregistrée';

  @override
  String get noSavedAddressesMessage =>
      'Ajoutez une adresse de livraison pour accélérer le paiement la prochaine fois.';

  @override
  String get helpCenterFaqTitle => 'Foire aux questions';

  @override
  String get faqQ1 => 'Comment suivre ma commande ?';

  @override
  String get faqA1 =>
      'Allez dans Profil → Historique des commandes, appuyez sur n\'importe quelle commande pour voir son calendrier d\'état en direct.';

  @override
  String get faqQ2 => 'Quels modes de paiement sont acceptés ?';

  @override
  String get faqA2 =>
      'Paiement à la livraison, carte de crédit/débit, Apple Pay et Google Pay.';

  @override
  String get faqQ3 => 'Comment retourner un article ?';

  @override
  String get faqA3 =>
      'Les articles peuvent être retournés dans les 30 jours suivant la livraison. Contactez le support depuis cet écran pour lancer un retour.';

  @override
  String get faqQ4 => 'Combien de temps prend la livraison ?';

  @override
  String get faqA4 =>
      'La plupart des commandes arrivent dans les 3 à 5 jours ouvrables. Vous verrez une date de livraison estimée au paiement et dans votre suivi de commande.';

  @override
  String get faqQ5 => 'Comment appliquer un code coupon ?';

  @override
  String get faqA5 =>
      'Entrez-le dans l\'écran du Panier juste au-dessus du résumé de la commande, puis appuyez sur Appliquer.';

  @override
  String get stillNeedHelpTitle => 'Encore besoin d\'aide ?';

  @override
  String get contactSupportLabel => 'Contacter le support';

  @override
  String get aboutFeedbackTitle => 'À propos et commentaires';

  @override
  String get loadingVersionLabel => 'Chargement de la version...';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Envoyez-nous vos commentaires';

  @override
  String get feedbackIntroMessage =>
      'Vous avez trouvé un bug ou vous avez une idée pour améliorer NovaCart ? Nous lisons chaque message.';

  @override
  String get feedbackHintText => 'Dites-nous ce que vous en pensez...';

  @override
  String get submitFeedbackLabel => 'Envoyer les commentaires';

  @override
  String get feedbackThanksMessage => 'Merci pour vos commentaires !';

  @override
  String get feedbackErrorMessage =>
      'Impossible d\'envoyer les commentaires. Veuillez réessayer.';

  @override
  String get privacySection1Heading => 'Informations que nous collectons';

  @override
  String get privacySection1Body =>
      'Nous collectons les informations que vous fournissez directement (nom, e-mail, téléphone, adresses de livraison) et les informations générées par l\'utilisation de l\'application (historique des commandes, liste de souhaits, activité de navigation) pour faire fonctionner NovaCart.';

  @override
  String get privacySection2Heading =>
      'Comment nous utilisons vos informations';

  @override
  String get privacySection2Body =>
      'Vos informations sont utilisées pour traiter les commandes, fournir un support client, personnaliser les recommandations de produits et envoyer des notifications de commande/promotionnelles auxquelles vous pouvez vous désabonner à tout moment.';

  @override
  String get privacySection3Heading => 'Sécurité des données';

  @override
  String get privacySection3Body =>
      'Toutes les données sont stockées à l\'aide de l\'infrastructure sécurisée de Firebase avec des règles d\'accès par utilisateur — aucun autre utilisateur ou demande non authentifiée ne peut lire vos commandes, adresses ou liste de souhaits.';

  @override
  String get privacySection4Heading => 'Vos droits';

  @override
  String get privacySection4Body =>
      'Vous pouvez modifier ou supprimer vos informations personnelles, vos adresses enregistrées et votre compte à tout moment à partir de la section Profil.';

  @override
  String get termsSection1Heading => 'Acceptation des conditions';

  @override
  String get termsSection1Body =>
      'En créant un compte NovaCart ou en passant une commande, vous acceptez ces conditions générales.';

  @override
  String get termsSection2Heading => 'Commandes et paiement';

  @override
  String get termsSection2Body =>
      'Toutes les commandes sont soumises à la disponibilité des produits. Les prix sont affichés en EGP et incluent toutes les taxes applicables au paiement.';

  @override
  String get termsSection3Heading => 'Expédition et retours';

  @override
  String get termsSection3Body =>
      'Les délais de livraison estimés sont affichés au paiement. Les articles peuvent être retournés dans les 30 jours suivant la livraison dans leur état d\'origine.';

  @override
  String get termsSection4Heading => 'Limitation de responsabilité';

  @override
  String get termsSection4Body =>
      'NovaCart n\'est pas responsable des dommages indirects ou consécutifs découlant de l\'utilisation de cette application, dans la mesure maximale autorisée par la loi.';

  @override
  String get unlockNovaCartTitle => 'Déverrouiller NovaCart';

  @override
  String get waitingForAuthMessage => 'En attente d\'authentification...';

  @override
  String get couldntVerifyMessage => 'Impossible de vous vérifier';

  @override
  String get useFaceIdMessage =>
      'Utilisez Face ID, Touch ID ou le code PIN de votre appareil pour continuer.';

  @override
  String get signInWithPasswordInstead =>
      'Se connecter avec un mot de passe à la place';

  @override
  String get voiceSearchComingSoon =>
      'La recherche vocale arrive dans une future mise à jour';

  @override
  String get fullNameHint => 'Votre nom complet';

  @override
  String get compareProductsTitle => 'Comparer les produits';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Rien à comparer pour le moment';

  @override
  String get nothingToCompareMessage =>
      'Sélectionnez 2-3 produits d\'une catégorie pour les comparer côte à côte.';

  @override
  String get browseCategoriesLabel => 'Parcourir les catégories';

  @override
  String get priceLabel => 'Prix';

  @override
  String get ratingLabel => 'Note';

  @override
  String get colorsLabel => 'Couleurs';

  @override
  String get sizesLabel => 'Tailles';

  @override
  String get supportChatTitle => 'Chat de support';

  @override
  String get typeMessageHint => 'Tapez un message...';

  @override
  String get categoryWomensFashion => 'Mode Femme';

  @override
  String get categoryMensFashion => 'Mode Homme';

  @override
  String get categorySkincare => 'Soin de la peau';

  @override
  String get categoryBeauty => 'Beauté';

  @override
  String get categoryHeadphones => 'Casques';

  @override
  String get categoryCameras => 'Appareils photo';

  @override
  String get categoryLaptopsElectronics => 'Ordinateurs et Électronique';

  @override
  String get categoryBabyToys => 'Bébé et Jouets';
}
