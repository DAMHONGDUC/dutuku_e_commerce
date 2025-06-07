// lib/screens/base/my_order_screen.dart
import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Order Screen')),
      body: const Center(child: Text('My Order Content')),
    );
  }
}
