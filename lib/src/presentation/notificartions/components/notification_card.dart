import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isUnread = !notification.isRead;

    return SdInkWell(
      onTap: onTap,
      borderRadius: 0,
      containerBg: isUnread
          ? Colors.red.withValues(alpha: 0.03)
          : context.colorTheme.cardDefault,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SdIcon(
                  iconData: notification.type.iconData,
                  iconSize: SdSpacing.s28,
                ),
                SdHorizontalSpacing(),
                Expanded(
                  child: _InfoSectio(
                    name: notification.title,
                    description: notification.body,
                    createdAt: notification.timestamp,
                  ),
                ),
              ],
            ),
          ),
          SdIcon(iconData: Ionicons.chevron_forward, iconSize: SdSpacing.s20),
        ],
      ),
    );
  }
}

class _InfoSectio extends StatelessWidget {
  const _InfoSectio({
    required this.name,
    required this.description,
    required this.createdAt,
  });
  final String name;
  final String description;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: SdTextStyle.heading14(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SdVerticalSpacing(xRatio: 0.25),
        Text(
          description,
          style: SdTextStyle.body12().wColor(context.colorTheme.textSubTitle),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SdVerticalSpacing(xRatio: 0.25),
        Text(
          SdDateTimeHelper.dateTimeToHHMMDDMMYY(createdAt),
          style: SdTextStyle.body12().copyWith(
            color: context.colorTheme.textSubTitle,
          ),
        ),
      ],
    );
  }
}
