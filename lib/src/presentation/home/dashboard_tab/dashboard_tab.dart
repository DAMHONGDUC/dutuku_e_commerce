import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'banner_carousel_section/banner_carousel_controller.dart';
import 'banner_carousel_section/banner_carousel_section.dart';
import 'product_grid_section/product_grid_controller.dart';
import 'product_grid_section/product_grid_section.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab>
    with AutomaticKeepAliveClientMixin<DashboardTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProductGridController>()..fetchProducts(),
        ),
        BlocProvider(
          create: (_) => getIt<BannerCarouselController>()..getData(),
        ),
      ],
      child: Container(
        padding: EdgeInsets.only(
          left: SdSpacing.s12,
          right: SdSpacing.s12,
          top: SdSpacing.s16,
        ),
        child: SingleChildScrollView(
          // use this bacause we lost shadow of the product card
          clipBehavior: Clip.none,
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
      ),
    );
  }
}
