import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

final kMockBannerPath = 'assets/images/banner/';

class BannerMock {
  static final List<BannerItem> banners = [
    BannerItem(
      id: 1,
      imageUrl: '${kMockBannerPath}b_1.png',
      tag: '24% OFF',
      title: 'Shipping Today',
      subtitle: 'On bag purchases',
      price: '\$279.99',
      tagType: BannerTagTypeEnum.discount,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      id: 2,
      imageUrl: '${kMockBannerPath}b_2.png',
      tag: 'New',
      title: 'Leather Tote',
      subtitle: 'Elegant and spacious',
      price: '\$249.99',
      tagType: BannerTagTypeEnum.newArrival,
      contentColor: '#000000',
    ),
    BannerItem(
      id: 3,
      imageUrl: '${kMockBannerPath}b_3.png',
      tag: 'Limited',
      title: 'Mini Shoulder Bag',
      subtitle: 'Stylish and compact',
      price: '\$189.00',
      tagType: BannerTagTypeEnum.limited,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      id: 4,
      imageUrl: '${kMockBannerPath}b_4.png',
      tag: 'Hot',
      title: 'Everyday Essentials',
      subtitle: 'Best seller this week',
      price: 'From \$99.99',
      tagType: BannerTagTypeEnum.hot,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      id: 5,
      imageUrl: '${kMockBannerPath}b_5.png',
      tag: 'Trending',
      title: 'Canvas Backpack',
      subtitle: 'Durable and modern',
      price: '\$129.50',
      tagType: BannerTagTypeEnum.hot,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      id: 6,
      imageUrl: '${kMockBannerPath}b_6.png',
      tag: 'Exclusive',
      title: 'Elegant Clutch',
      subtitle: 'Night-out ready',
      price: '\$89.00',
      tagType: BannerTagTypeEnum.limited,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      id: 7,
      imageUrl: '${kMockBannerPath}b_7.png',
      tag: 'Sale',
      title: 'Work Bag',
      subtitle: 'Perfect for the office',
      price: '\$199.99',
      tagType: BannerTagTypeEnum.discount,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      id: 8,
      imageUrl: '${kMockBannerPath}b_8.png',
      tag: 'New',
      title: 'Weekender Bag',
      subtitle: 'Ready for travel',
      price: '\$159.00',
      tagType: BannerTagTypeEnum.newArrival,
      contentColor: '#000000',
    ),
  ];
}
