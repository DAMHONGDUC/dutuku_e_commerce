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
  late final GoRouterDelegate _routerDelegate;

  @override
  void initState() {
    super.initState();
    _routerDelegate = GoRouter.of(context).routerDelegate;
    _routerDelegate.addListener(_onRouterChange);
    _updateSelectedIndex();
  }

  @override
  void dispose() {
    _routerDelegate.removeListener(_onRouterChange);
    super.dispose();
  }

  void _onRouterChange() {
    final oldIndex = _currentIndex;
    _updateSelectedIndex();
    if (oldIndex != _currentIndex) {
      setState(() {});
    }
  }

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

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              color: _currentIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _currentIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 3 ? Colors.blue : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
