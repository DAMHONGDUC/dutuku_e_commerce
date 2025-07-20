import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'banner_carousel_section/banner_carousel_controller.dart';
import 'banner_carousel_section/banner_carousel_section.dart';
import 'categories_section/categories_section.dart';
import 'categories_section/categories_section_controller.dart';
import 'components/home_sliver_app_bar.dart';
import 'recommend_products_section/recommend_products_controller.dart';
import 'recommend_products_section/recommend_products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<BannerCarouselController>()..getData(),
        ),
        BlocProvider(create: (_) => getIt<CategoriesController>()..getData()),
        BlocProvider(
          create: (_) => getIt<RecommendProductsController>()..getData(),
        ),
      ],
      child: Container(
        color: context.colorTheme.surfaceDefault,
        child: SafeArea(child: _HomeView()),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  Future _onRefreshHome(BuildContext context) async {
    context.read<BannerCarouselController>().getData();
    context.read<CategoriesController>().getData();
    context.read<RecommendProductsController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshWrapper(
      onRefresh: () => _onRefreshHome(context),
      child: Scaffold(
        backgroundColor: context.colorTheme.pageDefault,
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            // app bar
            HomeSliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // banner
                  SectionContainer(
                    topMargin: true,
                    bottomMargin: true,
                    child: const BannerCarouselSection(),
                  ),

                  // category
                  SectionContainer(
                    titleWidget: const SectionHeader(title: 'Categories'),
                    bottomMargin: true,
                    child: const CategoriesSection(),
                  ),

                  // product
                  SectionContainer(
                    titleWidget: const SectionHeader(title: 'New Arrivals 🔥'),
                    child: RecommendProductsSection(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
