import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

import 'banner_carousel_section/banner_carousel_section.dart';
import 'categories_section/categories_section.dart';
import 'components/home_app_bar.dart';
import 'recommend_products_section/recommend_products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorTheme.surfaceDefault,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: context.colorTheme.pageDefault,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                // floating & snap => make app bar "snap" into view
                floating: true,
                snap: true,
                pinned: false,
                elevation: 0,
                backgroundColor: context.colorTheme.pageDefault,
                flexibleSpace: FlexibleSpaceBar(background: HomeAppBar()),
              ),
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
                      titleWidget: const SectionHeader(
                        title: 'New Arrivals 🔥',
                      ),
                      child: RecommendProductsSection(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
