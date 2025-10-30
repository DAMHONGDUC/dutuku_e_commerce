import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

import 'my_order_controller.dart';

final _kIconPadding = SdSpacing.s6;
final _kTitleSpacing = SdSpacing.s12;

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
      appBar: SdAppBar(
        titleText: 'My order',
        showBackButton: false,
        titleSpacing: _kTitleSpacing,
        actionPadding: EdgeInsets.only(right: _kTitleSpacing - _kIconPadding),
        actions: [
          SdIconButton(
            padding: EdgeInsets.all(_kIconPadding),
            onPressed: () {},
            icon: SdIcon(
              iconData: Ionicons.search,
              color: context.colorTheme.primary,
            ),
          ),
          SdHorizontalSpacing(xRatio: 0.5),
          SdIconButton(
            padding: EdgeInsets.all(_kIconPadding),
            onPressed: () {},
            icon: SdIcon(
              iconData: Ionicons.chatbubble_ellipses_outline,
              color: context.colorTheme.primary,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(SdSpacing.s40),
          child: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            controller: _tabController,
            dividerColor: SdColors.transparent,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(
              horizontal: SdSpacing.s16,
              vertical: SdSpacing.s2,
            ),
            labelStyle: SdTextStyle.body14()
                .wColor(context.colorTheme.primary)
                .wSemiBold(),
            unselectedLabelStyle: SdTextStyle.body14().wColor(
              context.colorTheme.textDefault,
            ),
            tabs: OrderStatusExt.allStatus
                .map((e) => Tab(text: e.label, height: SdSpacing.s32))
                .toList(),
          ),
        ),
      ),
      child: Column(children: []),
    );
  }
}
