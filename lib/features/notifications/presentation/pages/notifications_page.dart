import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../domain/entities/notification_entity.dart';
import '../cubit/notifications_cubit.dart';
import '../widgets/notification_tile.dart';
import '../../../../generated/l10n/app_localizations.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    sl<NotificationsCubit>().ensureStarted();
  }

  void _openNotification(BuildContext context, NotificationEntity notification) {
    sl<NotificationsCubit>().markAsRead(notification.id);
    if (notification.type == NotificationType.order && notification.orderId != null) {
      context.push(AppRoutes.orderTrackingPath(notification.orderId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsTitle),
        actions: [
          BlocBuilder<NotificationsCubit, NotificationsState>(
            bloc: sl<NotificationsCubit>(),
            builder: (context, state) {
              if (state.unreadCount == 0) return const SizedBox.shrink();
              return TextButton(
                onPressed: () => sl<NotificationsCubit>().markAllAsRead(),
                child: Text(l10n.markAllReadLabel),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        bloc: sl<NotificationsCubit>(),
        builder: (context, state) {
          if (state.isLoading) {
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: List.generate(
                4,
                (_) => const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.sm),
                  child: ShimmerBox(height: 78),
                ),
              ),
            );
          }

          if (state.notifications.isEmpty) {
            return EmptyStateView(
              icon: Icons.notifications_none_rounded,
              title: l10n.noNotificationsYetTitle,
              message: l10n.noNotificationsYetMessage,
            );
          }

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: state.notifications
                .map((n) => NotificationTile(
                      notification: n,
                      onTap: () => _openNotification(context, n),
                      onDismiss: () => sl<NotificationsCubit>().deleteNotification(n.id),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
