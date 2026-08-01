import '../../../../generated/l10n/app_localizations.dart';
import '../../domain/entities/payment_method.dart';

/// [PaymentMethodType]'s domain-layer extension (`.label`/`.subtitle`)
/// has no `BuildContext` to localize with — same situation as
/// `ProductSortOptionLabel` in the shared filter sheet. These two
/// functions are the presentation-layer localized equivalent; the
/// domain extension stays as a context-free fallback (e.g. for
/// logging/debug output).
String paymentMethodLabel(AppLocalizations l10n, PaymentMethodType type) {
  return switch (type) {
    PaymentMethodType.cashOnDelivery => l10n.paymentCashOnDelivery,
    PaymentMethodType.card => l10n.paymentCard,
    PaymentMethodType.applePay => l10n.paymentApplePay,
    PaymentMethodType.googlePay => l10n.paymentGooglePay,
  };
}

String paymentMethodSubtitle(AppLocalizations l10n, PaymentMethodType type) {
  return switch (type) {
    PaymentMethodType.cashOnDelivery => l10n.paymentCodSubtitle,
    PaymentMethodType.card => l10n.paymentCardSubtitle,
    PaymentMethodType.applePay => l10n.paymentApplePaySubtitle,
    PaymentMethodType.googlePay => l10n.paymentGooglePaySubtitle,
  };
}
