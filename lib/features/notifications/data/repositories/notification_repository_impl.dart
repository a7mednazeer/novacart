import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_datasource.dart';
import '../models/notification_model.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._dataSource);
  final NotificationRemoteDataSource _dataSource;

  @override
  Stream<List<NotificationEntity>> watchNotifications(String uid) {
    return _dataSource.watchNotifications(uid).handleError((_) => <NotificationModel>[]);
  }

  @override
  Future<Either<Failure, void>> markAsRead(String uid, String notificationId) =>
      _guard(() => _dataSource.markAsRead(uid, notificationId));

  @override
  Future<Either<Failure, void>> markAllAsRead(String uid) =>
      _guard(() => _dataSource.markAllAsRead(uid));

  @override
  Future<Either<Failure, void>> deleteNotification(String uid, String notificationId) =>
      _guard(() => _dataSource.deleteNotification(uid, notificationId));

  @override
  Future<Either<Failure, void>> addNotifications(
    String uid,
    List<NotificationEntity> notifications,
  ) {
    return _guard(() => _dataSource.addNotifications(
          uid,
          notifications
              .map((n) => NotificationModel(
                    id: n.id,
                    title: n.title,
                    body: n.body,
                    type: n.type,
                    createdAt: n.createdAt,
                    isRead: n.isRead,
                    orderId: n.orderId,
                  ))
              .toList(),
        ));
  }

  Future<Either<Failure, void>> _guard(Future<void> Function() action) async {
    try {
      await action();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
