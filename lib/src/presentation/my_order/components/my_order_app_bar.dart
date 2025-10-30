import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

final _kIconPadding = SdSpacing.s6;
final _kTitleSpacing = SdSpacing.s12;
final _kBottomHeight = SdSpacing.s40;

class MyOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyOrderAppBar({super.key, required this.controller});
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return SdAppBar(
      titleText: 'My order',
      showBackButton: false,
      titleSpacing: _kTitleSpacing,
      actionPadding: EdgeInsets.only(right: _kTitleSpacing - _kIconPadding),
      actions: [
        SdIconButton(
          padding: EdgeInsets.all(_kIconPadding),
          onPressed: () {},
          icon: SdIcon(
            iconData: Ionicons.search,
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(_kBottomHeight),
        child: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          controller: controller,
          dividerColor: SdColors.transparent,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(
            horizontal: SdSpacing.s16,
            vertical: SdSpacing.s2,
          ),
          labelStyle: SdTextStyle.body14()
              .wColor(context.colorTheme.primary)
              .wSemiBold(),
          unselectedLabelStyle: SdTextStyle.body14().wColor(
            context.colorTheme.textDefault,
          ),
          tabs: OrderStatusExt.allStatus
              .map((e) => Tab(text: e.label, height: SdSpacing.s32))
              .toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + _kBottomHeight);
}
