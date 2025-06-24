import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

final kMockBannerPath = 'assets/images/banner/';
final kMockProductPath = 'assets/images/product/';
final kMockCategoryPath = 'assets/images/category/';

class MockData {
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

  static final List<Product> products = [
    Product(
      id: 1,
      name: 'Margaux Leather',
      brand: 'Handbag',
      price: 195.00,
      imageUrl: '${kMockProductPath}p1_1.png',
      productColors: [
        ProductColor(
          colorCode: '#2C2C2C',
          colorName: 'Onyx',
          imageUrl: '${kMockProductPath}p1_1.png',
        ),
        ProductColor(
          colorCode: '#DAA520',
          colorName: 'Orche',
          imageUrl: '${kMockProductPath}p1_2.png',
        ),
        ProductColor(
          colorCode: '#000000',
          colorName: 'Noir',
          imageUrl: '${kMockProductPath}p1_3.png',
        ),
        ProductColor(
          colorCode: '#8B4513',
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
          colorCode: '#2C2C2C',
          colorName: 'Onyx',
          imageUrl: '${kMockProductPath}p2_1.png',
        ),
        ProductColor(
          colorCode: '#DAA520',
          colorName: 'Orche',
          imageUrl: '${kMockProductPath}p2_2.png',
        ),
        ProductColor(
          colorCode: '#000000',
          colorName: 'Noir',
          imageUrl: '${kMockProductPath}p2_3.png',
        ),
        ProductColor(
          colorCode: '#8B4513',
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
          colorCode: '#2C2C2C',
          colorName: 'Onyx',
          imageUrl: '${kMockProductPath}p4_3.png',
        ),
        ProductColor(
          colorCode: '#800020',
          colorName: 'Burgundy',
          imageUrl: '${kMockProductPath}p4_2.png',
        ),
        ProductColor(
          colorCode: '#1F2937',
          colorName: 'Navy',
          imageUrl: '${kMockProductPath}p4_3.png',
        ),
        ProductColor(
          colorCode: '#9CA3AF',
          colorName: 'Ash',
          imageUrl: '${kMockProductPath}p4_4.png',
        ),
        ProductColor(
          colorCode: '#F5F5DC',
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
          colorCode: '#8B4513',
          colorName: 'Brown',
          imageUrl: '${kMockProductPath}p6_1.png',
        ),
        ProductColor(
          colorCode: '#D2B48C',
          colorName: 'Light Brown',
          imageUrl: '${kMockProductPath}p6_2.png',
        ),
      ],
    ),
  ];

  static final List<Category> categories = [
    Category(
      id: 0,
      name: 'Sales',
      imageUrl: '${kMockCategoryPath}c0.png',
      numOfProduct: 120,
    ),
    Category(
      id: 1,
      name: 'New Arrivals',
      imageUrl: '${kMockCategoryPath}c1.png',
      numOfProduct: 120,
    ),
    Category(
      id: 2,
      name: 'Men',
      imageUrl: '${kMockCategoryPath}c2.png',
      numOfProduct: 150,
    ),
    Category(
      id: 3,
      name: 'Women',
      imageUrl: '${kMockCategoryPath}c3.png',
      numOfProduct: 150,
    ),
    Category(
      id: 4,
      name: 'T-shirts',
      imageUrl: '${kMockCategoryPath}c4.png',
      numOfProduct: 90,
    ),
    Category(
      id: 5,
      name: 'Polo Shirts',
      imageUrl: '${kMockCategoryPath}c5.png',
      numOfProduct: 70,
    ),
  ];
}
