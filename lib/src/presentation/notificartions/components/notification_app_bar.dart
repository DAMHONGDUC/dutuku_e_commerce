import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

final _kIconPadding = SdSpacing.s6;
final _kTitleSpacing = SdSpacing.s12;

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SdAppBar(
      titleText: 'Notifications',
      showBackButton: false,
      titleSpacing: _kTitleSpacing,
      actionPadding: EdgeInsets.only(right: _kTitleSpacing - _kIconPadding),
      actions: [
        SdIconButton(
          padding: EdgeInsets.all(_kIconPadding),
          onPressed: () {},
          icon: SdIcon(
            iconData: Ionicons.cart,
            color: context.colorTheme.primary,
          ),
        ),
        SdHorizontalSpacing(xRatio: 0.5),
        SdIconButton(
          padding: EdgeInsets.all(_kIconPadding),
          onPressed: () {},
          icon: SdIcon(
            iconData: Ionicons.chatbubble_ellipses_outline,
            color: context.colorTheme.primary,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
