import 'package:dutuku_e_commerce/src/domain/domain.dart';

final kMockProductPath = 'assets/images/product/';

class ProductMock {
  static final totalRecord = 500;

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
}
