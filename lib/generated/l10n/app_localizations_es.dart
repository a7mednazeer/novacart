// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get retry => 'Reintentar';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get skip => 'Omitir';

  @override
  String get next => 'Siguiente';

  @override
  String get splashTagline => 'Compre de forma inteligente. Llegue más rápido.';

  @override
  String get onboardingGetStarted => 'Empezar';

  @override
  String get onboarding1Title => 'Compre todo,\nen un solo lugar';

  @override
  String get onboarding1Desc =>
      'Explore miles de productos seleccionados en moda, tecnología, hogar y más, todo desde una aplicación perfecta.';

  @override
  String get onboarding2Title => 'Entrega rápida\ny rastreable';

  @override
  String get onboarding2Desc =>
      'Obtenga un seguimiento de pedidos en tiempo real y estimaciones de entrega confiables, desde el pago hasta su puerta.';

  @override
  String get onboarding3Title => 'Pago seguro\ny confiable';

  @override
  String get onboarding3Desc =>
      'Pague a su manera con seguridad de nivel bancario: tarjetas, billeteras o pago contra reembolso, su elección, siempre.';

  @override
  String get welcomeBack => 'Bienvenido de nuevo';

  @override
  String get signInSubtitle =>
      'Inicie sesión para continuar comprando con NovaCart';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get emailHint => 'tu@ejemplo.com';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHint => 'Ingrese su contraseña';

  @override
  String get rememberMe => 'Recordarme';

  @override
  String get forgotPassword => '¿Olvidó su contraseña?';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get orContinueWith => 'o continuar con';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get noAccount => '¿No tiene una cuenta? ';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get joinNovaCart => 'Únete a NovaCart';

  @override
  String get signUpSubtitle =>
      'Cree una cuenta para comenzar a comprar de forma más inteligente';

  @override
  String get fullNameLabel => 'Nombre completo';

  @override
  String get confirmPasswordLabel => 'Confirmar contraseña';

  @override
  String get agreeTerms =>
      'Acepto los Términos y condiciones y la Política de privacidad';

  @override
  String get resetPasswordTitle => 'Restablecer su contraseña';

  @override
  String get resetPasswordSubtitle =>
      'Ingrese el correo electrónico asociado a su cuenta y le enviaremos un enlace para restablecer su contraseña.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Hemos enviado un enlace de restablecimiento de contraseña a $email. Siga las instrucciones del correo electrónico para establecer una nueva contraseña.';
  }

  @override
  String get sendResetLink => 'Enviar enlace de restablecimiento';

  @override
  String get backToSignIn => 'Volver a iniciar sesión';

  @override
  String get resendLink => 'Reenviar enlace';

  @override
  String get checkYourEmail => 'Revise su correo electrónico';

  @override
  String get navHome => 'Inicio';

  @override
  String get navCategories => 'Categorías';

  @override
  String get navWishlist => 'Deseos';

  @override
  String get navProfile => 'Perfil';

  @override
  String get searchHint => '¿Qué estás buscando?';

  @override
  String get categoriesTitle => 'Categorías';

  @override
  String get flashSaleTitle => '⚡ Oferta Relámpago';

  @override
  String get bestSellersTitle => '🔥 Los más vendidos';

  @override
  String get newArrivalsTitle => '✨ Recién llegados';

  @override
  String get recommendedTitle => 'Recomendado para ti';

  @override
  String get recentlyViewedTitle => 'Visto recientemente';

  @override
  String get viewAll => 'Ver todo';

  @override
  String get addToCart => 'Añadir al carrito';

  @override
  String get outOfStock => 'Agotado';

  @override
  String get cartTitle => 'Carrito';

  @override
  String get yourCartIsEmpty => 'Tu carrito está vacío';

  @override
  String get addProductsMessage =>
      'Añade productos a tu carrito para verlos aquí.';

  @override
  String get startShopping => 'Empezar a comprar';

  @override
  String get savedForLaterSection => 'Guardado para más tarde';

  @override
  String get moveToCart => 'Mover al carrito';

  @override
  String get saveForLater => 'Guardar para después';

  @override
  String get checkout => 'Pagar';

  @override
  String get orderSummary => 'Resumen del pedido';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get discountLabel => 'Descuento';

  @override
  String get shippingLabel => 'Envío';

  @override
  String get freeLabel => 'Gratis';

  @override
  String get vatLabel => 'IVA (14%)';

  @override
  String get totalLabel => 'Total';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Entrega estimada: $date';
  }

  @override
  String get enterCouponCode => 'Ingresar código de cupón';

  @override
  String get applyLabel => 'Aplicar';

  @override
  String couponApplied(String code) {
    return '$code aplicado';
  }

  @override
  String get wishlistTitle => 'Favoritos';

  @override
  String get wishlistEmptyTitle => 'Tu lista de deseos está vacía';

  @override
  String get wishlistEmptyMessage =>
      'Toca el corazón en cualquier producto para guardarlo aquí.';

  @override
  String get browseProducts => 'Explorar productos';

  @override
  String get shopNow => 'Comprar ahora';

  @override
  String browseAllIn(String category) {
    return 'Ver todos los productos en $category';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count resultados para \"$query\"';
  }

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get recentSearchesTitle => 'Búsquedas recientes';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get trendingSearchesTitle => 'Tendencias';

  @override
  String get filterAndSort => 'Filtrar y ordenar';

  @override
  String filtersCount(int count) {
    return 'Filtros ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artículos',
      one: '$count artículo',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Carrito vacío';

  @override
  String get moveItemsBackMessage =>
      'Mueve artículos de guardados para después o sigue comprando.';

  @override
  String savedForLaterCount(int count) {
    return 'Guardado para después ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Pagar · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Código de cupón inválido o vencido';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count productos',
      one: '$count producto',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'No se encontraron productos';

  @override
  String get tryAdjustingFiltersMessage =>
      'Intenta ajustar tus filtros para ver más resultados.';

  @override
  String get clearFiltersLabel => 'Borrar filtros';

  @override
  String get compareProductsTooltip => 'Comparar productos';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'No pudimos encontrar nada para \"$query\". Intenta con otra palabra.';
  }

  @override
  String get noProductsMatchFiltersMessage =>
      'Ningún producto coincide con tus filtros. Intenta ajustarlos.';

  @override
  String get searchFieldHint => 'Buscar productos, marcas...';

  @override
  String get resetLabel => 'Restablecer';

  @override
  String get sortByLabel => 'Ordenar por';

  @override
  String get priceRangeLabel => 'Rango de precio';

  @override
  String get minimumRatingLabel => 'Calificación mínima';

  @override
  String get anyLabel => 'Cualquiera';

  @override
  String get brandLabel => 'Marca';

  @override
  String get applyFiltersLabel => 'Aplicar filtros';

  @override
  String get sortRelevance => 'Relevancia';

  @override
  String get sortPriceLowToHigh => 'Precio: Menor a mayor';

  @override
  String get sortPriceHighToLow => 'Precio: Mayor a menor';

  @override
  String get sortRatingHighToLow => 'Mejor calificados';

  @override
  String get sortNewest => 'Más nuevos';

  @override
  String get productDetailsTitle => 'Detalles del producto';

  @override
  String get descriptionLabel => 'Descripción';

  @override
  String get noDescriptionAvailable =>
      'No hay descripción disponible para este producto todavía.';

  @override
  String get readMoreLabel => 'Leer más';

  @override
  String get showLessLabel => 'Mostrar menos';

  @override
  String get sizeLabel => 'Tamaño';

  @override
  String get colorLabel => 'Color';

  @override
  String get youMightAlsoLike => 'También te podría gustar';

  @override
  String soldCountLabel(int count) {
    return '$count vendidos';
  }

  @override
  String sharingProductMessage(String name) {
    return 'Compartiendo $name...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return 'Añadido $quantity× $name al carrito';
  }

  @override
  String get addedToWishlistMessage => 'Añadido a favoritos';

  @override
  String get removedFromWishlistMessage => 'Eliminado de favoritos';

  @override
  String get ratingsAndReviewsTitle => 'Calificaciones y reseñas';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reseñas',
      one: '$count reseña',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ver las $count reseñas',
      one: 'Ver 1 reseña',
    );
    return '$_temp0';
  }

  @override
  String get estimatedDeliveryTitle => 'Entrega estimada';

  @override
  String arrivesByMessage(String date) {
    return 'Llega el $date si se pide hoy';
  }

  @override
  String get freeReturnsTitle => 'Devoluciones gratuitas';

  @override
  String get freeReturnsSubtitle => 'Plazo de 30 días, sin preguntas';

  @override
  String get secureCheckoutTitle => 'Pago seguro';

  @override
  String get secureCheckoutSubtitle =>
      'Se acepta contra reembolso, tarjetas y billeteras digitales';

  @override
  String get specificationsTitle => 'Especificaciones';

  @override
  String get categoryLabel => 'Categoría';

  @override
  String get availableColorsLabel => 'Colores disponibles';

  @override
  String availableColorsValue(int count) {
    return '$count opciones';
  }

  @override
  String get availableSizesLabel => 'Tamaños disponibles';

  @override
  String get unitsSoldLabel => 'Unidades vendidas';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => 'Hoy';

  @override
  String daysAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hace $count días',
      one: 'Hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String monthsAgoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hace $count meses',
      one: 'Hace 1 mes',
    );
    return '$_temp0';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Todas las reseñas ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Añadir al carrito · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Pago contra reembolso';

  @override
  String get paymentCard => 'Tarjeta de crédito / débito';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Paga cuando llegue tu pedido';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard y más';

  @override
  String get paymentApplePaySubtitle =>
      'Paga al instante con Face ID / Touch ID';

  @override
  String get paymentGooglePaySubtitle =>
      'Paga al instante con tu cuenta de Google';

  @override
  String get orderStatusProcessing => 'Procesando';

  @override
  String get orderStatusShipped => 'Enviado';

  @override
  String get orderStatusOutForDelivery => 'En reparto';

  @override
  String get orderStatusDelivered => 'Entregado';

  @override
  String get orderStatusCancelled => 'Cancelado';

  @override
  String get checkoutTitle => 'Pagar';

  @override
  String get selectShippingAddress => 'Selecciona una dirección de envío';

  @override
  String get addNewAddress => 'Añadir nueva dirección';

  @override
  String get selectPaymentMethod => 'Selecciona un método de pago';

  @override
  String get demoCheckoutDisclaimer =>
      'Este es un pago de demostración; no se realizará ningún cargo real.';

  @override
  String get stepAddressLabel => 'Dirección';

  @override
  String get stepPaymentLabel => 'Pago';

  @override
  String get stepReviewLabel => 'Revisar';

  @override
  String get changeLabel => 'Cambiar';

  @override
  String get shippingToLabel => 'Enviando a';

  @override
  String get backLabel => 'Atrás';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Realizar pedido · EGP $amount';
  }

  @override
  String get defaultLabel => 'PREDETERMINADA';

  @override
  String get phoneNumberLabel => 'Número de teléfono';

  @override
  String get addressHintLabel => 'Calle, edificio, número de apartamento';

  @override
  String get cityLabel => 'Ciudad';

  @override
  String get saveAddressLabel => 'Guardar dirección';

  @override
  String get orderPlacedTitle => '¡Pedido realizado!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Tu pedido #$orderId ha sido confirmado.';
  }

  @override
  String get itemsLabel => 'Artículos';

  @override
  String get totalPaidLabel => 'Total pagado';

  @override
  String get continueShoppingLabel => 'Seguir comprando';

  @override
  String get viewOrderLabel => 'Ver pedido';

  @override
  String get orderTrackingTitle => 'Seguimiento del pedido';

  @override
  String get orderHistoryTitle => 'Historial de pedidos';

  @override
  String get orderNotFoundTitle => 'Pedido no encontrado';

  @override
  String get orderNotFoundMessage => 'No pudimos encontrar este pedido.';

  @override
  String get backToOrdersLabel => 'Volver a pedidos';

  @override
  String get noOrdersYetTitle => 'Sin pedidos aún';

  @override
  String get noOrdersYetMessage =>
      'Tus pedidos aparecerán aquí una vez que realices uno.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Artículos ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Cant $count';
  }

  @override
  String get shippingAddressTitle => 'Dirección de envío';

  @override
  String get paymentMethodTitle => 'Método de pago';

  @override
  String get orderCancelledMessage => 'Este pedido fue cancelado.';

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
  String get stageProcessingTitle => 'Procesando pedido';

  @override
  String get stageProcessingSubtitle => 'Hemos recibido tu pedido';

  @override
  String get stageShippedSubtitle => 'Tu pedido ha salido de nuestro almacén';

  @override
  String get stageOutForDeliverySubtitle => 'Tu pedido está en camino';

  @override
  String get stageDeliveredSubtitle => '¡Disfruta tu pedido!';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get markAllReadLabel => 'Marcar todo como leído';

  @override
  String get noNotificationsYetTitle => 'Sin notificaciones aún';

  @override
  String get noNotificationsYetMessage =>
      'Aquí aparecerán las actualizaciones de tus pedidos y promociones.';

  @override
  String minutesAgoShort(int count) {
    return 'hace ${count}m';
  }

  @override
  String hoursAgoShort(int count) {
    return 'hace ${count}h';
  }

  @override
  String daysAgoShort(int count) {
    return 'hace ${count}d';
  }

  @override
  String get profileTitle => 'Perfil';

  @override
  String get yourNovaCartAccount => 'Tu cuenta de NovaCart';

  @override
  String get tapToEditProfileMessage =>
      'Toca para editar tu nombre y número de teléfono';

  @override
  String get darkModeLabel => 'Modo oscuro';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Direcciones guardadas';

  @override
  String get paymentMethodsLabel => 'Métodos de pago';

  @override
  String get helpCenterLabel => 'Centro de ayuda';

  @override
  String get privacyPolicyLabel => 'Política de privacidad';

  @override
  String get termsConditionsLabel => 'Términos y condiciones';

  @override
  String get signOutLabel => 'Cerrar sesión';

  @override
  String get biometricConfirmReason =>
      'Confirma para habilitar el inicio de sesión biométrico';

  @override
  String get biometricLoginLabel => 'Inicio de sesión biométrico';

  @override
  String get biometricLoginSubtitle =>
      'Requerir Face ID / Touch ID para abrir la aplicación';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — próximamente';
  }

  @override
  String get editProfileTitle => 'Editar perfil';

  @override
  String get profileUpdatedMessage => 'Perfil actualizado';

  @override
  String get saveChangesLabel => 'Guardar cambios';

  @override
  String get rtlNoteMessage =>
      'La dirección del diseño se actualiza al instante. La traducción completa del texto al árabe llegará en una actualización futura.';

  @override
  String get noSavedAddressesTitle => 'Sin direcciones guardadas';

  @override
  String get noSavedAddressesMessage =>
      'Añade una dirección de envío para agilizar tu próximo pago.';

  @override
  String get helpCenterFaqTitle => 'Preguntas frecuentes';

  @override
  String get faqQ1 => '¿Cómo rastreo mi pedido?';

  @override
  String get faqA1 =>
      'Ve a Perfil → Historial de pedidos y toca cualquier pedido para ver su línea de tiempo de estado en vivo.';

  @override
  String get faqQ2 => '¿Qué métodos de pago se aceptan?';

  @override
  String get faqA2 =>
      'Pago contra reembolso, tarjeta de crédito/débito, Apple Pay y Google Pay.';

  @override
  String get faqQ3 => '¿Cómo devuelvo un artículo?';

  @override
  String get faqA3 =>
      'Los artículos son elegibles para devolución dentro de los 30 días posteriores a la entrega. Póngase en contacto con el soporte desde esta pantalla para iniciar una devolución.';

  @override
  String get faqQ4 => '¿Cuánto tarda la entrega?';

  @override
  String get faqA4 =>
      'La mayoría de los pedidos llegan en un plazo de 3 a 5 días hábiles. Verá una fecha de entrega estimada al pagar y en el seguimiento de su pedido.';

  @override
  String get faqQ5 => '¿Cómo aplico un código de cupón?';

  @override
  String get faqA5 =>
      'Ingréselo en la pantalla del Carrito, justo encima del resumen del pedido, luego toque Aplicar.';

  @override
  String get stillNeedHelpTitle => '¿Aún necesitas ayuda?';

  @override
  String get contactSupportLabel => 'Contactar a soporte';

  @override
  String get aboutFeedbackTitle => 'Acerca de y comentarios';

  @override
  String get loadingVersionLabel => 'Cargando versión...';

  @override
  String versionLabel(String version) {
    return 'Versión $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Envíanos tus comentarios';

  @override
  String get feedbackIntroMessage =>
      '¿Encontraste un error o tienes una idea para mejorar NovaCart? Leemos todos los mensajes.';

  @override
  String get feedbackHintText => 'Cuéntanos qué piensas...';

  @override
  String get submitFeedbackLabel => 'Enviar comentarios';

  @override
  String get feedbackThanksMessage => '¡Gracias por tus comentarios!';

  @override
  String get feedbackErrorMessage =>
      'No se pudieron enviar los comentarios. Inténtalo de nuevo.';

  @override
  String get privacySection1Heading => 'Información que recopilamos';

  @override
  String get privacySection1Body =>
      'Recopilamos la información que proporciona directamente (nombre, correo electrónico, teléfono, direcciones de envío) e información generada por el uso de la aplicación (historial de pedidos, lista de deseos, actividad de navegación) para operar NovaCart.';

  @override
  String get privacySection2Heading => 'Cómo usamos su información';

  @override
  String get privacySection2Body =>
      'Su información se utiliza para procesar pedidos, brindar soporte al cliente, personalizar recomendaciones de productos y enviar notificaciones promocionales/de pedidos de las que puede optar por no participar en cualquier momento.';

  @override
  String get privacySection3Heading => 'Seguridad de datos';

  @override
  String get privacySection3Body =>
      'Todos los datos se almacenan utilizando la infraestructura segura de Firebase con reglas de acceso por usuario; ningún otro usuario o solicitud no autenticada puede leer sus pedidos, direcciones o lista de deseos.';

  @override
  String get privacySection4Heading => 'Tus derechos';

  @override
  String get privacySection4Body =>
      'Puede editar o eliminar su información personal, direcciones guardadas y cuenta en cualquier momento desde la sección Perfil.';

  @override
  String get termsSection1Heading => 'Aceptación de términos';

  @override
  String get termsSection1Body =>
      'Al crear una cuenta de NovaCart o realizar un pedido, acepta estos Términos y condiciones.';

  @override
  String get termsSection2Heading => 'Pedidos y pago';

  @override
  String get termsSection2Body =>
      'Todos los pedidos están sujetos a disponibilidad de productos. Los precios se muestran en EGP e incluyen los impuestos aplicables al momento de pagar.';

  @override
  String get termsSection3Heading => 'Envío y devoluciones';

  @override
  String get termsSection3Body =>
      'Los plazos de entrega estimados se muestran al pagar. Los artículos se pueden devolver dentro de los 30 días posteriores a la entrega en su estado original.';

  @override
  String get termsSection4Heading => 'Limitación de responsabilidad';

  @override
  String get termsSection4Body =>
      'NovaCart no es responsable de los daños indirectos o consecuentes que surjan del uso de esta aplicación, en la medida máxima permitida por la ley.';

  @override
  String get unlockNovaCartTitle => 'Desbloquear NovaCart';

  @override
  String get waitingForAuthMessage => 'Esperando autenticación...';

  @override
  String get couldntVerifyMessage => 'No pudimos verificar que eres tú';

  @override
  String get useFaceIdMessage =>
      'Usa Face ID, Touch ID o el PIN de tu dispositivo para continuar.';

  @override
  String get signInWithPasswordInstead =>
      'Iniciar sesión con contraseña en su lugar';

  @override
  String get voiceSearchComingSoon =>
      'La búsqueda por voz llegará en una actualización futura';

  @override
  String get fullNameHint => 'Tu nombre completo';

  @override
  String get compareProductsTitle => 'Comparar productos';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Nada que comparar aún';

  @override
  String get nothingToCompareMessage =>
      'Selecciona 2-3 productos de una categoría para compararlos lado a lado.';

  @override
  String get browseCategoriesLabel => 'Explorar categorías';

  @override
  String get priceLabel => 'Precio';

  @override
  String get ratingLabel => 'Calificación';

  @override
  String get colorsLabel => 'Colores';

  @override
  String get sizesLabel => 'Tamaños';

  @override
  String get supportChatTitle => 'Chat de soporte';

  @override
  String get typeMessageHint => 'Escribe un mensaje...';

  @override
  String get categoryWomensFashion => 'Moda Mujer';

  @override
  String get categoryMensFashion => 'Moda Hombre';

  @override
  String get categorySkincare => 'Cuidado de la piel';

  @override
  String get categoryBeauty => 'Belleza';

  @override
  String get categoryHeadphones => 'Auriculares';

  @override
  String get categoryCameras => 'Cámaras';

  @override
  String get categoryLaptopsElectronics => 'Laptops y Electrónica';

  @override
  String get categoryBabyToys => 'Bebé y Juguetes';
}
