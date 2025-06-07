// lib/screens/base/my_order_screen.dart
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Order Screen')),
      body: Center(
        child: Column(
          children: [
            Text('My Order Content'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.myOrderDetail.fullPath);
              },
              child: Text('Go to my order detail screen'),
            ),
          ],
        ),
      ),
    );
  }
}
