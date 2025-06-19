import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

class MockData {
  static final List<BannerItem> banners = [
    BannerItem(
      imageUrl: 'assets/images/banner_1.png',
      tag: '24% OFF',
      title: 'Shipping Today',
      subtitle: 'On bag purchases',
      price: '\$279.99',
      tagType: BannerTagTypeEnum.discount,
      contentColor: '#000000',
    ),
    BannerItem(
      imageUrl: 'assets/images/banner_2.png',
      tag: 'New',
      title: 'Leather Tote',
      subtitle: 'Elegant and spacious',
      price: '\$249.99',
      tagType: BannerTagTypeEnum.newArrival,
      contentColor: '#000000',
    ),
    BannerItem(
      imageUrl: 'assets/images/banner_3.png',
      tag: 'Limited',
      title: 'Mini Shoulder Bag',
      subtitle: 'Stylish and compact',
      price: '\$189.00',
      tagType: BannerTagTypeEnum.limited,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      imageUrl: 'assets/images/banner_4.png',
      tag: 'Hot',
      title: 'Everyday Essentials',
      subtitle: 'Best seller this week',
      price: 'From \$99.99',
      tagType: BannerTagTypeEnum.hot,
      contentColor: '#FFFFFF',
    ),
  ];

  static final List<Product> products = [
    Product(
      name: 'The Mirac Jiz',
      brand: 'Lisa Robber',
      price: 195.00,
      imageUrl: 'assets/images/banner_4.png',
    ),
    Product(
      name: 'Meriza Kiles',
      brand: 'Gazuna Resika',
      price: 143.45,
      imageUrl: 'assets/images/banner_4.png',
    ),
  ];
}
