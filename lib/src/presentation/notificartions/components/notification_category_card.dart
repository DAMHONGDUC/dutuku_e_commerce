import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

class NotificationCategoryCard extends StatelessWidget {
  final NotificationCategory category;
  final VoidCallback onTap;

  const NotificationCategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SdInkWell(
      onTap: onTap,
      borderRadius: 0,
      containerBg: context.colorTheme.cardDefault,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(SdSpacing.s8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: context.colorTheme.borderDefault,
                    ),
                    borderRadius: BorderRadius.circular(SdSpacing.s100),
                  ),
                  child: SdIcon(
                    iconData: category.icon,
                    color: category.type.iconColor,
                    iconSize: SdSpacing.s28,
                  ),
                ),
                SdHorizontalSpacing(),
                Row(
                  children: [
                    _InfoSectio(
                      name: category.name,
                      description: category.description,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              SdBadge(count: category.numOfNotifications, size: SdSpacing.s20),
              SdHorizontalSpacing(),
              SdIcon(
                iconData: Ionicons.chevron_forward,
                iconSize: SdSpacing.s20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoSectio extends StatelessWidget {
  const _InfoSectio({required this.name, required this.description});
  final String name;
  final String description;

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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
