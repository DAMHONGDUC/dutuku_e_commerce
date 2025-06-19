import 'package:carousel_slider/carousel_slider.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/index.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerItem> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.banners.map((banner) {
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
                          borderRadius: BorderRadius.circular(SdSpacing.s12),
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
                        style: context.textTheme.heading14.wColor(contentColor),
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
            height: 150.sp,
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
          children: widget.banners.asMap().entries.map((entry) {
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
}
