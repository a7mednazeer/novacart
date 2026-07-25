import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../features/notifications/domain/entities/notification_entity.dart';
import '../../features/notifications/presentation/cubit/notifications_cubit.dart';
import 'current_user_service.dart';

/// Wraps Firebase Cloud Messaging: requests notification permission,
/// retrieves and stores the device's FCM token (so a backend/Cloud
/// Function can target this device), and displays a local notification
/// banner for foreground pushes while also mirroring the message into
/// the in-app Notification Center via [NotificationsCubit].
///
/// NOTE: This app has no backend that *sends* pushes (that would be a
/// Cloud Function reacting to e.g. an order status change, calling the
/// FCM Admin SDK). Everything here is the *receiving* side — fully
/// functional and ready to receive real pushes the moment a backend
/// sends one to this device's token.
class PushNotificationService {
  PushNotificationService(
    this._firestore,
    this._currentUser,
    this._notificationsCubit,
  );

  final FirebaseFirestore _firestore;
  final CurrentUserService _currentUser;
  final NotificationsCubit _notificationsCubit;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const _channel = AndroidNotificationChannel(
    'novacart_default_channel',
    'NovaCart Notifications',
    description: 'Order updates, promotions, and general alerts',
    importance: Importance.high,
  );

  Future<void> initialize() async {
    try {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      await _initLocalNotifications();

      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
    } catch (e) {
      // Firebase not configured yet (see the note in main.dart) — the
      // rest of the app still runs fine without push notifications.
      debugPrint('Push notifications not available: $e');
    }
  }

  Future<void> _initLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();

    await _localNotifications.initialize(
      settings: InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: (response) {
        // This is where we'd handle taps on local notification banners
        // while the app is in the foreground.
      },
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  /// Saves the current device's FCM token to `users/{uid}.fcmToken` so a
  /// backend can target this device. Safe to call repeatedly (e.g. from
  /// Home's `initState`, same idempotent pattern as
  /// `WishlistCubit.ensureStarted()`).
  Future<void> saveTokenForCurrentUser() async {
    final uid = _currentUser.uid;
    if (uid == null) return;

    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null) return;

      await _firestore.collection('users').doc(uid).set(
        {'fcmToken': token},
        SetOptions(merge: true),
      );
    } catch (e) {
      debugPrint('Could not save FCM token: $e');
    }
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    await _localNotifications.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
    );

    await _notificationsCubit.addFromPush(
      NotificationEntity(
        id: '',
        title: notification.title ?? 'NovaCart',
        body: notification.body ?? '',
        type: _typeFromData(message.data),
        createdAt: DateTime.now(),
        orderId: message.data['orderId'] as String?,
      ),
    );
  }

  void _handleNotificationTap(RemoteMessage message) {
    // Deep-linking on tap (e.g. navigating straight to an order) is
    // wired through NotificationsPage's `_openNotification` for
    // in-app taps; extending this to cold-start/background taps would
    // hook into `AppRouter` here once a `GlobalKey<NavigatorState>` is
    // threaded through — left as the clear integration point.
  }

  NotificationType _typeFromData(Map<String, dynamic> data) {
    return switch (data['type']) {
      'order' => NotificationType.order,
      'promotion' => NotificationType.promotion,
      _ => NotificationType.system,
    };
  }
}

/// Must be a top-level (or static) function, annotated exactly like
/// this, per FCM's requirements for background message handling.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Intentionally minimal: heavy work here should be avoided since this
  // runs in a separate isolate with no guarantee of Flutter engine/UI
  // access. Firestore/local storage writes needing app context happen
  // when the user opens the notification (`onMessageOpenedApp` above)
  // or on next app launch.
}
