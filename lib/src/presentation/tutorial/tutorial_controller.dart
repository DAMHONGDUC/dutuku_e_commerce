import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'tutorial_state.dart';

@injectable
class TutorialController extends Cubit<TutorialState> {
  TutorialController() : super(TutorialInitial());

  void markTutorialComplete() {
    // TODO: handle logic
  }
}
