import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_selection_state.dart';

class ColorSelectionController extends Cubit<ColorSelectionState> {
  ColorSelectionController() : super(ColorSelectionInitial());

  void onChangeColor(ProductColor? productColor) {
    if (productColor == null) {
      return;
    }
    emit(ColorSelectionTransitState());
    emit(ColorSelectionChangedColorState(productColor: productColor));
  }
}
