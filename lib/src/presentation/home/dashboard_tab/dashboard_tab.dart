import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/dashboard_tab/banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'product_grid/product_grid.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        BannerCarousel(),
        SdVerticalSpacing(),
        const SectionHeader(title: 'New Arrivals 🔥', actionText: 'See All'),
        SdVerticalSpacing(),
        ProductGrid(),
      ],
    );
  }
}
