import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  const BaseScreen({super.key, required this.child});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedIndex();
  }

  // Updates the selected index of the BottomNavigationBar based on the current route
  void _updateSelectedIndex() {
    final location = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.toString();

    if (location.startsWith(AppRoutes.home.fullPath)) {
      _currentIndex = 0;
    } else if (location.startsWith(AppRoutes.myOrder.fullPath)) {
      _currentIndex = 1;
    } else if (location.startsWith(AppRoutes.favorite.fullPath)) {
      _currentIndex = 2;
    } else if (location.startsWith(AppRoutes.profile.fullPath)) {
      _currentIndex = 3;
    }
  }

  // Handles tapping on BottomNavigationBar items
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home.fullPath);
        break;
      case 1:
        context.go(AppRoutes.myOrder.fullPath);
        break;
      case 2:
        context.go(AppRoutes.favorite.fullPath);
        break;
      case 3:
        context.go(AppRoutes.profile.fullPath);
        break;
    }
    // No need to call setState here, GoRouter handles rebuilding and
    // didChangeDependencies will update _currentIndex.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, // This widget displays the content of the active tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
