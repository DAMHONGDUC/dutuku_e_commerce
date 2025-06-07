import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tutorial_controller.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TutorialController(),
      child: _TutorialView(),
    );
  }
}

class _TutorialView extends StatelessWidget {
  const _TutorialView();

  void _onFinishTutorial(BuildContext context) {
    context.read<TutorialController>().markTutorialComplete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TutorialController, TutorialState>(
      listener: (context, state) {
        // TODO: listen the state nav to login screen
        //context.go(AppRoutes.login.fullPath);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Tutorial Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to the Tutorial!'),
              ElevatedButton(
                onPressed: () => _onFinishTutorial(context),
                child: const Text('Finish Tutorial'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
