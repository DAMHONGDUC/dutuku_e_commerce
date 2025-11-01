import 'package:flutter_bloc/flutter_bloc.dart';

part 'tutorial_state.dart';

class TutorialController extends Cubit<TutorialState> {
  TutorialController() : super(TutorialInitial());

  void markTutorialComplete() {
    // TODO: handle logic
  }
}
