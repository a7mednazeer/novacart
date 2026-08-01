// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get somethingWentWrong => 'Algo deu errado';

  @override
  String get skip => 'Pular';

  @override
  String get next => 'Próximo';

  @override
  String get splashTagline => 'Compre de forma inteligente. Receba rápido.';

  @override
  String get onboardingGetStarted => 'Começar';

  @override
  String get onboarding1Title => 'Compre tudo,\nnum só lugar';

  @override
  String get onboarding1Desc =>
      'Explore milhares de produtos em moda, tecnologia, casa e muito mais, tudo num só app.';

  @override
  String get onboarding2Title => 'Entrega rápida\ne rastreável';

  @override
  String get onboarding2Desc =>
      'Acompanhamento em tempo real e estimativas de entrega confiáveis.';

  @override
  String get onboarding3Title => 'Checkout seguro';

  @override
  String get onboarding3Desc =>
      'Pague do seu jeito: cartões, carteiras ou dinheiro na entrega.';

  @override
  String get welcomeBack => 'Bem-vindo de volta';

  @override
  String get signInSubtitle => 'Faça login para continuar suas compras';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get emailHint => 'voce@exemplo.com';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get passwordHint => 'Digite sua senha';

  @override
  String get rememberMe => 'Lembrar-me';

  @override
  String get forgotPassword => 'Esqueceu a senha?';

  @override
  String get signIn => 'Entrar';

  @override
  String get orContinueWith => 'ou continue com';

  @override
  String get continueWithGoogle => 'Continuar com Google';

  @override
  String get noAccount => 'Não tem uma conta? ';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get joinNovaCart => 'Junte-se ao NovaCart';

  @override
  String get signUpSubtitle => 'Crie uma conta para comprar melhor';

  @override
  String get fullNameLabel => 'Nome completo';

  @override
  String get confirmPasswordLabel => 'Confirmar senha';

  @override
  String get agreeTerms => 'Aceito os termos e privacidade';

  @override
  String get resetPasswordTitle => 'Redefinir senha';

  @override
  String get resetPasswordSubtitle => 'Insira seu e-mail para receber o link.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Link enviado para $email.';
  }

  @override
  String get sendResetLink => 'Enviar link';

  @override
  String get backToSignIn => 'Voltar ao login';

  @override
  String get resendLink => 'Reenviar link';

  @override
  String get checkYourEmail => 'Verifique seu e-mail';

  @override
  String get navHome => 'Início';

  @override
  String get navCategories => 'Categorias';

  @override
  String get navWishlist => 'Desejos';

  @override
  String get navProfile => 'Perfil';

  @override
  String get searchHint => 'O que procura?';

  @override
  String get categoriesTitle => 'Categorias';

  @override
  String get flashSaleTitle => '⚡ Oferta Relâmpago';

  @override
  String get bestSellersTitle => '🔥 Mais vendidos';

  @override
  String get newArrivalsTitle => '✨ Novidades';

  @override
  String get recommendedTitle => 'Recomendados';

  @override
  String get recentlyViewedTitle => 'Vistos recentemente';

  @override
  String get viewAll => 'Ver tudo';

  @override
  String get addToCart => 'Adicionar ao carrinho';

  @override
  String get outOfStock => 'Esgotado';

  @override
  String get cartTitle => 'Carrinho';

  @override
  String get yourCartIsEmpty => 'Seu carrinho está vazio';

  @override
  String get addProductsMessage => 'Adicione produtos para ver aqui.';

  @override
  String get startShopping => 'Começar compras';

  @override
  String get savedForLaterSection => 'Salvos';

  @override
  String get moveToCart => 'Mover ao carrinho';

  @override
  String get saveForLater => 'Salvar para depois';

  @override
  String get checkout => 'Finalizar';

  @override
  String get orderSummary => 'Resumo';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get discountLabel => 'Desconto';

  @override
  String get shippingLabel => 'Frete';

  @override
  String get freeLabel => 'Grátis';

  @override
  String get vatLabel => 'IVA (14%)';

  @override
  String get totalLabel => 'Total';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Entrega: $date';
  }

  @override
  String get enterCouponCode => 'Inserir cupom';

  @override
  String get applyLabel => 'Aplicar';

  @override
  String couponApplied(String code) {
    return 'Cupom $code aplicado';
  }

  @override
  String get wishlistTitle => 'Desejos';

  @override
  String get wishlistEmptyTitle => 'Lista vazia';

  @override
  String get wishlistEmptyMessage => 'Salve produtos com o coração.';

  @override
  String get browseProducts => 'Ver produtos';

  @override
  String get shopNow => 'Comprar agora';

  @override
  String browseAllIn(String category) {
    return 'Tudo em $category';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count resultados para \"$query\"';
  }

  @override
  String get noResultsFound => 'Nenhum resultado';

  @override
  String get recentSearchesTitle => 'Buscas recentes';

  @override
  String get clearAll => 'Limpar';

  @override
  String get trendingSearchesTitle => 'Tendências';

  @override
  String get filterAndSort => 'Filtrar';

  @override
  String filtersCount(int count) {
    return 'Filtros ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Vazio';

  @override
  String get moveItemsBackMessage => 'Recupere dos salvos.';

  @override
  String savedForLaterCount(int count) {
    return 'Salvos ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Pagar · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Código inválido';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produtos',
      one: '$count produto',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'Nenhum produto';

  @override
  String get tryAdjustingFiltersMessage => 'Ajuste os filtros.';

  @override
  String get clearFiltersLabel => 'Limpar filtros';

  @override
  String get compareProductsTooltip => 'Comparar';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'Nenhum resultado para \"$query\".';
  }

  @override
  String get noProductsMatchFiltersMessage => 'Sem correspondências.';

  @override
  String get searchFieldHint => 'Buscar...';

  @override
  String get resetLabel => 'Resetar';

  @override
  String get sortByLabel => 'Ordenar';

  @override
  String get priceRangeLabel => 'Preço';

  @override
  String get minimumRatingLabel => 'Avaliação mín.';

  @override
  String get anyLabel => 'Qualquer';

  @override
  String get brandLabel => 'Marca';

  @override
  String get applyFiltersLabel => 'Aplicar';

  @override
  String get sortRelevance => 'Relevância';

  @override
  String get sortPriceLowToHigh => 'Preço: Menor p/ Maior';

  @override
  String get sortPriceHighToLow => 'Preço: Maior p/ Menor';

  @override
  String get sortRatingHighToLow => 'Melhores avaliados';

  @override
  String get sortNewest => 'Novidades';

  @override
  String get productDetailsTitle => 'Detalhes';

  @override
  String get descriptionLabel => 'Descrição';

  @override
  String get noDescriptionAvailable => 'Sem descrição.';

  @override
  String get readMoreLabel => 'Ler mais';

  @override
  String get showLessLabel => 'Menos';

  @override
  String get sizeLabel => 'Tamanho';

  @override
  String get colorLabel => 'Cor';

  @override
  String get youMightAlsoLike => 'Pode gostar também';

  @override
  String soldCountLabel(int count) {
    return '$count vendidos';
  }

  @override
  String sharingProductMessage(String name) {
    return 'Compartilhando $name...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return 'Adicionado $quantity× $name';
  }

  @override
  String get addedToWishlistMessage => 'Adicionado';

  @override
  String get removedFromWishlistMessage => 'Removido';

  @override
  String get ratingsAndReviewsTitle => 'Avaliações';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count avaliações',
      one: '$count avaliação',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    return 'Ver todas as $count';
  }

  @override
  String get estimatedDeliveryTitle => 'Entrega';

  @override
  String arrivesByMessage(String date) {
    return 'Chega em $date';
  }

  @override
  String get freeReturnsTitle => 'Devolução grátis';

  @override
  String get freeReturnsSubtitle => 'Até 30 dias';

  @override
  String get secureCheckoutTitle => 'Pagamento seguro';

  @override
  String get secureCheckoutSubtitle => 'Transação protegida';

  @override
  String get specificationsTitle => 'Especificações';

  @override
  String get categoryLabel => 'Categoria';

  @override
  String get availableColorsLabel => 'Cores';

  @override
  String availableColorsValue(int count) {
    return '$count opções';
  }

  @override
  String get availableSizesLabel => 'Tamanhos';

  @override
  String get unitsSoldLabel => 'Vendidos';

  @override
  String unitsSoldValue(int count) {
    return '+$count';
  }

  @override
  String get todayLabel => 'Hoje';

  @override
  String daysAgoLabel(int count) {
    return 'Há $count dias';
  }

  @override
  String monthsAgoLabel(int count) {
    return 'Há $count meses';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Avaliações ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Adicionar · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Dinheiro';

  @override
  String get paymentCard => 'Cartão';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Pague ao receber';

  @override
  String get paymentCardSubtitle => 'Visa, Master, etc.';

  @override
  String get paymentApplePaySubtitle => 'Rápido com Face ID';

  @override
  String get paymentGooglePaySubtitle => 'Rápido com Google';

  @override
  String get orderStatusProcessing => 'Processando';

  @override
  String get orderStatusShipped => 'Enviado';

  @override
  String get orderStatusOutForDelivery => 'Em entrega';

  @override
  String get orderStatusDelivered => 'Entregue';

  @override
  String get orderStatusCancelled => 'Cancelado';

  @override
  String get checkoutTitle => 'Pagamento';

  @override
  String get selectShippingAddress => 'Endereço de entrega';

  @override
  String get addNewAddress => 'Novo endereço';

  @override
  String get selectPaymentMethod => 'Método de pagamento';

  @override
  String get demoCheckoutDisclaimer => 'Apenas demonstração.';

  @override
  String get stepAddressLabel => 'Endereço';

  @override
  String get stepPaymentLabel => 'Pagamento';

  @override
  String get stepReviewLabel => 'Revisão';

  @override
  String get changeLabel => 'Alt.';

  @override
  String get shippingToLabel => 'Enviar para';

  @override
  String get backLabel => 'Voltar';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Pedir · EGP $amount';
  }

  @override
  String get defaultLabel => 'PADRÃO';

  @override
  String get phoneNumberLabel => 'Telefone';

  @override
  String get addressHintLabel => 'Rua, número, apto';

  @override
  String get cityLabel => 'Cidade';

  @override
  String get saveAddressLabel => 'Salvar';

  @override
  String get orderPlacedTitle => 'Pedido realizado!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Pedido #$orderId confirmado.';
  }

  @override
  String get itemsLabel => 'Itens';

  @override
  String get totalPaidLabel => 'Pago';

  @override
  String get continueShoppingLabel => 'Continuar';

  @override
  String get viewOrderLabel => 'Ver pedido';

  @override
  String get orderTrackingTitle => 'Rastreio';

  @override
  String get orderHistoryTitle => 'Historial';

  @override
  String get orderNotFoundTitle => 'Não encontrado';

  @override
  String get orderNotFoundMessage => 'Pedido inexistente.';

  @override
  String get backToOrdersLabel => 'Voltar';

  @override
  String get noOrdersYetTitle => 'Sem pedidos';

  @override
  String get noOrdersYetMessage => 'Seus pedidos aparecerão aqui.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Itens ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Qtd $count';
  }

  @override
  String get shippingAddressTitle => 'Endereço';

  @override
  String get paymentMethodTitle => 'Pagamento';

  @override
  String get orderCancelledMessage => 'Cancelado.';

  @override
  String orderNumberLabel(String id) {
    return 'Pedido #$id';
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
  String get stageProcessingTitle => 'Processando';

  @override
  String get stageProcessingSubtitle => 'Recebido';

  @override
  String get stageShippedSubtitle => 'Enviado';

  @override
  String get stageOutForDeliverySubtitle => 'A caminho';

  @override
  String get stageDeliveredSubtitle => 'Entregue!';

  @override
  String get notificationsTitle => 'Notificações';

  @override
  String get markAllReadLabel => 'Lidas';

  @override
  String get noNotificationsYetTitle => 'Vazio';

  @override
  String get noNotificationsYetMessage => 'Nada novo.';

  @override
  String minutesAgoShort(int count) {
    return 'há ${count}m';
  }

  @override
  String hoursAgoShort(int count) {
    return 'há ${count}h';
  }

  @override
  String daysAgoShort(int count) {
    return 'há ${count}d';
  }

  @override
  String get profileTitle => 'Perfil';

  @override
  String get yourNovaCartAccount => 'Sua conta';

  @override
  String get tapToEditProfileMessage => 'Editar informações';

  @override
  String get darkModeLabel => 'Modo escuro';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Endereços';

  @override
  String get paymentMethodsLabel => 'Pagamentos';

  @override
  String get helpCenterLabel => 'Ajuda';

  @override
  String get privacyPolicyLabel => 'Privacidade';

  @override
  String get termsConditionsLabel => 'Termos';

  @override
  String get signOutLabel => 'Sair';

  @override
  String get biometricConfirmReason => 'Confirmar biometria';

  @override
  String get biometricLoginLabel => 'Acesso biométrico';

  @override
  String get biometricLoginSubtitle => 'Face ID / Touch ID';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — breve';
  }

  @override
  String get editProfileTitle => 'Editar perfil';

  @override
  String get profileUpdatedMessage => 'Atualizado';

  @override
  String get saveChangesLabel => 'Salvar';

  @override
  String get rtlNoteMessage => 'Interface atualizada.';

  @override
  String get noSavedAddressesTitle => 'Sem endereços';

  @override
  String get noSavedAddressesMessage => 'Adicione um.';

  @override
  String get helpCenterFaqTitle => 'FAQ';

  @override
  String get faqQ1 => 'Rastreio?';

  @override
  String get faqA1 => 'Perfil → Pedidos.';

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
  String get stillNeedHelpTitle => 'Precisa de ajuda?';

  @override
  String get contactSupportLabel => 'Contato';

  @override
  String get aboutFeedbackTitle => 'Sobre';

  @override
  String get loadingVersionLabel => 'Carregando...';

  @override
  String versionLabel(String version) {
    return 'Versão $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Feedback';

  @override
  String get feedbackIntroMessage => 'Achou um erro?';

  @override
  String get feedbackHintText => 'Sua opinião...';

  @override
  String get submitFeedbackLabel => 'Enviar';

  @override
  String get feedbackThanksMessage => 'Obrigado!';

  @override
  String get feedbackErrorMessage => 'Erro ao enviar.';

  @override
  String get privacySection1Heading => 'Dados';

  @override
  String get privacySection1Body => 'Protegemos seus dados.';

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
  String get termsSection1Heading => 'Termos';

  @override
  String get termsSection1Body => 'Uso do NovaCart...';

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
  String get unlockNovaCartTitle => 'Desbloquear';

  @override
  String get waitingForAuthMessage => 'Validando...';

  @override
  String get couldntVerifyMessage => 'Erro';

  @override
  String get useFaceIdMessage => 'Use Face ID.';

  @override
  String get signInWithPasswordInstead => 'Usar senha';

  @override
  String get voiceSearchComingSoon => 'Breve';

  @override
  String get fullNameHint => 'Nome';

  @override
  String get compareProductsTitle => 'Comparar';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Vazio';

  @override
  String get nothingToCompareMessage => 'Escolha 2-3 produtos.';

  @override
  String get browseCategoriesLabel => 'Categorias';

  @override
  String get priceLabel => 'Preço';

  @override
  String get ratingLabel => 'Nota';

  @override
  String get colorsLabel => 'Cores';

  @override
  String get sizesLabel => 'Tamanhos';

  @override
  String get supportChatTitle => 'Suporte';

  @override
  String get typeMessageHint => 'Mensagem...';

  @override
  String get categoryWomensFashion => 'Feminino';

  @override
  String get categoryMensFashion => 'Masculino';

  @override
  String get categorySkincare => 'Skincare';

  @override
  String get categoryBeauty => 'Beleza';

  @override
  String get categoryHeadphones => 'Fones';

  @override
  String get categoryCameras => 'Câmeras';

  @override
  String get categoryLaptopsElectronics => 'Eletrônicos';

  @override
  String get categoryBabyToys => 'Brinquedos';
}
