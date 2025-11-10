import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dutuku_e_commerce/main_material_app.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialisation();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(DutukuECommerceApp(savedThemeMode: savedThemeMode));
}

class DutukuECommerceApp extends StatelessWidget {
  const DutukuECommerceApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.buildLightTheme(),
      dark: AppTheme.buildDarkTheme(),
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) =>
          MainMaterialApp(theme: theme, darkTheme: darkTheme),
    );
  }
}

Future<void> initialisation() async {
  try {
    // di
    Injector.config();

    // bloc observer
    Bloc.observer = SdBlocObserver();
  } catch (e, stackTrace) {
    SdLog.e('Initialization Error: $e', stackTrace);
  }
}
