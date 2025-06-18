import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class BaseScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BaseScreen({super.key, required this.navigationShell});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: SdColors.black54, blurRadius: SdSpacing.s1),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onItemTapped(context, index),
          selectedLabelStyle: context.appTextTheme.labelMedium,
          unselectedLabelStyle: context.appTextTheme.bodySmall?.copyWith(
            color: AppColors.grey,
          ),
          backgroundColor: context.appThemeColor.bgPrimary,
          elevation: SdSpacing.s1,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          type: BottomNavigationBarType.fixed,
          iconSize: SdSpacing.s20,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: navigationShell.currentIndex == 0
                    ? AppColors.primary
                    : AppColors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
                color: navigationShell.currentIndex == 1
                    ? AppColors.primary
                    : AppColors.grey,
              ),
              label: 'My Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: navigationShell.currentIndex == 2
                    ? AppColors.primary
                    : AppColors.grey,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: navigationShell.currentIndex == 3
                    ? AppColors.primary
                    : AppColors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
