import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/login/config/login_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'components/profile_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.pageDefault,
      contentBgColor: context.colorTheme.pageDefault,
      appBar: ProfileAppBar(),
      child: Center(
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
