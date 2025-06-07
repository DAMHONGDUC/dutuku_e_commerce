import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: kAppRouter,
      debugShowCheckedModeBanner: false,
      title: 'GoRouter Demo',
    );
  }
}
