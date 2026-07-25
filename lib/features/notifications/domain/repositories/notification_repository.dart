import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/notification_entity.dart';

abstract class NotificationRepository {
  Stream<List<NotificationEntity>> watchNotifications(String uid);

  Future<Either<Failure, void>> markAsRead(String uid, String notificationId);

  Future<Either<Failure, void>> markAllAsRead(String uid);

  Future<Either<Failure, void>> deleteNotification(String uid, String notificationId);

  /// Writes a batch of notification documents — used both by the FCM
  /// foreground-message handler (mirroring a push into the in-app
  /// center) and by the one-time demo seed for first-time users.
  Future<Either<Failure, void>> addNotifications(
    String uid,
    List<NotificationEntity> notifications,
  );
}
