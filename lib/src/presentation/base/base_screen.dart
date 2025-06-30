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
      iconSize: SdSpacing.s24,
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onItemTapped(context, index),
        selectedLabelStyle: context.textTheme.heading12,
        unselectedLabelStyle: context.textTheme.body12.copyWith(
          color: AppColors.grey,
        ),
        backgroundColor: context.colorTheme.surfaceDefault,
        elevation: 0.5,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
        iconSize: SdSpacing.s18,
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
                icon: Ionicons.notifications_outline,
                iconSelected: Ionicons.notifications,
              ),
            ),
            label: 'Notification',
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
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
