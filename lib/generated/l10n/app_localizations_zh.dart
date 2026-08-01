// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'NovaCart';

  @override
  String get continueLabel => '继续';

  @override
  String get cancel => '取消';

  @override
  String get retry => '重试';

  @override
  String get somethingWentWrong => '出错了';

  @override
  String get skip => '跳过';

  @override
  String get next => '下一步';

  @override
  String get splashTagline => '智选好物，快递送达。';

  @override
  String get onboardingGetStarted => '立即开始';

  @override
  String get onboarding1Title => '一站式购齐';

  @override
  String get onboarding1Desc => '探索时尚、科技、家居等数千种精选产品，尽在一个应用。';

  @override
  String get onboarding2Title => '快速配送';

  @override
  String get onboarding2Desc => '获取实时订单追踪和可靠的送达估算。';

  @override
  String get onboarding3Title => '安全结账';

  @override
  String get onboarding3Desc => '通过银行级安全保障选择您的支付方式：卡支付、钱包或货到付款。';

  @override
  String get welcomeBack => '欢迎回来';

  @override
  String get signInSubtitle => '登录以继续在 NovaCart 购物';

  @override
  String get emailLabel => '电子邮件';

  @override
  String get emailHint => 'you@example.com';

  @override
  String get passwordLabel => '密码';

  @override
  String get passwordHint => '请输入密码';

  @override
  String get rememberMe => '记住我';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get signIn => '登录';

  @override
  String get orContinueWith => '或通过';

  @override
  String get continueWithGoogle => '使用 Google 继续';

  @override
  String get noAccount => '没有账号？ ';

  @override
  String get createAccount => '创建账号';

  @override
  String get joinNovaCart => '加入 NovaCart';

  @override
  String get signUpSubtitle => '创建账号，开启智能购物';

  @override
  String get fullNameLabel => '全名';

  @override
  String get confirmPasswordLabel => '确认密码';

  @override
  String get agreeTerms => '我同意条款与隐私政策';

  @override
  String get resetPasswordTitle => '重置密码';

  @override
  String get resetPasswordSubtitle => '输入您的电子邮件，我们将发送重置链接。';

  @override
  String resetLinkSentMessage(String email) {
    return '重置链接已发送至 $email。请按照邮件提示设置新密码。';
  }

  @override
  String get sendResetLink => '发送链接';

  @override
  String get backToSignIn => '返回登录';

  @override
  String get resendLink => '重新发送';

  @override
  String get checkYourEmail => '查收邮件';

  @override
  String get navHome => '首页';

  @override
  String get navCategories => '分类';

  @override
  String get navWishlist => '收藏';

  @override
  String get navProfile => '我的';

  @override
  String get searchHint => '搜索商品';

  @override
  String get categoriesTitle => '分类';

  @override
  String get flashSaleTitle => '⚡ 闪购';

  @override
  String get bestSellersTitle => '🔥 热销';

  @override
  String get newArrivalsTitle => '✨ 新品';

  @override
  String get recommendedTitle => '为您推荐';

  @override
  String get recentlyViewedTitle => '最近浏览';

  @override
  String get viewAll => '查看全部';

  @override
  String get addToCart => '加入购物车';

  @override
  String get outOfStock => '缺货';

  @override
  String get cartTitle => '购物车';

  @override
  String get yourCartIsEmpty => '购物车是空的';

  @override
  String get addProductsMessage => '添加商品到这里。';

  @override
  String get startShopping => '开始购物';

  @override
  String get savedForLaterSection => '移后再买';

  @override
  String get moveToCart => '移入购物车';

  @override
  String get saveForLater => '稍后再买';

  @override
  String get checkout => '结算';

  @override
  String get orderSummary => '订单摘要';

  @override
  String get subtotal => '小计';

  @override
  String get discountLabel => '折扣';

  @override
  String get shippingLabel => '运费';

  @override
  String get freeLabel => '免费';

  @override
  String get vatLabel => '增值税 (14%)';

  @override
  String get totalLabel => '总计';

  @override
  String estimatedDeliveryLabel(String date) {
    return '预计送达：$date';
  }

  @override
  String get enterCouponCode => '优惠券代码';

  @override
  String get applyLabel => '应用';

  @override
  String couponApplied(String code) {
    return '代码 $code 已应用';
  }

  @override
  String get wishlistTitle => '收藏夹';

  @override
  String get wishlistEmptyTitle => '收藏夹是空的';

  @override
  String get wishlistEmptyMessage => '点击心形收藏商品。';

  @override
  String get browseProducts => '浏览商品';

  @override
  String get shopNow => '立即购买';

  @override
  String browseAllIn(String category) {
    return '查看 $category 全部商品';
  }

  @override
  String searchResultsFor(int count, String query) {
    return '\"$query\" 的 $count 个结果';
  }

  @override
  String get noResultsFound => '未找到结果';

  @override
  String get recentSearchesTitle => '最近搜索';

  @override
  String get clearAll => '清除';

  @override
  String get trendingSearchesTitle => '热门搜索';

  @override
  String get filterAndSort => '筛选与排序';

  @override
  String filtersCount(int count) {
    return '筛选 ($count)';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件商品',
    );
    return '$_temp0';
  }

  @override
  String get cartIsEmptyShort => '空';

  @override
  String get moveItemsBackMessage => '从移后再买中找回。';

  @override
  String savedForLaterCount(int count) {
    return '移后再买 ($count)';
  }

  @override
  String checkoutWithTotal(String amount) {
    return '结算 · EGP $amount';
  }

  @override
  String get invalidCouponMessage => '无效代码';

  @override
  String productsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 款商品',
    );
    return '$_temp0';
  }

  @override
  String get noProductsFoundTitle => '未找到商品';

  @override
  String get tryAdjustingFiltersMessage => '尝试调整筛选条件。';

  @override
  String get clearFiltersLabel => '清除筛选';

  @override
  String get compareProductsTooltip => '比较';

  @override
  String compareProductsWithCount(int count) {
    return 'Compare ($count)';
  }

  @override
  String get selectAtLeastTwoToCompare => 'Select at least 2 to compare';

  @override
  String noResultsForQuery(String query) {
    return '未找到关于 \"$query\" 的结果。';
  }

  @override
  String get noProductsMatchFiltersMessage => '没有匹配商品。';

  @override
  String get searchFieldHint => '搜索...';

  @override
  String get resetLabel => '重置';

  @override
  String get sortByLabel => '排序';

  @override
  String get priceRangeLabel => '价格';

  @override
  String get minimumRatingLabel => '最低评分';

  @override
  String get anyLabel => '不限';

  @override
  String get brandLabel => '品牌';

  @override
  String get applyFiltersLabel => '应用筛选';

  @override
  String get sortRelevance => '相关度';

  @override
  String get sortPriceLowToHigh => '价格：从低到高';

  @override
  String get sortPriceHighToLow => '价格：从高到低';

  @override
  String get sortRatingHighToLow => '评分最高';

  @override
  String get sortNewest => '最新上架';

  @override
  String get productDetailsTitle => '商品详情';

  @override
  String get descriptionLabel => '描述';

  @override
  String get noDescriptionAvailable => '暂无描述。';

  @override
  String get readMoreLabel => '阅读更多';

  @override
  String get showLessLabel => '收起';

  @override
  String get sizeLabel => '尺寸';

  @override
  String get colorLabel => '颜色';

  @override
  String get youMightAlsoLike => '猜你喜欢';

  @override
  String soldCountLabel(int count) {
    return '已售 $count';
  }

  @override
  String sharingProductMessage(String name) {
    return '正在分享 $name...';
  }

  @override
  String addedToCartMessage(int quantity, String name) {
    return '已将 $quantity 件 $name 加入购物车';
  }

  @override
  String get addedToWishlistMessage => '已收藏';

  @override
  String get removedFromWishlistMessage => '已取消收藏';

  @override
  String get ratingsAndReviewsTitle => '评价与评论';

  @override
  String reviewsCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条评价',
    );
    return '$_temp0';
  }

  @override
  String viewAllReviewsLabel(int count) {
    return '查看全部 $count 条评价';
  }

  @override
  String get estimatedDeliveryTitle => '配送信息';

  @override
  String arrivesByMessage(String date) {
    return '预计 $date 送达';
  }

  @override
  String get freeReturnsTitle => '免费退货';

  @override
  String get freeReturnsSubtitle => '30天无忧退换';

  @override
  String get secureCheckoutTitle => '安全支付';

  @override
  String get secureCheckoutSubtitle => '加密保护';

  @override
  String get specificationsTitle => '规格参数';

  @override
  String get categoryLabel => '分类';

  @override
  String get availableColorsLabel => '可选颜色';

  @override
  String availableColorsValue(int count) {
    return '$count 种选择';
  }

  @override
  String get availableSizesLabel => '可选尺寸';

  @override
  String get unitsSoldLabel => '销量';

  @override
  String unitsSoldValue(int count) {
    return '$count+';
  }

  @override
  String get todayLabel => '今天';

  @override
  String daysAgoLabel(int count) {
    return '$count 天前';
  }

  @override
  String monthsAgoLabel(int count) {
    return '$count 个月前';
  }

  @override
  String allReviewsTitle(int count) {
    return '全部评价 ($count)';
  }

  @override
  String addToCartWithTotal(String amount) {
    return '加入购物车 · EGP $amount';
  }

  @override
  String get paymentCashOnDelivery => '货到付款';

  @override
  String get paymentCard => '信用卡/储蓄卡';

  @override
  String get paymentApplePay => 'Apple Pay';

  @override
  String get paymentGooglePay => 'Google Pay';

  @override
  String get paymentCodSubtitle => '货到后支付';

  @override
  String get paymentCardSubtitle => 'Visa, Mastercard 等';

  @override
  String get paymentApplePaySubtitle => 'Face ID 快速支付';

  @override
  String get paymentGooglePaySubtitle => 'Google 快速支付';

  @override
  String get orderStatusProcessing => '处理中';

  @override
  String get orderStatusShipped => '已发货';

  @override
  String get orderStatusOutForDelivery => '派送中';

  @override
  String get orderStatusDelivered => '已送达';

  @override
  String get orderStatusCancelled => '已取消';

  @override
  String get checkoutTitle => '结算';

  @override
  String get selectShippingAddress => '选择收货地址';

  @override
  String get addNewAddress => '添加新地址';

  @override
  String get selectPaymentMethod => '选择支付方式';

  @override
  String get demoCheckoutDisclaimer => '这只是一个演示版，不会产生实际费用。';

  @override
  String get stepAddressLabel => '地址';

  @override
  String get stepPaymentLabel => '支付';

  @override
  String get stepReviewLabel => '确认';

  @override
  String get changeLabel => '修改';

  @override
  String get shippingToLabel => '收货人';

  @override
  String get backLabel => '返回';

  @override
  String placeOrderWithTotal(String amount) {
    return '立即下单 · EGP $amount';
  }

  @override
  String get defaultLabel => '默认';

  @override
  String get phoneNumberLabel => '电话号码';

  @override
  String get addressHintLabel => '街道、门牌号等';

  @override
  String get cityLabel => '城市';

  @override
  String get saveAddressLabel => '保存地址';

  @override
  String get orderPlacedTitle => '下单成功！';

  @override
  String orderConfirmedMessage(String orderId) {
    return '您的订单 #$orderId 已确认。';
  }

  @override
  String get itemsLabel => '商品';

  @override
  String get totalPaidLabel => '实付金额';

  @override
  String get continueShoppingLabel => '继续购物';

  @override
  String get viewOrderLabel => '查看订单';

  @override
  String get orderTrackingTitle => '订单追踪';

  @override
  String get orderHistoryTitle => '订单历史';

  @override
  String get orderNotFoundTitle => '订单未找到';

  @override
  String get orderNotFoundMessage => '找不到该订单。';

  @override
  String get backToOrdersLabel => '返回列表';

  @override
  String get noOrdersYetTitle => '暂无订单';

  @override
  String get noOrdersYetMessage => '您的订单历史将显示在这里。';

  @override
  String itemsWithCountLabel(int count) {
    return '商品 ($count)';
  }

  @override
  String qtyLabel(int count) {
    return '数量 $count';
  }

  @override
  String get shippingAddressTitle => '收货地址';

  @override
  String get paymentMethodTitle => '支付方式';

  @override
  String get orderCancelledMessage => '此订单已取消。';

  @override
  String orderNumberLabel(String id) {
    return '订单号 #$id';
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
  String get stageProcessingTitle => '正在处理';

  @override
  String get stageProcessingSubtitle => '我们已收到您的订单';

  @override
  String get stageShippedSubtitle => '订单已出库';

  @override
  String get stageOutForDeliverySubtitle => '正在派送';

  @override
  String get stageDeliveredSubtitle => '收货愉快！';

  @override
  String get notificationsTitle => '通知';

  @override
  String get markAllReadLabel => '全部已读';

  @override
  String get noNotificationsYetTitle => '暂无通知';

  @override
  String get noNotificationsYetMessage => '订单动态将显示在这里。';

  @override
  String minutesAgoShort(int count) {
    return '$count 分钟前';
  }

  @override
  String hoursAgoShort(int count) {
    return '$count 小时前';
  }

  @override
  String daysAgoShort(int count) {
    return '$count 天前';
  }

  @override
  String get profileTitle => '个人中心';

  @override
  String get yourNovaCartAccount => '您的账户';

  @override
  String get tapToEditProfileMessage => '点击修改名称与电话';

  @override
  String get darkModeLabel => '深色模式';

  @override
  String get languageLabel => '语言';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get savedAddressesLabel => '收货地址';

  @override
  String get paymentMethodsLabel => '支付方式';

  @override
  String get helpCenterLabel => '帮助中心';

  @override
  String get privacyPolicyLabel => '隐私政策';

  @override
  String get termsConditionsLabel => '服务条款';

  @override
  String get signOutLabel => '退出登录';

  @override
  String get biometricConfirmReason => '确认开启生物识别';

  @override
  String get biometricLoginLabel => '生物识别登录';

  @override
  String get biometricLoginSubtitle => '启动应用时需要 Face ID';

  @override
  String comingSoonSuffix(String feature) {
    return '$feature — 即将推出';
  }

  @override
  String get editProfileTitle => '编辑个人资料';

  @override
  String get profileUpdatedMessage => '已更新';

  @override
  String get saveChangesLabel => '保存修改';

  @override
  String get rtlNoteMessage => '界面方向会立即更新。';

  @override
  String get noSavedAddressesTitle => '暂无地址';

  @override
  String get noSavedAddressesMessage => '添加地址以便快速下单。';

  @override
  String get helpCenterFaqTitle => '常见问题';

  @override
  String get faqQ1 => '如何追踪订单？';

  @override
  String get faqA1 => '前往 我的 → 订单历史。';

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
  String get stillNeedHelpTitle => '还需要帮助吗？';

  @override
  String get contactSupportLabel => '联系客服';

  @override
  String get aboutFeedbackTitle => '关于与反馈';

  @override
  String get loadingVersionLabel => '加载中...';

  @override
  String versionLabel(String version) {
    return '版本 $version';
  }

  @override
  String get sendUsFeedbackTitle => '发送反馈';

  @override
  String get feedbackIntroMessage => '发现 Bug 或有好主意？';

  @override
  String get feedbackHintText => '请告诉我们您的想法...';

  @override
  String get submitFeedbackLabel => '提交反馈';

  @override
  String get feedbackThanksMessage => '感谢反馈！';

  @override
  String get feedbackErrorMessage => '提交失败。';

  @override
  String get privacySection1Heading => '数据收集';

  @override
  String get privacySection1Body => '我们收集您的基本资料。';

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
  String get termsSection1Heading => '接受条款';

  @override
  String get termsSection1Body => '使用 NovaCart 即表示...';

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
  String get unlockNovaCartTitle => '解锁';

  @override
  String get waitingForAuthMessage => '身份验证中...';

  @override
  String get couldntVerifyMessage => '验证失败';

  @override
  String get useFaceIdMessage => '请使用生物识别。';

  @override
  String get signInWithPasswordInstead => '使用密码登录';

  @override
  String get voiceSearchComingSoon => '语音搜索即将推出';

  @override
  String get fullNameHint => '您的姓名';

  @override
  String get compareProductsTitle => '商品对比';

  @override
  String selectToCompare(int max) {
    return 'Select 2-$max products to compare';
  }

  @override
  String get nothingToCompareTitle => '暂无对比';

  @override
  String get nothingToCompareMessage => '选择 2-3 件商品进行对比。';

  @override
  String get browseCategoriesLabel => '浏览分类';

  @override
  String get priceLabel => '价格';

  @override
  String get ratingLabel => '评分';

  @override
  String get colorsLabel => '颜色';

  @override
  String get sizesLabel => '尺寸';

  @override
  String get supportChatTitle => '在线支持';

  @override
  String get typeMessageHint => '输入消息...';

  @override
  String get categoryWomensFashion => '女装';

  @override
  String get categoryMensFashion => '男装';

  @override
  String get categorySkincare => '护肤';

  @override
  String get categoryBeauty => '美妆';

  @override
  String get categoryHeadphones => '耳机';

  @override
  String get categoryCameras => '相机';

  @override
  String get categoryLaptopsElectronics => '数码';

  @override
  String get categoryBabyToys => '母婴';
}
