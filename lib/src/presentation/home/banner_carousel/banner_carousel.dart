import 'package:carousel_slider/carousel_slider.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/index.dart';

import 'cubit/banner_carousel_controller.dart';

final kBannerHeight = 150.sp;

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BannerCarouselController>()..getData(),
      child: _BannerCarouselView(),
    );
  }
}

class _BannerCarouselView extends StatefulWidget {
  const _BannerCarouselView();

  @override
  State<_BannerCarouselView> createState() => _BannerCarouselViewState();
}

class _BannerCarouselViewState extends State<_BannerCarouselView> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannerCarouselController, BannerCarouselState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen: (previous, current) =>
          current is BannerCarouselLoading || current is BannerCarouselSuccess,
      builder: (context, state) {
        if (state is BannerCarouselLoading) {
          return SdSkeleton(height: kBannerHeight);
        } else if (state is BannerCarouselSuccess) {
          return Column(
            children: [
              CarouselSlider(
                items: state.banners.map((banner) {
                  final hex = banner.contentColor.replaceAll('#', '');
                  final contentColor = Color(
                    int.parse(hex.length == 6 ? 'FF$hex' : hex, radix: 16),
                  );

                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(SdSpacing.s12),
                        child: Image.asset(
                          banner.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        left: SdSpacing.s16,
                        top: SdSpacing.s16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: SdSpacing.s8,
                                vertical: SdSpacing.s4,
                              ),
                              width: 80.sp,
                              decoration: BoxDecoration(
                                color: banner.tagType.color,
                                borderRadius: BorderRadius.circular(
                                  SdSpacing.s12,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                banner.tag,
                                style: context.textTheme.heading12.whiteText(),
                              ),
                            ),
                            SdVerticalSpacing(),
                            Text(
                              banner.title,
                              style: context.textTheme.heading14.wColor(
                                contentColor,
                              ),
                            ),
                            Text(
                              banner.subtitle,
                              style: context.textTheme.body12.wColor(
                                contentColor.withValues(alpha: 0.8),
                              ),
                            ),
                            SdVerticalSpacing(),
                            Text(
                              banner.price,
                              style: context.textTheme.heading14
                                  .wColor(contentColor)
                                  .wBold(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  height: kBannerHeight,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              const SdVerticalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.banners.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: SdSpacing.s6,
                      height: SdSpacing.s6,
                      margin: EdgeInsets.symmetric(horizontal: SdSpacing.s4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? AppColors.primary
                            : AppColors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
