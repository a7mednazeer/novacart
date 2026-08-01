import '../../../../generated/l10n/app_localizations.dart';
import '../../domain/entities/order_entity.dart';

/// Same pattern as `payment_method_display.dart` — [OrderStatus]'s
/// domain-layer `.label` extension has no `BuildContext`.
String orderStatusLabel(AppLocalizations l10n, OrderStatus status) {
  return switch (status) {
    OrderStatus.processing => l10n.orderStatusProcessing,
    OrderStatus.shipped => l10n.orderStatusShipped,
    OrderStatus.outForDelivery => l10n.orderStatusOutForDelivery,
    OrderStatus.delivered => l10n.orderStatusDelivered,
    OrderStatus.cancelled => l10n.orderStatusCancelled,
  };
}
