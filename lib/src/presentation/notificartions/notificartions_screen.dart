import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen.NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificartions Screen')),
      body: const Center(child: Text('Notificartions Content')),
    );
  }
}
