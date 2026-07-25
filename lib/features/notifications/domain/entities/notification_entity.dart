import 'package:equatable/equatable.dart';

enum NotificationType { order, promotion, system }

extension NotificationTypeDisplay on NotificationType {
  String get label => switch (this) {
        NotificationType.order => 'Order Update',
        NotificationType.promotion => 'Promotion',
        NotificationType.system => 'NovaCart',
      };
}

class NotificationEntity extends Equatable {
  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.createdAt,
    this.isRead = false,
    this.orderId,
  });

  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final DateTime createdAt;
  final bool isRead;

  /// Present only for [NotificationType.order] notifications — lets a
  /// tap deep-link straight to that order's tracking screen.
  final String? orderId;

  @override
  List<Object?> get props => [id, title, body, type, isRead];
}
