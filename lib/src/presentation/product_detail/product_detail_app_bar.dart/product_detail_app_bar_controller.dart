import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_detail_app_bar_state.dart';

@injectable
class ProductDetailAppBarController extends Cubit<ProductDetailAppBarState> {
  ProductDetailAppBarController() : super(ProductDetailAppBarInitial());

  void setScrollOffset(double offset) {
    emit(ProductDetailTransitState(scrollOffset: state.scrollOffset));
    emit(ProductDetailScrollState(scrollOffset: offset));
  }
}
