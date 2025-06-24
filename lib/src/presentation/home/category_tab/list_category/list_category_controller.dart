import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'list_category_state.dart';

@injectable
class ListCategoryController extends Cubit<ListCategoryState> {
  final GetCategoriesUsecase _getCategoriesUsecase;

  ListCategoryController(this._getCategoriesUsecase)
    : super(ListCategoryInitial());

  Future getData() async {
    emit(ListCategoryLoading());

    final result = await _getCategoriesUsecase.call(NoParams());

    result.fold(
      (failure) {
        // TODO: handle fail
      },
      (r) {
        emit(ListCategoryLoaded(categories: r));
      },
    );
  }
}
