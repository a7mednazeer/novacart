import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../data/datasources/notification_seed_data.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';

part 'notifications_state.dart';

/// Registered as an app-wide singleton — same pattern as
/// `WishlistCubit`/`CartCubit` — so the notification bell's unread
/// badge stays in sync no matter which screen is showing it.
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._repository, this._currentUser, this._localStorage)
      : super(const NotificationsState());

  final NotificationRepository _repository;
  final CurrentUserService _currentUser;
  final LocalStorageService _localStorage;

  StreamSubscription<List<NotificationEntity>>? _subscription;
  String? _activeUid;

  void ensureStarted() {
    final uid = _currentUser.uid;
    if (uid == null || uid == _activeUid) return;

    _activeUid = uid;
    _subscription?.cancel();
    _subscription = _repository.watchNotifications(uid).listen((notifications) async {
      if (notifications.isEmpty && !_localStorage.hasSeededNotifications) {
        await _localStorage.setHasSeededNotifications(true);
        await _repository.addNotifications(uid, buildWelcomeNotifications());
        return; // The write triggers a fresh snapshot with the seed data.
      }
      emit(state.copyWith(notifications: notifications, isLoading: false));
    });
  }

  Future<void> markAsRead(String notificationId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _repository.markAsRead(uid, notificationId);
  }

  Future<void> markAllAsRead() async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _repository.markAllAsRead(uid);
  }

  Future<void> deleteNotification(String notificationId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _repository.deleteNotification(uid, notificationId);
  }

  /// Called by the FCM foreground-message handler to mirror a received
  /// push into the in-app center.
  Future<void> addFromPush(NotificationEntity notification) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _repository.addNotifications(uid, [notification]);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
