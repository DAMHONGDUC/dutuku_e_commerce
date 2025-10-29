import 'package:dutuku_e_commerce/src/presentation/login/router/login_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Content'),
            ElevatedButton(
              onPressed: () {
                context.go(LoginRoutes.login.fullPath);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
