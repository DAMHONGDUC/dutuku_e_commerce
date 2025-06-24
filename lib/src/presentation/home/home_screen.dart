import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/presentation/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_tab/category_tab.dart';
import 'dashboard_tab/banner_carousel_section/banner_carousel_controller.dart';
import 'dashboard_tab/dashboard_tab.dart';
import 'dashboard_tab/product_grid_section/product_grid_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProductGridController>()..fetchProducts(),
        ),
        BlocProvider(
          create: (_) => getIt<BannerCarouselController>()..getData(),
        ),
      ],
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(tabController: _tabController),
      backgroundColor: context.colorTheme.pageDefault,
      body: TabBarView(
        controller: _tabController,
        children: [DashboardTab(), CategoryTab()],
      ),
    );
  }
}
