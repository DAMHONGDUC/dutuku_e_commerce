import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:system_design_flutter/index.dart';

part 'product_grid_state.dart';

@injectable
class ProductGridController extends Cubit<ProductGridState> {
  ProductGridController() : super(ProductGridLoading());

  Future<void> fetchProducts() async {
    emit(ProductGridLoading());

    await SdHelper.delayLoading();

    emit(ProductGridLoaded(MockData.products));
  }
}
