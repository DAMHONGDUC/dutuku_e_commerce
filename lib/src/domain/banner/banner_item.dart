import 'package:dutuku_e_commerce/src/core/core.dart';

class BannerItem {
  final String imageUrl;
  final String tag;
  final BannerTagTypeEnum tagType;
  final String title;
  final String subtitle;
  final String price;
  final String contentColor;

  BannerItem({
    required this.imageUrl,
    required this.tag,
    required this.tagType,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.contentColor,
  });
}
