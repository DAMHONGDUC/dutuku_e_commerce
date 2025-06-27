import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/categories_section/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'banner_carousel_section/banner_carousel_section.dart';
import 'recommend_products/recommend_products_section.dart';
import 'user_info_section/user_info_section.dart';

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
      backgroundColor: context.colorTheme.pageDefault,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(SdSpacing.s8),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                // user info section
                UserInfoSection(),
                SdVerticalSpacing(),

                // banner section
                BannerCarouselSection(),
                SdVerticalSpacing(),

                // categories section
                const SectionHeader(title: 'Categories'),
                CategoriesSection(),
                SdVerticalSpacing(),

                // recommend product section
                const SectionHeader(title: 'New Arrivals 🔥'),
                RecommendProductsSection(),
                SdVerticalSpacing(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
