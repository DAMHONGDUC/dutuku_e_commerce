import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/widgets/route/sd_go_route.dart';

import '../tutorial_screen.dart';
import 'tutorial_routes.dart';

class TutorialStack {
  static final routes = [
    SdGoRoute(
      path: TutorialRoutes.tutorial.path,
      name: TutorialRoutes.tutorial.name,
      builder: (BuildContext context, GoRouterState state) {
        return const TutorialScreen();
      },
    ),
  ];
}
