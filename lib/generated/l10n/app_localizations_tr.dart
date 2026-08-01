// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => 'Devam Et';

  @override
  String get cancel => 'İptal';

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get somethingWentWrong => 'Bir şeyler yanlış gitti';

  @override
  String get skip => 'Atla';

  @override
  String get next => 'İleri';

  @override
  String get splashTagline => 'Akıllıca Alışveriş Yap. Daha Hızlı Ulaş.';

  @override
  String get onboardingGetStarted => 'Başla';

  @override
  String get onboarding1Title => 'Her Şeyi Tek\nBir Yerden Alın';

  @override
  String get onboarding1Desc =>
      'Moda, teknoloji, ev ve daha fazlasında binlerce seçilmiş ürünü tek bir uygulamada keşfedin.';

  @override
  String get onboarding2Title => 'Hızlı ve Takip Edilebilir\nTeslimat';

  @override
  String get onboarding2Desc =>
      'Ödemeden kapınıza kadar gerçek zamanlı sipariş takibi ve güvenilir teslimat tahminleri alın.';

  @override
  String get onboarding3Title => 'Güvenli ve Güvenilir\nÖdeme';

  @override
  String get onboarding3Desc =>
      'Banka düzeyinde güvenlikle dilediğiniz gibi ödeyin: Kartlar, cüzdanlar veya kapıda ödeme seçeneğiyle.';

  @override
  String get welcomeBack => 'Tekrar Hoş Geldiniz';

  @override
  String get signInSubtitle =>
      'NovaCart ile alışverişe devam etmek için giriş yapın';

  @override
  String get emailLabel => 'E-posta';

  @override
  String get emailHint => 'sen@ornek.com';

  @override
  String get passwordLabel => 'Şifre';

  @override
  String get passwordHint => 'Şifrenizi girin';

  @override
  String get rememberMe => 'Beni Hatırla';

  @override
  String get forgotPassword => 'Şifremi Unuttum?';

  @override
  String get signIn => 'Giriş Yap';

  @override
  String get orContinueWith => 'veya şununla devam et';

  @override
  String get continueWithGoogle => 'Google ile Devam Et';

  @override
  String get noAccount => 'Hesabınız yok mu? ';

  @override
  String get createAccount => 'Hesap Oluştur';

  @override
  String get joinNovaCart => 'NovaCart\'a Katıl';

  @override
  String get signUpSubtitle =>
      'Daha akıllıca alışverişe başlamak için hesap oluşturun';

  @override
  String get fullNameLabel => 'Ad Soyad';

  @override
  String get confirmPasswordLabel => 'Şifreyi Onayla';

  @override
  String get agreeTerms =>
      'Şartlar ve Koşulları ve Gizlilik Politikasını kabul ediyorum';

  @override
  String get resetPasswordTitle => 'Şifrenizi sıfırlayın';

  @override
  String get resetPasswordSubtitle =>
      'Hesabınızla ilişkili e-posta adresini girin, size şifre sıfırlama bağlantısı gönderelim.';

  @override
  String resetLinkSentMessage(String email) {
    return 'Şifre sıfırlama bağlantısını $email adresine gönderdik. Yeni şifre belirlemek için e-postadaki talimatları izleyin.';
  }

  @override
  String get sendResetLink => 'Sıfırlama Bağlantısı Gönder';

  @override
  String get backToSignIn => 'Girişe Dön';

  @override
  String get resendLink => 'Yeniden Gönder';

  @override
  String get checkYourEmail => 'E-postanızı kontrol edin';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navCategories => 'Kategoriler';

  @override
  String get navWishlist => 'Favoriler';

  @override
  String get navProfile => 'Profil';

  @override
  String get searchHint => 'Ne arıyorsunuz?';

  @override
  String get categoriesTitle => 'Kategoriler';

  @override
  String get flashSaleTitle => '⚡ Flaş İndirim';

  @override
  String get bestSellersTitle => '🔥 En Çok Satanlar';

  @override
  String get newArrivalsTitle => '✨ Yeni Gelenler';

  @override
  String get recommendedTitle => 'Sizin İçin Önerilenler';

  @override
  String get recentlyViewedTitle => 'Son Görüntülenenler';

  @override
  String get viewAll => 'Tümünü gör';

  @override
  String get addToCart => 'Sepete Ekle';

  @override
  String get outOfStock => 'Stokta Yok';

  @override
  String get cartTitle => 'Sepet';

  @override
  String get yourCartIsEmpty => 'Sepetiniz boş';

  @override
  String get addProductsMessage => 'Görmek için sepetinize ürün ekleyin.';

  @override
  String get startShopping => 'Alışverişe Başla';

  @override
  String get savedForLaterSection => 'Daha Sonra Al';

  @override
  String get moveToCart => 'Sepete Al';

  @override
  String get saveForLater => 'Daha Sonra Al';

  @override
  String get checkout => 'Ödeme';

  @override
  String get orderSummary => 'Sipariş Özeti';

  @override
  String get subtotal => 'Ara Toplam';

  @override
  String get discountLabel => 'İndirim';

  @override
  String get shippingLabel => 'Kargo';

  @override
  String get freeLabel => 'Ücretsiz';

  @override
  String get vatLabel => 'KDV (14%)';

  @override
  String get totalLabel => 'Toplam';

  @override
  String estimatedDeliveryLabel(String date) {
    return 'Tahmini Teslimat: $date';
  }

  @override
  String get enterCouponCode => 'Kupon kodu girin';

  @override
  String get applyLabel => 'Uygula';

  @override
  String couponApplied(String code) {
    return '$code uygulandı';
  }

  @override
  String get wishlistTitle => 'Favoriler';

  @override
  String get wishlistEmptyTitle => 'İstek listeniz boş';

  @override
  String get wishlistEmptyMessage =>
      'Kaydetmek için herhangi bir üründeki kalbe dokunun.';

  @override
  String get browseProducts => 'Ürünlere Göz At';

  @override
  String get shopNow => 'Şimdi Al';

  @override
  String browseAllIn(String category) {
    return '$category kategorisindeki tüm ürünleri gör';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '\"$query\" için $count sonuç';
  }

  @override
  String get noResultsFound => 'Sonuç bulunamadı';

  @override
  String get recentSearchesTitle => 'Son Aramalar';

  @override
  String get clearAll => 'Tümünü Temizle';

  @override
  String get trendingSearchesTitle => 'Trendler';

  @override
  String get filterAndSort => 'Filtrele ve Sırala';

  @override
  String filtersCount(int count) {
    return 'Filtre ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ürün',
      one: '$count ürün',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => 'Sepet boş';

  @override
  String get moveItemsBackMessage =>
      'Ürünleri sepetinize geri taşıyın veya alışverişe devam edin.';

  @override
  String savedForLaterCount(int count) {
    return 'Daha Sonra Al ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return 'Öde · EGP $amount';
  }

  @override
  String get invalidCouponMessage => 'Geçersiz veya süresi dolmuş kupon kodu';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ürün',
      one: '$count ürün',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => 'Ürün bulunamadı';

  @override
  String get tryAdjustingFiltersMessage =>
      'Daha fazla sonuç görmek için filtreleri ayarlamayı deneyin.';

  @override
  String get clearFiltersLabel => 'Filtreleri Temizle';

  @override
  String get compareProductsTooltip => 'Ürünleri karşılaştır';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" için bir şey bulamadık. Farklı bir anahtar kelime deneyin.';
  }

  @override
  String get noProductsMatchFiltersMessage =>
      'Filtrelerinizle eşleşen ürün yok. Filtreleri ayarlamayı deneyin.';

  @override
  String get searchFieldHint => 'Ürün, marka ara...';

  @override
  String get resetLabel => 'Sıfırla';

  @override
  String get sortByLabel => 'Sıralama';

  @override
  String get priceRangeLabel => 'Fiyat Aralığı';

  @override
  String get minimumRatingLabel => 'Minimum Puan';

  @override
  String get anyLabel => 'Hepsi';

  @override
  String get brandLabel => 'Marka';

  @override
  String get applyFiltersLabel => 'Filtreleri Uygula';

  @override
  String get sortRelevance => 'İlgi';

  @override
  String get sortPriceLowToHigh => 'Fiyat: Düşükten Yükseğe';

  @override
  String get sortPriceHighToLow => 'Fiyat: Yüksekten Düşüğe';

  @override
  String get sortRatingHighToLow => 'En Yüksek Puan';

  @override
  String get sortNewest => 'En Yeni';

  @override
  String get productDetailsTitle => 'Ürün Detayları';

  @override
  String get descriptionLabel => 'Açıklama';

  @override
  String get noDescriptionAvailable => 'Bu ürün için henüz bir açıklama yok.';

  @override
  String get readMoreLabel => 'Devamını Oku';

  @override
  String get showLessLabel => 'Daha Az';

  @override
  String get sizeLabel => 'Beden';

  @override
  String get colorLabel => 'Renk';

  @override
  String get youMightAlsoLike => 'Bunları da Sevebilirsiniz';

  @override
  String soldCountLabel(int count) {
    return '$count satıldı';
  }

  @override
  String sharingProductMessage(String name) {
    return '$name paylaşılıyor...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return '$quantity× $name sepete eklendi';
  }

  @override
  String get addedToWishlistMessage => 'Favorilere eklendi';

  @override
  String get removedFromWishlistMessage => 'Favorilerden çıkarıldı';

  @override
  String get ratingsAndReviewsTitle => 'Değerlendirme ve Yorumlar';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yorum',
      one: '$count yorum',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    return '$count yorumun tümünü gör';
  }

  @override
  String get estimatedDeliveryTitle => 'Tahmini teslimat';

  @override
  String arrivesByMessage(String date) {
    return 'Bugün sipariş verilirse $date tarihine kadar ulaşır';
  }

  @override
  String get freeReturnsTitle => 'Ücretsiz iade';

  @override
  String get freeReturnsSubtitle => '30 günlük iade süresi';

  @override
  String get secureCheckoutTitle => 'Güvenli ödeme';

  @override
  String get secureCheckoutSubtitle =>
      'Kapıda ödeme, kartlar ve dijital cüzdanlar kabul edilir';

  @override
  String get specificationsTitle => 'Özellikler';

  @override
  String get categoryLabel => 'Kategori';

  @override
  String get availableColorsLabel => 'Renk Seçenekleri';

  @override
  String availableColorsValue(int count) {
    return '$count seçenek';
  }

  @override
  String get availableSizesLabel => 'Beden Seçenekleri';

  @override
  String get unitsSoldLabel => 'Satılan Birim';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => 'Bugün';

  @override
  String daysAgoLabel(int count) {
    return '$count gün önce';
  }

  @override
  String monthsAgoLabel(int count) {
    return '$count ay önce';
  }

  @override
  String allReviewsTitle(int count) {
    return 'Tüm Yorumlar ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return 'Sepete Ekle · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => 'Kapıda Ödeme';

  @override
  String get paymentCard => 'Kredi / Banka Kartı';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => 'Siparişiniz ulaştığında ödeyin';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard ve dahası';

  @override
  String get paymentApplePaySubtitle => 'Face ID / Touch ID ile anında ödeyin';

  @override
  String get paymentGooglePaySubtitle => 'Google hesabınızla anında ödeyin';

  @override
  String get orderStatusProcessing => 'Hazırlanıyor';

  @override
  String get orderStatusShipped => 'Kargoya Verildi';

  @override
  String get orderStatusOutForDelivery => 'Dağıtımda';

  @override
  String get orderStatusDelivered => 'Teslim Edildi';

  @override
  String get orderStatusCancelled => 'İptal Edildi';

  @override
  String get checkoutTitle => 'Ödeme';

  @override
  String get selectShippingAddress => 'Bir teslimat adresi seçin';

  @override
  String get addNewAddress => 'Yeni Adres Ekle';

  @override
  String get selectPaymentMethod => 'Bir ödeme yöntemi seçin';

  @override
  String get demoCheckoutDisclaimer =>
      'Bu bir demo ödemedir — gerçek bir ücret alınmaz.';

  @override
  String get stepAddressLabel => 'Adres';

  @override
  String get stepPaymentLabel => 'Ödeme';

  @override
  String get stepReviewLabel => 'Özet';

  @override
  String get changeLabel => 'Değiştir';

  @override
  String get shippingToLabel => 'Gönderilen Adres';

  @override
  String get backLabel => 'Geri';

  @override
  String placeOrderWithTotal(String amount) {
    return 'Siparişi Onayla · EGP $amount';
  }

  @override
  String get defaultLabel => 'VARSAYILAN';

  @override
  String get phoneNumberLabel => 'Telefon Numarası';

  @override
  String get addressHintLabel => 'Sokak, bina, daire numarası';

  @override
  String get cityLabel => 'Şehir';

  @override
  String get saveAddressLabel => 'Adresi Kaydet';

  @override
  String get orderPlacedTitle => 'Sipariş Verildi!';

  @override
  String orderConfirmedMessage(String orderId) {
    return 'Siparişiniz #$orderId onaylandı.';
  }

  @override
  String get itemsLabel => 'Ürünler';

  @override
  String get totalPaidLabel => 'Toplam Ödenen';

  @override
  String get continueShoppingLabel => 'Alışverişe Devam Et';

  @override
  String get viewOrderLabel => 'Siparişi Gör';

  @override
  String get orderTrackingTitle => 'Sipariş Takibi';

  @override
  String get orderHistoryTitle => 'Sipariş Geçmişi';

  @override
  String get orderNotFoundTitle => 'Sipariş bulunamadı';

  @override
  String get orderNotFoundMessage => 'Bu siparişi bulamadık.';

  @override
  String get backToOrdersLabel => 'Siparişlere Dön';

  @override
  String get noOrdersYetTitle => 'Henüz sipariş yok';

  @override
  String get noOrdersYetMessage => 'Sipariş verdiğinizde burada görünecektir.';

  @override
  String itemsWithCountLabel(int count) {
    return 'Ürün ($count)';
  }

  @override
  String qtyLabel(int count) {
    return 'Adet $count';
  }

  @override
  String get shippingAddressTitle => 'Teslimat Adresi';

  @override
  String get paymentMethodTitle => 'Ödeme Yöntemi';

  @override
  String get orderCancelledMessage => 'Bu sipariş iptal edildi.';

  @override
  String orderNumberLabel(String id) {
    return 'Sipariş #$id';
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
  String get stageProcessingTitle => 'Sipariş Hazırlanıyor';

  @override
  String get stageProcessingSubtitle => 'Siparişinizi aldık';

  @override
  String get stageShippedSubtitle => 'Siparişiniz depomuzdan ayrıldı';

  @override
  String get stageOutForDeliverySubtitle => 'Siparişiniz yolda';

  @override
  String get stageDeliveredSubtitle => 'Siparişinizin tadını çıkarın!';

  @override
  String get notificationsTitle => 'Bildirimler';

  @override
  String get markAllReadLabel => 'Tümünü okundu işaretle';

  @override
  String get noNotificationsYetTitle => 'Henüz bildirim yok';

  @override
  String get noNotificationsYetMessage =>
      'Sipariş güncellemeleri ve promosyonlar burada görünecek.';

  @override
  String minutesAgoShort(int count) {
    return '${count}dk önce';
  }

  @override
  String hoursAgoShort(int count) {
    return '${count}sa önce';
  }

  @override
  String daysAgoShort(int count) {
    return '${count}g önce';
  }

  @override
  String get profileTitle => 'Profil';

  @override
  String get yourNovaCartAccount => 'NovaCart Hesabınız';

  @override
  String get tapToEditProfileMessage =>
      'Adınızı ve telefonunuzu düzenlemek için dokunun';

  @override
  String get darkModeLabel => 'Karanlık Mod';

  @override
  String get languageLabel => 'Dil';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => 'Kayıtlı Adresler';

  @override
  String get paymentMethodsLabel => 'Ödeme Yöntemleri';

  @override
  String get helpCenterLabel => 'Yardım Merkezi';

  @override
  String get privacyPolicyLabel => 'Gizlilik Politikası';

  @override
  String get termsConditionsLabel => 'Şartlar ve Koşullar';

  @override
  String get signOutLabel => 'Çıkış Yap';

  @override
  String get biometricConfirmReason =>
      'Biyometrik girişi etkinleştirmek için onayla';

  @override
  String get biometricLoginLabel => 'Biyometrik Giriş';

  @override
  String get biometricLoginSubtitle =>
      'Uygulamayı açmak için Face ID / Touch ID iste';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — yakında';
  }

  @override
  String get editProfileTitle => 'Profili Düzenle';

  @override
  String get profileUpdatedMessage => 'Profil güncellendi';

  @override
  String get saveChangesLabel => 'Değişiklikleri Kaydet';

  @override
  String get rtlNoteMessage => 'Düzen yönü anında güncellenir.';

  @override
  String get noSavedAddressesTitle => 'Kayıtlı adres yok';

  @override
  String get noSavedAddressesMessage =>
      'Ödemeyi hızlandırmak için bir adres ekleyin.';

  @override
  String get helpCenterFaqTitle => 'Sıkça Sorulan Sorular';

  @override
  String get faqQ1 => 'Siparişimi nasıl takip ederim?';

  @override
  String get faqA1 => 'Profil → Sipariş Geçmişi\'ne gidin ve siparişe dokunun.';

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
  String get stillNeedHelpTitle => 'Hala yardıma mı ihtiyacınız var?';

  @override
  String get contactSupportLabel => 'Destekle İletişime Geç';

  @override
  String get aboutFeedbackTitle => 'Hakkında ve Geri Bildirim';

  @override
  String get loadingVersionLabel => 'Sürüm yükleniyor...';

  @override
  String versionLabel(String version) {
    return 'Sürüm $version';
  }

  @override
  String get sendUsFeedbackTitle => 'Geri bildirim gönderin';

  @override
  String get feedbackIntroMessage => 'Bir hata mı buldunuz?';

  @override
  String get feedbackHintText => 'Ne düşündüğünüzü bize söyleyin...';

  @override
  String get submitFeedbackLabel => 'Gönder';

  @override
  String get feedbackThanksMessage => 'Geri bildiriminiz için teşekkürler!';

  @override
  String get feedbackErrorMessage => 'Gönderilemedi. Lütfen tekrar deneyin.';

  @override
  String get privacySection1Heading => 'Topladığımız Bilgiler';

  @override
  String get privacySection1Body =>
      'Doğrudan sağladığınız bilgileri topluyoruz.';

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
  String get termsSection1Heading => 'Şartların Kabulü';

  @override
  String get termsSection1Body =>
      'NovaCart hesabını kullanarak şartları kabul etmiş olursunuz.';

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
  String get unlockNovaCartTitle => 'NovaCart Kilidini Aç';

  @override
  String get waitingForAuthMessage => 'Kimlik doğrulanıyor...';

  @override
  String get couldntVerifyMessage => 'Siz olduğunuz doğrulanamadı';

  @override
  String get useFaceIdMessage =>
      'Devam etmek için Face ID, Touch ID veya PIN kullanın.';

  @override
  String get signInWithPasswordInstead => 'Şifre ile giriş yap';

  @override
  String get voiceSearchComingSoon => 'Sesli arama yakında gelecek';

  @override
  String get fullNameHint => 'Adınız Soyadınız';

  @override
  String get compareProductsTitle => 'Ürünleri Karşılaştır';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => 'Henüz karşılaştırılacak bir şey yok';

  @override
  String get nothingToCompareMessage =>
      'Yan yana karşılaştırmak için 2-3 ürün seçin.';

  @override
  String get browseCategoriesLabel => 'Kategorilere Göz At';

  @override
  String get priceLabel => 'Fiyat';

  @override
  String get ratingLabel => 'Puan';

  @override
  String get colorsLabel => 'Renkler';

  @override
  String get sizesLabel => 'Bedenler';

  @override
  String get supportChatTitle => 'Destek Sohbeti';

  @override
  String get typeMessageHint => 'Bir mesaj yazın...';

  @override
  String get categoryWomensFashion => 'Kadın Moda';

  @override
  String get categoryMensFashion => 'Erkek Moda';

  @override
  String get categorySkincare => 'Cilt Bakımı';

  @override
  String get categoryBeauty => 'Güzellik';

  @override
  String get categoryHeadphones => 'Kulaklık';

  @override
  String get categoryCameras => 'Kamera';

  @override
  String get categoryLaptopsElectronics => 'Elektronik';

  @override
  String get categoryBabyToys => 'Bebek & Oyuncak';
}
