import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'components/my_order_app_bar.dart';
import 'my_order_controller.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProductDetailController>()),
      ],
      child: _MyOrderView(),
    );
  }
}

class _MyOrderView extends StatefulWidget {
  const _MyOrderView();

  @override
  State<_MyOrderView> createState() => __MyOrderViewState();
}

class __MyOrderViewState extends State<_MyOrderView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: OrderStatusExt.tabs.length,
      vsync: this,
    );
    _tabController.addListener(() {});

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.surfaceDefault,
      appBar: MyOrderAppBar(controller: _tabController),
      child: Expanded(
        child: TabBarView(
          controller: _tabController,
          children: OrderStatusExt.tabs
              .map((e) => _TabContent(tabValue: e))
              .toList(),
        ),
      ),
    );
  }
}

class _TabContent extends StatefulWidget {
  const _TabContent({required this.tabValue});
  final OrderStatus tabValue;

  @override
  State<_TabContent> createState() => __TabContentState();
}

class __TabContentState extends State<_TabContent>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Placeholder();
  }

  @override
  bool get wantKeepAlive => true;
}
