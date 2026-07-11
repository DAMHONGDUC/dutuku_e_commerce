part of 'color_selection_controller.dart';

sealed class ColorSelectionState extends Equatable {
  const ColorSelectionState();

  @override
  List<Object?> get props => [];
}

final class ColorSelectionInitial extends ColorSelectionState {}

final class ColorSelectionTransitState extends ColorSelectionState {}

final class ColorSelectionChangedColorState extends ColorSelectionState {
  final ProductColor productColor;

  const ColorSelectionChangedColorState({required this.productColor});

  @override
  List<Object?> get props => [productColor];
}
