import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

final _kIconPadding = SdSpacing.s6;
final _kTitleSpacing = SdSpacing.s12;

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SdAppBar(
      titleText: 'Settings',
      showBackButton: false,
      titleSpacing: _kTitleSpacing,
      actionPadding: EdgeInsets.only(right: _kTitleSpacing - _kIconPadding),
      actions: [
        SdIconButton(
          padding: EdgeInsets.all(_kIconPadding),
          onPressed: () {},
          icon: SdIcon(
            iconData: Icons.more_vert,
            color: context.colorTheme.primary,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
