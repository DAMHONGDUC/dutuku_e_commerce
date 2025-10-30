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
      length: OrderStatusExt.allStatus.length,
      vsync: this,
    );
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
      child: Column(children: []),
    );
  }
}
