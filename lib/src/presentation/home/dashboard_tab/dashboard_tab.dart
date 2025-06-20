import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/dashboard_tab/banner_carousel_section/banner_carousel_section.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'product_grid_section/product_grid_section.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SdSpacing.s12,
        right: SdSpacing.s12,
        top: SdSpacing.s16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // banner section
            BannerCarouselSection(),
            SdVerticalSpacing(),

            // product section
            const SectionHeader(
              title: 'New Arrivals 🔥',
              actionText: 'See All',
            ),
            SdVerticalSpacing(),
            ProductGridSection(),
            SdVerticalSpacing(),
          ],
        ),
      ),
    );
  }
}
