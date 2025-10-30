import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/config/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

final _kAppBarPadding = SdSpacing.s12;
final _kAppBarPaddingTop = SdSpacing.s4;
final _kAppBarPaddingBottom = SdSpacing.s8;
final _kSearchBarHeight = SdSpacing.s40;
final _kAppBarHeight =
    _kSearchBarHeight + _kAppBarPaddingBottom + _kAppBarPaddingTop;
final _kIconPadding = SdSpacing.s6;

class HomeSliverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // floating & snap => make app bar "snap" into view
      floating: true,
      snap: true,
      pinned: false,
      elevation: SdSpacing.s2,
      shadowColor: context.colorTheme.primaryShadowDefault,
      toolbarHeight: _kAppBarHeight,
      backgroundColor: context.colorTheme.surfaceDefault,
      surfaceTintColor: SdColors.transparent,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(
          left: _kAppBarPadding,
          right: _kAppBarPadding - _kIconPadding,
          bottom: _kAppBarPaddingBottom,
          top: _kAppBarPaddingTop,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: CustomSearchBar(height: _kSearchBarHeight)),
            SdHorizontalSpacing(),
            Row(
              children: [
                SdIconButton(
                  padding: EdgeInsets.all(_kIconPadding),
                  onPressed: () {
                    GoRouter.of(context).push(HomeRoutes.search.fullPath);
                  },
                  icon: SdIcon(
                    iconData: Ionicons.cart,
                    color: context.colorTheme.primary,
                  ),
                ),
                SdHorizontalSpacing(xRatio: 0.5),
                SdIconButton(
                  padding: EdgeInsets.all(_kIconPadding),
                  onPressed: () {
                    GoRouter.of(context).push(HomeRoutes.search.fullPath);
                  },
                  icon: SdIcon(
                    iconData: Ionicons.chatbubble_ellipses_outline,
                    color: context.colorTheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_kAppBarHeight);
}
