import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialisation();

  runApp(MainApp());
}

Future<void> initialisation() async {
  try {
    // di
    configureDependencies();

    // bloc observer
    Bloc.observer = SdBlocObserver();
  } catch (e, stackTrace) {
    SdLog.e('Initialization Error: $e', stackTrace);
  }
}
