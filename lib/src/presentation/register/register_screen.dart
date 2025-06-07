import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Register here'),
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.registerOtp.fullPath);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
