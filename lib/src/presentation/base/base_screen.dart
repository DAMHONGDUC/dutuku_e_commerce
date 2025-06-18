import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

class BaseScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BaseScreen({super.key, required this.navigationShell});

  Widget _buildIcon({
    required bool isSelected,
    required IconData iconSelected,
    required IconData icon,
  }) {
    return SdIcon(
      iconData: isSelected ? iconSelected : icon,
      color: isSelected ? AppColors.primary : AppColors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconPadding = EdgeInsets.only(
      top: SdSpacing.s4,
      bottom: SdSpacing.s4,
    );

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: SdColors.black54, blurRadius: 0.5)],
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onItemTapped(context, index),
          selectedLabelStyle: context.appTextTheme.labelSmall,
          unselectedLabelStyle: context.appTextTheme.labelSmall?.copyWith(
            color: AppColors.grey,
          ),
          backgroundColor: context.appThemeColor.bgPrimary,
          elevation: 0.5,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          type: BottomNavigationBarType.fixed,
          iconSize: SdSpacing.s20,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: iconPadding,
                child: _buildIcon(
                  isSelected: navigationShell.currentIndex == 0,
                  icon: Ionicons.home_outline,
                  iconSelected: Ionicons.home,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: iconPadding,
                child: _buildIcon(
                  isSelected: navigationShell.currentIndex == 1,
                  icon: Icons.local_shipping_outlined,
                  iconSelected: Icons.local_shipping,
                ),
              ),
              label: 'My Order',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: iconPadding,
                child: _buildIcon(
                  isSelected: navigationShell.currentIndex == 2,
                  icon: Ionicons.heart_outline,
                  iconSelected: Ionicons.heart,
                ),
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: iconPadding,
                child: _buildIcon(
                  isSelected: navigationShell.currentIndex == 3,
                  icon: Ionicons.person_outline,
                  iconSelected: Ionicons.person,
                ),
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
