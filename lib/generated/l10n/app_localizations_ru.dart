// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Продолжить';

  @override
  String get cancel => 'Отмена';

  @override
  String get retry => 'Повторить';

  @override
  String get somethingWentWrong => 'Что-то пошло не так';

  @override
  String get skip => 'Пропустить';

  @override
  String get next => 'Далее';

  @override
  String get splashTagline => 'Покупайте с умом. Получайте быстрее.';

  @override
  String get onboardingGetStarted => 'Начать';

  @override
  String get onboarding1Title => 'Все покупки\nв одном месте';

  @override
  String get onboarding1Desc =>
      'Тысячи товаров в категориях мода, техника, дом и других в одном приложении.';

  @override
  String get onboarding2Title => 'Быстрая\nдоставка';

  @override
  String get onboarding2Desc =>
      'Отслеживайте заказы в реальном времени и получайте надежные прогнозы доставки.';

  @override
  String get onboarding3Title => 'Безопасная оплата';

  @override
  String get onboarding3Desc =>
      'Платите удобно: карты, кошельки или оплата при получении.';

  @override
  String get welcomeBack => 'С возвращением';

  @override
  String get signInSubtitle => 'Войдите для продолжения покупок в NovaCart';

  @override
  String get emailLabel => 'Электронная почта';

  @override
  String get emailHint => 'you@example.com';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get passwordHint => 'Введите ваш пароль';

  @override
  String get rememberMe => 'Запомнить меня';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get signIn => 'Войти';

  @override
  String get orContinueWith => 'или через';

  @override
  String get continueWithGoogle => 'Продолжить через Google';

  @override
  String get noAccount => 'Нет аккаунта? ';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get joinNovaCart => 'Присоединиться к NovaCart';

  @override
  String get signUpSubtitle => 'Создайте аккаунт для умных покупок';

  @override
  String get fullNameLabel => 'Полное имя';

  @override
  String get confirmPasswordLabel => 'Подтвердите пароль';

  @override
  String get agreeTerms =>
      'Я согласен с Условиями и Политикой конфиденциальности';

  @override
  String get resetPasswordTitle => 'Сброс пароля';

  @override
  String get resetPasswordSubtitle =>
      'Введите вашу почту, и мы пришлем ссылку для сброса.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Ссылка отправлена на $email. Следуйте инструкциям в письме.';
  }

  @override
  String get sendResetLink => 'Отправить ссылку';

  @override
  String get backToSignIn => 'Вернуться к входу';

  @override
  String get resendLink => 'Отправить еще раз';

  @override
  String get checkYourEmail => 'Проверьте почту';

  @override
  String get navHome => 'Главная';

  @override
  String get navCategories => 'Категории';

  @override
  String get navWishlist => 'Избранное';

  @override
  String get navProfile => 'Профиль';

  @override
  String get searchHint => 'Что вы ищете?';

  @override
  String get categoriesTitle => 'Категории';

  @override
  String get flashSaleTitle => '⚡ Молния';

  @override
  String get bestSellersTitle => '🔥 Хиты продаж';

  @override
  String get newArrivalsTitle => '✨ Новинки';

  @override
  String get recommendedTitle => 'Рекомендуем вам';

  @override
  String get recentlyViewedTitle => 'Вы смотрели';

  @override
  String get viewAll => 'Все';

  @override
  String get addToCart => 'В корзину';

  @override
  String get outOfStock => 'Нет в наличии';

  @override
  String get cartTitle => 'Корзина';

  @override
  String get yourCartIsEmpty => 'Ваша корзина пуста';

  @override
  String get addProductsMessage => 'Добавьте товары в корзину.';

  @override
  String get startShopping => 'К покупкам';

  @override
  String get savedForLaterSection => 'Отложено';

  @override
  String get moveToCart => 'В корзину';

  @override
  String get saveForLater => 'Отложить';

  @override
  String get checkout => 'Оформление';

  @override
  String get orderSummary => 'Итого';

  @override
  String get subtotal => 'Сумма';

  @override
  String get discountLabel => 'Скидка';

  @override
  String get shippingLabel => 'Доставка';

  @override
  String get freeLabel => 'Бесплатно';

  @override
  String get vatLabel => 'НДС (14%)';

  @override
  String get totalLabel => 'Всего';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Доставка: $date';
  }

  @override
  String get enterCouponCode => 'Промокод';

  @override
  String get applyLabel => 'Применить';

  @override
  String couponApplied(String code) {
    return 'Код $code применен';
  }

  @override
  String get wishlistTitle => 'Избранное';

  @override
  String get wishlistEmptyTitle => 'Список пуст';

  @override
  String get wishlistEmptyMessage =>
      'Нажмите на сердце, чтобы сохранить товар.';

  @override
  String get browseProducts => 'Смотреть товары';

  @override
  String get shopNow => 'Купить сейчас';

  @override
  String browseAllIn(String category) {
    return 'Все в $category';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '$count результатов по \"$query\"';
  }

  @override
  String get noResultsFound => 'Ничего не найдено';

  @override
  String get recentSearchesTitle => 'Вы искали';

  @override
  String get clearAll => 'Очистить';

  @override
  String get trendingSearchesTitle => 'Тренды';

  @override
  String get filterAndSort => 'Фильтры';

  @override
  String filtersCount(int count) {
    return 'Фильтры ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count товаров',
      one: '$count товар',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Пусто';

  @override
  String get moveItemsBackMessage =>
      'Верните из отложенных или продолжайте покупки.';

  @override
  String savedForLaterCount(int count) {
    return 'Отложено ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Оплатить · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Неверный код';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count товаров',
      one: '$count товар',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'Товары не найдены';

  @override
  String get tryAdjustingFiltersMessage => 'Измените фильтры.';

  @override
  String get clearFiltersLabel => 'Сбросить';

  @override
  String get compareProductsTooltip => 'Сравнить';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return 'Ничего не найдено по \"$query\".';
  }

  @override
  String get noProductsMatchFiltersMessage => 'Нет совпадений.';

  @override
  String get searchFieldHint => 'Поиск...';

  @override
  String get resetLabel => 'Сброс';

  @override
  String get sortByLabel => 'Сортировка';

  @override
  String get priceRangeLabel => 'Цена';

  @override
  String get minimumRatingLabel => 'Рейтинг';

  @override
  String get anyLabel => 'Любой';

  @override
  String get brandLabel => 'Бренд';

  @override
  String get applyFiltersLabel => 'Применить';

  @override
  String get sortRelevance => 'По релевантности';

  @override
  String get sortPriceLowToHigh => 'Сначала дешевле';

  @override
  String get sortPriceHighToLow => 'Сначала дороже';

  @override
  String get sortRatingHighToLow => 'По рейтингу';

  @override
  String get sortNewest => 'Новинки';

  @override
  String get productDetailsTitle => 'О товаре';

  @override
  String get descriptionLabel => 'Описание';

  @override
  String get noDescriptionAvailable => 'Нет описания для этого товара.';

  @override
  String get readMoreLabel => 'Читать далее';

  @override
  String get showLessLabel => 'Скрыть';

  @override
  String get sizeLabel => 'Размер';

  @override
  String get colorLabel => 'Цвет';

  @override
  String get youMightAlsoLike => 'Похожие товары';

  @override
  String soldCountLabel(int count) {
    return 'Продано: $count';
  }

  @override
  String sharingProductMessage(String name) {
    return 'Делюсь $name...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return 'Добавлено $quantity× $name';
  }

  @override
  String get addedToWishlistMessage => 'В избранном';

  @override
  String get removedFromWishlistMessage => 'Удалено';

  @override
  String get ratingsAndReviewsTitle => 'Отзывы';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count отзывов',
      one: '$count отзыв',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    return 'Все $count отзывов';
  }

  @override
  String get estimatedDeliveryTitle => 'Доставка';

  @override
  String arrivesByMessage(String date) {
    return 'Прибудет до $date';
  }

  @override
  String get freeReturnsTitle => 'Бесплатный возврат';

  @override
  String get freeReturnsSubtitle => 'В течение 30 дней';

  @override
  String get secureCheckoutTitle => 'Безопасная оплата';

  @override
  String get secureCheckoutSubtitle => 'Защита данных и транзакций';

  @override
  String get specificationsTitle => 'Характеристики';

  @override
  String get categoryLabel => 'Категория';

  @override
  String get availableColorsLabel => 'Цвета';

  @override
  String availableColorsValue(int count) {
    return '$count вариантов';
  }

  @override
  String get availableSizesLabel => 'Размеры';

  @override
  String get unitsSoldLabel => 'Продано';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => 'Сегодня';

  @override
  String daysAgoLabel(int count) {
    return '$count дн. назад';
  }

  @override
  String monthsAgoLabel(int count) {
    return '$count мес. назад';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Все отзывы ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Добавить · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Наличными';

  @override
  String get paymentCard => 'Карта';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'При получении';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard и др.';

  @override
  String get paymentApplePaySubtitle => 'Через Face ID';

  @override
  String get paymentGooglePaySubtitle => 'Через Google';

  @override
  String get orderStatusProcessing => 'Обработка';

  @override
  String get orderStatusShipped => 'Отправлен';

  @override
  String get orderStatusOutForDelivery => 'У курьера';

  @override
  String get orderStatusDelivered => 'Доставлен';

  @override
  String get orderStatusCancelled => 'Отменен';

  @override
  String get checkoutTitle => 'Оплата';

  @override
  String get selectShippingAddress => 'Адрес доставки';

  @override
  String get addNewAddress => 'Новый адрес';

  @override
  String get selectPaymentMethod => 'Способ оплаты';

  @override
  String get demoCheckoutDisclaimer => 'Демо-версия.';

  @override
  String get stepAddressLabel => 'Адрес';

  @override
  String get stepPaymentLabel => 'Оплата';

  @override
  String get stepReviewLabel => 'Заказ';

  @override
  String get changeLabel => 'Изм.';

  @override
  String get shippingToLabel => 'Кому';

  @override
  String get backLabel => 'Назад';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Заказать · EGP $amount';
  }

  @override
  String get defaultLabel => 'ОСНОВНОЙ';

  @override
  String get phoneNumberLabel => 'Телефон';

  @override
  String get addressHintLabel => 'Улица, дом, кв.';

  @override
  String get cityLabel => 'Город';

  @override
  String get saveAddressLabel => 'Сохранить';

  @override
  String get orderPlacedTitle => 'Заказ оформлен!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Заказ #$orderId подтвержден.';
  }

  @override
  String get itemsLabel => 'Товары';

  @override
  String get totalPaidLabel => 'Оплачено';

  @override
  String get continueShoppingLabel => 'Продолжить';

  @override
  String get viewOrderLabel => 'Смотреть заказ';

  @override
  String get orderTrackingTitle => 'Трекинг';

  @override
  String get orderHistoryTitle => 'История';

  @override
  String get orderNotFoundTitle => 'Не найден';

  @override
  String get orderNotFoundMessage => 'Заказ не найден.';

  @override
  String get backToOrdersLabel => 'К заказам';

  @override
  String get noOrdersYetTitle => 'Нет заказов';

  @override
  String get noOrdersYetMessage => 'Здесь будет история заказов.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Товаров ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Кол-во: $count';
  }

  @override
  String get shippingAddressTitle => 'Адрес';

  @override
  String get paymentMethodTitle => 'Оплата';

  @override
  String get orderCancelledMessage => 'Отменен.';

  @override
  String orderNumberLabel(String id) {
    return 'Заказ #$id';
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
  String get stageProcessingTitle => 'Обработка';

  @override
  String get stageProcessingSubtitle => 'Принят';

  @override
  String get stageShippedSubtitle => 'Отправлен';

  @override
  String get stageOutForDeliverySubtitle => 'В пути';

  @override
  String get stageDeliveredSubtitle => 'Доставлен!';

  @override
  String get notificationsTitle => 'Уведомления';

  @override
  String get markAllReadLabel => 'Прочитать все';

  @override
  String get noNotificationsYetTitle => 'Нет новых';

  @override
  String get noNotificationsYetMessage => 'Здесь будут новости.';

  @override
  String minutesAgoShort(int count) {
    return '$countм';
  }

  @override
  String hoursAgoShort(int count) {
    return '$countч';
  }

  @override
  String daysAgoShort(int count) {
    return '$countд';
  }

  @override
  String get profileTitle => 'Профиль';

  @override
  String get yourNovaCartAccount => 'Ваш аккаунт';

  @override
  String get tapToEditProfileMessage => 'Изменить данные';

  @override
  String get darkModeLabel => 'Темная тема';

  @override
  String get languageLabel => 'Язык';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Адреса';

  @override
  String get paymentMethodsLabel => 'Оплата';

  @override
  String get helpCenterLabel => 'Помощь';

  @override
  String get privacyPolicyLabel => 'Приватность';

  @override
  String get termsConditionsLabel => 'Условия';

  @override
  String get signOutLabel => 'Выйти';

  @override
  String get biometricConfirmReason => 'Включить биометрию';

  @override
  String get biometricLoginLabel => 'Вход по биометрии';

  @override
  String get biometricLoginSubtitle => 'Face ID / Touch ID';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — скоро';
  }

  @override
  String get editProfileTitle => 'Профиль';

  @override
  String get profileUpdatedMessage => 'Обновлено';

  @override
  String get saveChangesLabel => 'Сохранить';

  @override
  String get rtlNoteMessage => 'Интерфейс обновлен.';

  @override
  String get noSavedAddressesTitle => 'Нет адресов';

  @override
  String get noSavedAddressesMessage => 'Добавьте адрес.';

  @override
  String get helpCenterFaqTitle => 'FAQ';

  @override
  String get faqQ1 => 'Трекинг?';

  @override
  String get faqA1 => 'Профиль → История.';

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
  String get stillNeedHelpTitle => 'Нужна помощь?';

  @override
  String get contactSupportLabel => 'Чат';

  @override
  String get aboutFeedbackTitle => 'О нас';

  @override
  String get loadingVersionLabel => 'Загрузка...';

  @override
  String versionLabel(String version) {
    return 'Версия $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Ваш отзыв';

  @override
  String get feedbackIntroMessage => 'Нашли баг?';

  @override
  String get feedbackHintText => 'Напишите нам...';

  @override
  String get submitFeedbackLabel => 'Отправить';

  @override
  String get feedbackThanksMessage => 'Спасибо!';

  @override
  String get feedbackErrorMessage => 'Ошибка отправки.';

  @override
  String get privacySection1Heading => 'Данные';

  @override
  String get privacySection1Body => 'Мы защищаем данные.';

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
  String get termsSection1Heading => 'Правила';

  @override
  String get termsSection1Body => 'Используя NovaCart...';

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
  String get unlockNovaCartTitle => 'Разблокировать';

  @override
  String get waitingForAuthMessage => 'Проверка...';

  @override
  String get couldntVerifyMessage => 'Ошибка';

  @override
  String get useFaceIdMessage => 'Используйте Face ID.';

  @override
  String get signInWithPasswordInstead => 'Вход по паролю';

  @override
  String get voiceSearchComingSoon => 'Скоро';

  @override
  String get fullNameHint => 'Имя Фамилия';

  @override
  String get compareProductsTitle => 'Сравнение';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Пусто';

  @override
  String get nothingToCompareMessage => 'Выберите 2-3 товара.';

  @override
  String get browseCategoriesLabel => 'Категории';

  @override
  String get priceLabel => 'Цена';

  @override
  String get ratingLabel => 'Рейтинг';

  @override
  String get colorsLabel => 'Цвета';

  @override
  String get sizesLabel => 'Размеры';

  @override
  String get supportChatTitle => 'Поддержка';

  @override
  String get typeMessageHint => 'Сообщение...';

  @override
  String get categoryWomensFashion => 'Женское';

  @override
  String get categoryMensFashion => 'Мужское';

  @override
  String get categorySkincare => 'Уход';

  @override
  String get categoryBeauty => 'Красота';

  @override
  String get categoryHeadphones => 'Наушники';

  @override
  String get categoryCameras => 'Камеры';

  @override
  String get categoryLaptopsElectronics => 'Техника';

  @override
  String get categoryBabyToys => 'Игрушки';
}
