import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({
    super.key,
    required this.theme,
    required this.darkTheme,
  });

  final ThemeData theme;
  final ThemeData darkTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      darkTheme: darkTheme,
      routerConfig: kAppRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
