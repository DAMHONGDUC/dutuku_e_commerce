import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_detail_app_bar_state.dart';

class ProductDetailAppBarController extends Cubit<ProductDetailAppBarState> {
  ProductDetailAppBarController() : super(ProductDetailAppBarInitial());

  void setScrollOffset(double offset) {
    emit(ProductDetailTransitState(scrollOffset: state.scrollOffset));
    emit(ProductDetailScrollState(scrollOffset: offset));
  }
}
