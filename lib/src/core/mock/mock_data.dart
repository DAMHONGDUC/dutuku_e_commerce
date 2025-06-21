import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

final kMockBannerPath = 'assets/images/banner/';
final kMockProductPath = 'assets/images/product/';

class MockData {
  static final List<BannerItem> banners = [
    BannerItem(
      imageUrl: '${kMockBannerPath}banner_1.png',
      tag: '24% OFF',
      title: 'Shipping Today',
      subtitle: 'On bag purchases',
      price: '\$279.99',
      tagType: BannerTagTypeEnum.discount,
      contentColor: '#000000',
    ),
    BannerItem(
      imageUrl: '${kMockBannerPath}banner_2.png',
      tag: 'New',
      title: 'Leather Tote',
      subtitle: 'Elegant and spacious',
      price: '\$249.99',
      tagType: BannerTagTypeEnum.newArrival,
      contentColor: '#000000',
    ),
    BannerItem(
      imageUrl: '${kMockBannerPath}banner_3.png',
      tag: 'Limited',
      title: 'Mini Shoulder Bag',
      subtitle: 'Stylish and compact',
      price: '\$189.00',
      tagType: BannerTagTypeEnum.limited,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      imageUrl: '${kMockBannerPath}banner_4.png',
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
      id: 1,
      name: 'Margaux Leather',
      brand: 'Handbag',
      price: 195.00,
      imageUrl: '${kMockProductPath}p1_1.png',
      productColors: [
        ProductColor(
          colorName: 'Onyx',
          imageUrl: '${kMockProductPath}p1_1.png',
        ),
        ProductColor(
          colorName: 'Orche',
          imageUrl: '${kMockProductPath}p1_2.png',
        ),
        ProductColor(
          colorName: 'Noir',
          imageUrl: '${kMockProductPath}p1_3.png',
        ),
        ProductColor(
          colorName: 'Mocha',
          imageUrl: '${kMockProductPath}p1_4.png',
        ),
      ],
    ),
    Product(
      id: 2,
      name: 'Vancouver Crossbody',
      brand: 'Bag',
      price: 143.45,
      imageUrl: '${kMockProductPath}p2_2.png',
      productColors: [
        ProductColor(
          colorName: 'Onyx',
          imageUrl: '${kMockProductPath}p2_1.png',
        ),
        ProductColor(
          colorName: 'Orche',
          imageUrl: '${kMockProductPath}p2_2.png',
        ),
        ProductColor(
          colorName: 'Noir',
          imageUrl: '${kMockProductPath}p2_3.png',
        ),
        ProductColor(
          colorName: 'Mocha',
          imageUrl: '${kMockProductPath}p2_4.png',
        ),
      ],
    ),
    Product(
      id: 3,
      name: 'Shoulder Bag Beach',
      brand: 'Tote Bag Straw bags',
      price: 195.00,
      imageUrl: '${kMockProductPath}p3_1.png',
    ),
    Product(
      id: 4,
      name: 'Everyday Leather',
      brand: 'Bag',
      price: 143.45,
      imageUrl: '${kMockProductPath}p4_3.png',
      productColors: [
        ProductColor(
          colorName: 'Onyx',
          imageUrl: '${kMockProductPath}p4_3.png',
        ),
        ProductColor(
          colorName: 'Burgundy',
          imageUrl: '${kMockProductPath}p4_2.png',
        ),
        ProductColor(
          colorName: 'Navy',
          imageUrl: '${kMockProductPath}p4_3.png',
        ),
        ProductColor(colorName: 'Ash', imageUrl: '${kMockProductPath}p4_4.png'),
        ProductColor(
          colorName: 'Cream',
          imageUrl: '${kMockProductPath}p4_5.png',
        ),
      ],
    ),
    Product(
      id: 5,
      name: 'Retro Kaleidoscope Print Knit V-neck Pullover',
      brand: 'Sweater',
      price: 195.00,
      imageUrl: '${kMockProductPath}p5_1.png',
    ),
    Product(
      id: 6,
      name: 'Melanie Suede',
      brand: 'Bag',
      price: 143.45,
      imageUrl: '${kMockProductPath}p6_1.png',
      productColors: [
        ProductColor(
          colorName: 'Brown',
          imageUrl: '${kMockProductPath}p6_1.png',
        ),
        ProductColor(
          colorName: 'Light Brown',
          imageUrl: '${kMockProductPath}p6_2.png',
        ),
      ],
    ),
  ];
}
