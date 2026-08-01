// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => '계속';

  @override
  String get cancel => '취소';

  @override
  String get retry => '재시도';

  @override
  String get somethingWentWrong => '오류가 발생했습니다';

  @override
  String get skip => '건너뛰기';

  @override
  String get next => '다음';

  @override
  String get splashTagline => '스마트한 쇼핑. 빠른 배송.';

  @override
  String get onboardingGetStarted => '시작하기';

  @override
  String get onboarding1Title => '한 곳에서\n모든 쇼핑을';

  @override
  String get onboarding1Desc => '패션, 테크, 홈 등 수천 개의 엄선된 제품을 하나의 앱에서 만나보세요.';

  @override
  String get onboarding2Title => '빠르고 추적 가능한 배송';

  @override
  String get onboarding2Desc => '결제부터 문 앞까지 실시간 주문 추적과 신뢰할 수 있는 배송 예정일을 확인하세요.';

  @override
  String get onboarding3Title => '안전한 결제';

  @override
  String get onboarding3Desc => '카드, 월렛, 현금 결제 등 원하는 방식으로 안전하게 결제하세요.';

  @override
  String get welcomeBack => '다시 오신 것을 환영합니다';

  @override
  String get signInSubtitle => '쇼핑을 계속하려면 로그인하세요';

  @override
  String get emailLabel => '이메일';

  @override
  String get emailHint => 'example@email.com';

  @override
  String get passwordLabel => '비밀번호';

  @override
  String get passwordHint => '비밀번호를 입력하세요';

  @override
  String get rememberMe => '로그인 유지';

  @override
  String get forgotPassword => '비밀번호 찾기';

  @override
  String get signIn => '로그인';

  @override
  String get orContinueWith => '또는';

  @override
  String get continueWithGoogle => 'Google로 계속';

  @override
  String get noAccount => '계정이 없으신가요? ';

  @override
  String get createAccount => '계정 만들기';

  @override
  String get joinNovaCart => 'NovaCart 가입';

  @override
  String get signUpSubtitle => '더 스마트한 쇼핑을 위해 계정을 만드세요';

  @override
  String get fullNameLabel => '이름';

  @override
  String get confirmPasswordLabel => '비밀번호 확인';

  @override
  String get agreeTerms => '이용약관 및 개인정보 처리방침에 동의합니다';

  @override
  String get resetPasswordTitle => '비밀번호 초기화';

  @override
  String get resetPasswordSubtitle => '이메일을 입력하시면 초기화 링크를 보내드립니다.';

  @override
  String resetLinkSentMessage(String email) {
    return '$email로 초기화 링크를 보냈습니다. 메일의 안내를 따르세요.';
  }

  @override
  String get sendResetLink => '링크 보내기';

  @override
  String get backToSignIn => '로그인으로 돌아가기';

  @override
  String get resendLink => '다시 보내기';

  @override
  String get checkYourEmail => '이메일을 확인하세요';

  @override
  String get navHome => '홈';

  @override
  String get navCategories => '카테고리';

  @override
  String get navWishlist => '찜';

  @override
  String get navProfile => '프로필';

  @override
  String get searchHint => '무엇을 찾으시나요?';

  @override
  String get categoriesTitle => '카테고리';

  @override
  String get flashSaleTitle => '⚡ 타임 세일';

  @override
  String get bestSellersTitle => '🔥 베스트셀러';

  @override
  String get newArrivalsTitle => '✨ 신상품';

  @override
  String get recommendedTitle => '추천 상품';

  @override
  String get recentlyViewedTitle => '최근 본 상품';

  @override
  String get viewAll => '전체보기';

  @override
  String get addToCart => '장바구니 담기';

  @override
  String get outOfStock => '품절';

  @override
  String get cartTitle => '장바구니';

  @override
  String get yourCartIsEmpty => '장바구니가 비어 있습니다';

  @override
  String get addProductsMessage => '장바구니에 제품을 추가해 보세요.';

  @override
  String get startShopping => '쇼핑 시작';

  @override
  String get savedForLaterSection => '나중에 결제';

  @override
  String get moveToCart => '장바구니로 이동';

  @override
  String get saveForLater => '나중에 결제';

  @override
  String get checkout => '결제하기';

  @override
  String get orderSummary => '주문 요약';

  @override
  String get subtotal => '소계';

  @override
  String get discountLabel => '할인';

  @override
  String get shippingLabel => '배송비';

  @override
  String get freeLabel => '무료';

  @override
  String get vatLabel => '부가세 (14%)';

  @override
  String get totalLabel => '총계';

  @override
  String estimatedDeliveryLabel(String date) {
    return '배송 예정: $date';
  }

  @override
  String get enterCouponCode => '쿠폰 코드 입력';

  @override
  String get applyLabel => '적용';

  @override
  String couponApplied(String code) {
    return '$code 적용됨';
  }

  @override
  String get wishlistTitle => '찜';

  @override
  String get wishlistEmptyTitle => '찜한 상품이 없습니다';

  @override
  String get wishlistEmptyMessage => '하트를 눌러 상품을 저장하세요.';

  @override
  String get browseProducts => '상품 보기';

  @override
  String get shopNow => '지금 구매';

  @override
  String browseAllIn(String category) {
    return '$category 전체 상품 보기';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '\"$query\" 검색 결과 $count건';
  }

  @override
  String get noResultsFound => '검색 결과 없음';

  @override
  String get recentSearchesTitle => '최근 검색';

  @override
  String get clearAll => '지우기';

  @override
  String get trendingSearchesTitle => '트렌드';

  @override
  String get filterAndSort => '필터 및 정렬';

  @override
  String filtersCount(int count) {
    return '필터 ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 상품',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => '비어 있음';

  @override
  String get moveItemsBackMessage => '나중에 결제에서 다시 가져오세요.';

  @override
  String savedForLaterCount(int count) {
    return '나중에 결제 ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return '결제 · EGP $amount';
  }

  @override
  String get invalidCouponMessage => '유효하지 않은 코드';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 상품',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => '상품 없음';

  @override
  String get tryAdjustingFiltersMessage => '필터를 조정해 보세요.';

  @override
  String get clearFiltersLabel => '필터 초기화';

  @override
  String get compareProductsTooltip => '비교하기';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" 결과가 없습니다. 다른 검색어를 입력하세요.';
  }

  @override
  String get noProductsMatchFiltersMessage => '일치하는 상품이 없습니다.';

  @override
  String get searchFieldHint => '검색어 입력...';

  @override
  String get resetLabel => '초기화';

  @override
  String get sortByLabel => '정렬';

  @override
  String get priceRangeLabel => '가격 범위';

  @override
  String get minimumRatingLabel => '최소 별점';

  @override
  String get anyLabel => '전체';

  @override
  String get brandLabel => '브랜드';

  @override
  String get applyFiltersLabel => '필터 적용';

  @override
  String get sortRelevance => '관련성';

  @override
  String get sortPriceLowToHigh => '낮은 가격순';

  @override
  String get sortPriceHighToLow => '높은 가격순';

  @override
  String get sortRatingHighToLow => '평점 높은순';

  @override
  String get sortNewest => '최신순';

  @override
  String get productDetailsTitle => '상품 정보';

  @override
  String get descriptionLabel => '상세 설명';

  @override
  String get noDescriptionAvailable => '설명이 없습니다.';

  @override
  String get readMoreLabel => '더 보기';

  @override
  String get showLessLabel => '접기';

  @override
  String get sizeLabel => '사이즈';

  @override
  String get colorLabel => '색상';

  @override
  String get youMightAlsoLike => '추천 상품';

  @override
  String soldCountLabel(int count) {
    return '$count개 판매됨';
  }

  @override
  String sharingProductMessage(String name) {
    return '$name 공유 중...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return '$name $quantity개가 담겼습니다';
  }

  @override
  String get addedToWishlistMessage => '저장됨';

  @override
  String get removedFromWishlistMessage => '삭제됨';

  @override
  String get ratingsAndReviewsTitle => '평가 및 리뷰';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '리뷰 $count개',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    return '전체 $count개 보기';
  }

  @override
  String get estimatedDeliveryTitle => '배송';

  @override
  String arrivesByMessage(String date) {
    return '오늘 주문 시 $date 도착 예정';
  }

  @override
  String get freeReturnsTitle => '무료 반품';

  @override
  String get freeReturnsSubtitle => '30일 이내 무상 반품';

  @override
  String get secureCheckoutTitle => '안전 결제';

  @override
  String get secureCheckoutSubtitle => '보안 결제 시스템';

  @override
  String get specificationsTitle => '상세 사양';

  @override
  String get categoryLabel => '카테고리';

  @override
  String get availableColorsLabel => '색상';

  @override
  String availableColorsValue(int count) {
    return '$count개 옵션';
  }

  @override
  String get availableSizesLabel => '사이즈';

  @override
  String get unitsSoldLabel => '판매량';

  @override
  String unitsSoldValue(int count) {
    return '+$count';
  }

  @override
  String get todayLabel => '오늘';

  @override
  String daysAgoLabel(int count) {
    return '$count일 전';
  }

  @override
  String monthsAgoLabel(int count) {
    return '$count개월 전';
  }

  @override
  String allReviewsTitle(int count) {
    return '전체 리뷰 ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return '담기 · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => '현금 결제';

  @override
  String get paymentCard => '신용/체크카드';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => '수령 시 결제';

  @override
  String get paymentCardSubtitle => '모든 카드 지원';

  @override
  String get paymentApplePaySubtitle => 'Face ID 인증';

  @override
  String get paymentGooglePaySubtitle => 'Google 계정 결제';

  @override
  String get orderStatusProcessing => '준비 중';

  @override
  String get orderStatusShipped => '배송 시작';

  @override
  String get orderStatusOutForDelivery => '배송 중';

  @override
  String get orderStatusDelivered => '배송 완료';

  @override
  String get orderStatusCancelled => '취소됨';

  @override
  String get checkoutTitle => '주문서';

  @override
  String get selectShippingAddress => '배송지 선택';

  @override
  String get addNewAddress => '새 배송지';

  @override
  String get selectPaymentMethod => '결제 수단';

  @override
  String get demoCheckoutDisclaimer => '데모 버전입니다.';

  @override
  String get stepAddressLabel => '주소';

  @override
  String get stepPaymentLabel => '결제';

  @override
  String get stepReviewLabel => '확인';

  @override
  String get changeLabel => '변경';

  @override
  String get shippingToLabel => '배송지';

  @override
  String get backLabel => '뒤로';

  @override
  String placeOrderWithTotal(String amount) {
    return '주문하기 · EGP $amount';
  }

  @override
  String get defaultLabel => '기본';

  @override
  String get phoneNumberLabel => '전화번호';

  @override
  String get addressHintLabel => '상세 주소를 입력하세요';

  @override
  String get cityLabel => '도시';

  @override
  String get saveAddressLabel => '저장';

  @override
  String get orderPlacedTitle => '주문 완료!';

  @override
  String orderConfirmedMessage(String orderId) {
    return '주문번호 #$orderId번 완료.';
  }

  @override
  String get itemsLabel => '상품';

  @override
  String get totalPaidLabel => '결제 금액';

  @override
  String get continueShoppingLabel => '계속 쇼핑';

  @override
  String get viewOrderLabel => '주문 보기';

  @override
  String get orderTrackingTitle => '배송 추적';

  @override
  String get orderHistoryTitle => '주문 내역';

  @override
  String get orderNotFoundTitle => '조회 실패';

  @override
  String get orderNotFoundMessage => '주문이 없습니다.';

  @override
  String get backToOrdersLabel => '목록으로';

  @override
  String get noOrdersYetTitle => '주문 없음';

  @override
  String get noOrdersYetMessage => '주문 내역이 없습니다.';

  @override
  String itemsWithCountLabel(int count) {
    return '상품 ($count개)';
  }

  @override
  String qtyLabel(int count) {
    return '수량 $count';
  }

  @override
  String get shippingAddressTitle => '배송지 정보';

  @override
  String get paymentMethodTitle => '결제 정보';

  @override
  String get orderCancelledMessage => '취소된 주문입니다.';

  @override
  String orderNumberLabel(String id) {
    return '주문번호 #$id';
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
  String get stageProcessingTitle => '준비 중';

  @override
  String get stageProcessingSubtitle => '접수 완료';

  @override
  String get stageShippedSubtitle => '상품 발송';

  @override
  String get stageOutForDeliverySubtitle => '도착 예정';

  @override
  String get stageDeliveredSubtitle => '도착 완료!';

  @override
  String get notificationsTitle => '알림';

  @override
  String get markAllReadLabel => '모두 읽음';

  @override
  String get noNotificationsYetTitle => '알림 없음';

  @override
  String get noNotificationsYetMessage => '새 소식이 없습니다.';

  @override
  String minutesAgoShort(int count) {
    return '$count분 전';
  }

  @override
  String hoursAgoShort(int count) {
    return '$count시간 전';
  }

  @override
  String daysAgoShort(int count) {
    return '$count일 전';
  }

  @override
  String get profileTitle => '프로필';

  @override
  String get yourNovaCartAccount => '나의 계정';

  @override
  String get tapToEditProfileMessage => '정보 수정하기';

  @override
  String get darkModeLabel => '다크 모드';

  @override
  String get languageLabel => '언어';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => '배송지 관리';

  @override
  String get paymentMethodsLabel => '결제 수단';

  @override
  String get helpCenterLabel => '고객센터';

  @override
  String get privacyPolicyLabel => '개인정보';

  @override
  String get termsConditionsLabel => '이용약관';

  @override
  String get signOutLabel => '로그아웃';

  @override
  String get biometricConfirmReason => '인증을 확인하세요';

  @override
  String get biometricLoginLabel => '생체 인증';

  @override
  String get biometricLoginSubtitle => '보안 인증 로그인';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — 준비 중';
  }

  @override
  String get editProfileTitle => '프로필 수정';

  @override
  String get profileUpdatedMessage => '수정 완료';

  @override
  String get saveChangesLabel => '저장하기';

  @override
  String get rtlNoteMessage => '설정이 적용되었습니다.';

  @override
  String get noSavedAddressesTitle => '배송지 없음';

  @override
  String get noSavedAddressesMessage => '주소를 추가해 보세요.';

  @override
  String get helpCenterFaqTitle => '자주 묻는 질문';

  @override
  String get faqQ1 => '배송 추적은 어디서 하나요?';

  @override
  String get faqA1 => '프로필 → 주문 내역에서 확인 가능합니다.';

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
  String get stillNeedHelpTitle => '도움이 필요하신가요?';

  @override
  String get contactSupportLabel => '문의하기';

  @override
  String get aboutFeedbackTitle => '정보';

  @override
  String get loadingVersionLabel => '조회 중...';

  @override
  String versionLabel(String version) {
    return '버전 $version';
  }

  @override
  String get sendUsFeedbackTitle => '의견 보내기';

  @override
  String get feedbackIntroMessage => '의견을 들려주세요.';

  @override
  String get feedbackHintText => '내용을 입력하세요...';

  @override
  String get submitFeedbackLabel => '보내기';

  @override
  String get feedbackThanksMessage => '감사합니다!';

  @override
  String get feedbackErrorMessage => '전송 실패.';

  @override
  String get privacySection1Heading => '데이터';

  @override
  String get privacySection1Body => '정보를 보호합니다.';

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
  String get termsSection1Heading => '약관';

  @override
  String get termsSection1Body => '서비스 이용을 위해...';

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
  String get unlockNovaCartTitle => '잠금 해제';

  @override
  String get waitingForAuthMessage => '인증 중...';

  @override
  String get couldntVerifyMessage => '인증 실패';

  @override
  String get useFaceIdMessage => '생체 인증을 사용하세요.';

  @override
  String get signInWithPasswordInstead => '비밀번호 로그인';

  @override
  String get voiceSearchComingSoon => '준비 중';

  @override
  String get fullNameHint => '이름 성';

  @override
  String get compareProductsTitle => '상품 비교';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => '비교함 비었음';

  @override
  String get nothingToCompareMessage => '2-3개를 선택하세요.';

  @override
  String get browseCategoriesLabel => '카테고리';

  @override
  String get priceLabel => '가격';

  @override
  String get ratingLabel => '평점';

  @override
  String get colorsLabel => '색상';

  @override
  String get sizesLabel => '사이즈';

  @override
  String get supportChatTitle => '채팅';

  @override
  String get typeMessageHint => '메시지...';

  @override
  String get categoryWomensFashion => '여성';

  @override
  String get categoryMensFashion => '남성';

  @override
  String get categorySkincare => '스킨케어';

  @override
  String get categoryBeauty => '뷰티';

  @override
  String get categoryHeadphones => '오디오';

  @override
  String get categoryCameras => '카메라';

  @override
  String get categoryLaptopsElectronics => '테크';

  @override
  String get categoryBabyToys => '유아';
}
