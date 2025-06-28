import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'banner_carousel_section/banner_carousel_section.dart';
import 'categories_section/categories_section.dart';
import 'recommend_products_section/recommend_products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.pageDefault,
      appBar: HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.all(SdSpacing.s8),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              // banner section
              const BannerCarouselSection(),
              const SdVerticalSpacing(),

              // categories section
              const SectionHeader(title: 'Categories'),
              const CategoriesSection(),
              const SdVerticalSpacing(),

              // recommend product section
              const SectionHeader(title: 'New Arrivals 🔥'),
              const RecommendProductsSection(),
              const SdVerticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
