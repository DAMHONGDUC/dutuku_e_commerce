import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.buildLightTheme(),
      dark: AppTheme.buildDarkTheme(),
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => SdScreenUtil(
        child: MaterialApp.router(
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: kAppRouter,
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
        ),
      ),
    );
  }
}
