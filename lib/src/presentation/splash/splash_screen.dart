import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashController()..checkLoginStatus(),
      child: _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashController, SplashState>(
      listener: (context, state) {
        if (state is LoggedInLState) {
          GoRouter.of(context).go(AppRoutes.home.fullPath);
        } else if (state is NotLogInLState) {
          GoRouter.of(context).go(AppRoutes.login.fullPath);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.loc.app_name,
                style: context.appTextTheme.displayMedium
                    ?.wSemiBold()
                    .whiteText(),
              ),
              SdVerticalSpacing(xRatio: 0.5),
              Text(
                context.loc.splash_description,
                style: context.appTextTheme.bodyMedium?.whiteText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
