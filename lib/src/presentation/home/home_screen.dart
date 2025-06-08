import 'package:dutuku_e_commerce/src/core/navigation/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

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
            Text('Home Content', style: SdTextStyle.body18()),
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
