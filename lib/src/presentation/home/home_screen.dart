import 'package:dutuku_e_commerce/src/core/navigation/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Content'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.search.fullPath);
              },
              child: Text('Go to search screen'),
            ),
          ],
        ),
      ),
    );
  }
}
