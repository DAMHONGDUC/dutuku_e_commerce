import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key, required this.setting});

  final SettingItemEntity setting;

  @override
  Widget build(BuildContext context) {
    return SdInkWell(
      onTap: () {},
      containerBg: context.colorTheme.cardDefault,
      borderRadius: SdSpacing.s12,
      contentPadding: EdgeInsets.all(SdSpacing.s12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SdIcon(iconData: setting.iconData, color: setting.iconColor),
              SdHorizontalSpacing(),
              Text(
                setting.name,
                style: SdTextStyle.body14().wSemiBold().copyWith(
                  color: setting.nameColor,
                ),
              ),
            ],
          ),
          SdIcon(
            iconData: Ionicons.chevron_forward,
            iconSize: SdSpacing.s20,
            color: context.colorTheme.iconSecondary,
          ),
        ],
      ),
    );
  }
}
