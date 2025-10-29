import 'package:dutuku_e_commerce/src/presentation/home/router/home_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/register/router/register_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login here'),
            ElevatedButton(
              onPressed: () {
                context.go(HomeRoutes.home.fullPath);
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                context.push(RegisterRoutes.register.fullPath);
              },
              child: const Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
