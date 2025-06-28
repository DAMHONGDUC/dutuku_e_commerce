import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SdAppBar(
      backgroundColor: AppColors.primary,
      titleWidget: _SearchBar(),
      noElevation: true,
      showBackButton: false,
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.search.fullPath);
          },
          icon: SdIcon(iconData: Ionicons.cart_outline, color: AppColors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: SdIcon(
            iconData: Ionicons.notifications_outline,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  void _navigateToSearch(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearch(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SdSpacing.s8,
          vertical: SdSpacing.s6,
        ),
        decoration: BoxDecoration(
          color: context.colorTheme.cardDefault,
          borderRadius: BorderRadius.circular(SdSpacing.s8),
        ),
        child: Row(
          children: [
            SdIcon(
              iconData: Ionicons.search_outline,
              color: context.colorTheme.iconSecondary,
            ),
            SdHorizontalSpacing(),
            Text(
              'Search products...',
              style: context.textTheme.body12.wColor(
                context.colorTheme.textSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
