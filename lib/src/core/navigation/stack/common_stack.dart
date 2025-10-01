import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/preview_media/preview_media_args.dart';
import 'package:dutuku_e_commerce/src/presentation/preview_media/preview_media_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class CommonStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.previewMedia.path,
      name: AppRoutes.previewMedia.name,
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as PreviewMediaArgs;
        return PreviewMediaScreen(args: args);
      },
    ),
  ];
}
