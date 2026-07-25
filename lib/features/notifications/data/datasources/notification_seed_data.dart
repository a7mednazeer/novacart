import '../../domain/entities/notification_entity.dart';

/// ============================================================================
/// DEMO SEED — ONE-TIME ONLY
/// ============================================================================
/// Written once per user (guarded by `LocalStorageService.hasSeededNotifications`
/// in `NotificationsCubit.ensureStarted()`) purely so the Notification
/// Center has believable content on a fresh account instead of an empty
/// list. Real notifications after this point come from actual app
/// events (order placed, FCM push received) — this file is never
/// referenced again after the first seed.
/// ============================================================================
List<NotificationEntity> buildWelcomeNotifications() {
  final now = DateTime.now();
  return [
    NotificationEntity(
      id: '',
      title: 'Welcome to NovaCart! 🎉',
      body: 'Discover thousands of products with fast, trackable delivery.',
      type: NotificationType.system,
      createdAt: now,
    ),
    NotificationEntity(
      id: '',
      title: 'Flash Sale is live ⚡',
      body: 'Up to 25% off headphones and skincare — today only.',
      type: NotificationType.promotion,
      createdAt: now.subtract(const Duration(hours: 3)),
    ),
  ];
}
