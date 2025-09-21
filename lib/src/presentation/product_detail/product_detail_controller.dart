import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_detail_state.dart';

@injectable
class ProductDetailController extends Cubit<ProductDetailState> {
  ProductDetailController() : super(ProductDetailInitial());
}
