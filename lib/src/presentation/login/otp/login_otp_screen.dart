import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginOTPScreen extends StatelessWidget {
  const LoginOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter OTP'),
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.home.fullPath);
              },
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
