import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/domain/usecases/get_my_order_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'my_order_state.dart';

@injectable
class ProductDetailController extends Cubit<MyOrderState> {
  ProductDetailController(this._getMyOrderUsecase)
    : super(MyOrderStateInitial());

  final GetMyOrderUsecase _getMyOrderUsecase;

  final Map<OrderStatus, _TabData> _tabsData = {};

  Future<void> onRefresh({required OrderStatus currentTab}) async {
    final newFilter = GetMyOrderFilterParams.init().copyWith(
      status: currentTab,
    );

    emit(MyOrderLoadingState(currentTab: currentTab));
    await _getData(
      filterParams: newFilter,
      currentTab: currentTab,
      itemsTransformation: (r) => r.items,
    );
  }

  Future<void> onLoadMore({
    required OrderStatus currentTab,
    required bool canLoadMore,
  }) async {
    // Load more => use exist filter && push more item into exist data
    final tabData = _tabsData[currentTab];

    if (!canLoadMore || tabData == null) {
      return;
    }

    // Load more => update pageNumber to go to the next page
    final newFilter = tabData.filter.copyWith(
      status: currentTab,
      pageNumber: tabData.filter.pageNumber + 1,
    );

    emit(MyOrderLoadingMoreState(currentTab: currentTab));
    await _getData(
      filterParams: newFilter,
      currentTab: currentTab,
      itemsTransformation: (r) {
        return [...tabData.state.items, ...r.items];
      },
    );
  }

  Future<void> onChangeTab({required int tabIndex}) async {
    final currentTab = OrderStatusExt.fromIndex(tabIndex);
    if (currentTab == OrderStatus.none) {
      return;
    }

    final data = _tabsData[currentTab];

    emit(MyOrderTransitState(currentTab: currentTab));

    // reuse existing data when switching tabs if possible
    if (data != null) {
      emit(
        MyOrderLoadedState(
          items: data.state.items,
          canLoadMore: data.state.canLoadMore,
          currentPage: data.state.currentPage,
          currentTab: currentTab,
        ),
      );
    } else {
      onRefresh(currentTab: currentTab);
    }
  }

  Future<void> _getData({
    required GetMyOrderFilterParams filterParams,
    required List<OrderEntity> Function(OrdersData) itemsTransformation,
    required OrderStatus currentTab,
  }) async {
    final result = await _getMyOrderUsecase.call(filterParams);

    result.fold(
      (l) {
        emit(
          MyOrderErrorState(
            errorMsg: 'Something wrong',
            currentTab: currentTab,
          ),
        );
      },
      (r) {
        final loadedState = MyOrderLoadedState(
          items: itemsTransformation(r),
          canLoadMore: r.totalPage > filterParams.pageNumber,
          currentPage: filterParams.pageNumber,
          currentTab: currentTab,
        );

        emit(loadedState);
        _tabsData[currentTab] = _TabData(
          filter: filterParams,
          state: loadedState,
        );
      },
    );
  }
}

class _TabData extends Equatable {
  final GetMyOrderFilterParams filter;
  final MyOrderLoadedState state;

  const _TabData({required this.filter, required this.state});

  @override
  List<Object?> get props => [filter, state];
}
