import 'package:carousel_slider/carousel_slider.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'banner_carousel_controller.dart';

class BannerCarouselSection extends StatefulWidget {
  const BannerCarouselSection({super.key});

  @override
  State<BannerCarouselSection> createState() => _BannerCarouselSectionState();
}

class _BannerCarouselSectionState extends State<BannerCarouselSection> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannerCarouselController, BannerCarouselState>(
      listener: (context, state) {
        // TODO: implement listener if need
      },
      buildWhen: (previous, current) =>
          current is BannerCarouselLoading || current is BannerCarouselSuccess,
      builder: (context, state) {
        if (state is BannerCarouselLoading) {
          return _BannerSkeleton();
        } else if (state is BannerCarouselSuccess) {
          return Column(
            children: [
              CarouselSlider(
                items: state.banners.map((banner) {
                  final contentColor = SdColorHelper.getColorFromHex(
                    banner.contentColor,
                  );

                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          UIConstants.bannerBorderRadius,
                        ),
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
                              width: UIConstants.bannerTagWidth,
                              decoration: BoxDecoration(
                                color: banner.tagType.color,
                                borderRadius: BorderRadius.circular(
                                  SdSpacing.s12,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                banner.tag,
                                style: context.textTheme.heading14.whiteText(),
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
                                contentColor,
                              ),
                            ),
                            SizedBox(height: SdSpacing.s8),
                            Text(
                              banner.price,
                              style: context.textTheme.heading16
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
                  height: UIConstants.bannerHeight,
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
              SdVerticalSpacing(),
              _BannerIndicator(
                length: state.banners.length,
                onTap: (index) => _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                colorBuilder: (index) => index == _current
                    ? context.colorTheme.indicatorActive
                    : context.colorTheme.indicatorBg,
              ),
            ],
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}

class _BannerIndicator extends StatelessWidget {
  final int length;
  final void Function(int index)? onTap;
  final Color Function(int index)? colorBuilder;

  const _BannerIndicator({required this.length, this.onTap, this.colorBuilder});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return GestureDetector(
          onTap: () => onTap?.call(index),
          child: Container(
            width: SdSpacing.s6,
            height: SdSpacing.s6,
            margin: EdgeInsets.symmetric(horizontal: SdSpacing.s4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorBuilder?.call(index),
            ),
          ),
        );
      }),
    );
  }
}

class _BannerSkeleton extends StatelessWidget {
  const _BannerSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SdSkeleton(
          height: UIConstants.bannerHeight,
          borderRadiusValue: UIConstants.bannerBorderRadius,
        ),
        SdVerticalSpacing(),
        _BannerIndicator(
          length: 8,
          colorBuilder: (index) => context.colorTheme.indicatorBg,
        ),
      ],
    );
  }
}
