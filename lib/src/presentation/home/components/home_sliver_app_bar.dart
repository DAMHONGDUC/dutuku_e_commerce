import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

final _kAppBarPadding = SdSpacing.s12;
final _kAppBarPaddingBottom = SdSpacing.s8;
final _kSearchBarHeight = SdSpacing.s40;
final _kAppBarHeight = _kSearchBarHeight + _kAppBarPaddingBottom;

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
      shadowColor: context.colorTheme.appBarShadowDefault,
      toolbarHeight: _kAppBarHeight,
      backgroundColor: context.colorTheme.surfaceDefault,
      surfaceTintColor: SdColors.transparent,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _kAppBarPadding,
        ).copyWith(bottom: _kAppBarPaddingBottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _SearchBar()),
            SdHorizontalSpacing(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.search.fullPath);
                  },
                  icon: SdIcon(
                    iconData: Ionicons.cart,
                    color: context.colorTheme.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.search.fullPath);
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

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  void _navigateToSearch(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearch(context),
      child: Container(
        height: _kSearchBarHeight,
        padding: EdgeInsets.symmetric(
          horizontal: SdSpacing.s8,
          vertical: SdSpacing.s6,
        ),
        decoration: BoxDecoration(
          color: context.colorTheme.cardDefault,
          borderRadius: BorderRadius.circular(SdSpacing.s8),
          border: Border.all(
            color: context.colorTheme.borderDefault,
            width: SdSpacing.s1,
          ),
        ),
        child: Row(
          children: [
            SdIcon(
              iconData: Ionicons.search,
              color: context.colorTheme.iconDefault,
            ),
            SdHorizontalSpacing(),
            Text(
              'Search products...',
              style: context.textTheme.body14.wColor(
                context.colorTheme.textSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
