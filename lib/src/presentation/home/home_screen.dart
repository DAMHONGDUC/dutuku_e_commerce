import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'banner_carousel_section/banner_carousel_section.dart';
import 'product_grid_section/recommend_products_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
      body: Container(
        padding: EdgeInsets.all(SdSpacing.s8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // banner section
              BannerCarouselSection(),
              SdVerticalSpacing(),

              // recommend product section
              const SectionHeader(
                title: 'New Arrivals 🔥',
                actionText: 'See All',
              ),
              SdVerticalSpacing(),
              RecommendProductsSection(),
              SdVerticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
