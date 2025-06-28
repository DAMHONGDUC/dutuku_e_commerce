import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'banner_carousel_section/banner_carousel_section.dart';
import 'categories_section/categories_section.dart';
import 'components/home_app_bar.dart';
import 'recommend_products_section/recommend_products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.pageDefault,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            elevation: 0,
            backgroundColor: context.colorTheme.pageDefault,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: context.colorTheme.pageDefault,
                child: HomeAppBar(),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(SdSpacing.s12),
              child: Column(
                children: [
                  // banner
                  const BannerCarouselSection(),
                  const SdVerticalSpacing(),

                  // category
                  const SectionHeader(title: 'Categories'),
                  const CategoriesSection(),
                  const SdVerticalSpacing(),

                  // product
                  const SectionHeader(title: 'New Arrivals 🔥'),
                  const RecommendProductsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
