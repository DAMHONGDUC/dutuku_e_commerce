import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'my_order_state.dart';

@injectable
class ProductDetailController extends Cubit<MyOrderState> {
  ProductDetailController() : super(MyOrderStateInitial());
}
