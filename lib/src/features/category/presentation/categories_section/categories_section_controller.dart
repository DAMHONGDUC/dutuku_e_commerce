import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_section_state.dart';

class CategoriesController extends Cubit<CategoriesState> {
  final GetCategoriesUsecase _getCategoriesUsecase;

  CategoriesController(this._getCategoriesUsecase) : super(CategoriesInitial());

  Future getData() async {
    emit(CategoriesLoading());

    final result = await _getCategoriesUsecase.call(NoParams());

    result.fold(
      (failure) {
        emit(CategoriesError(errorMsg: 'something wrong'));
      },
      (r) {
        emit(CategoriesLoaded(categories: r));
      },
    );
  }
}
