import 'package:dutuku_e_commerce/src/domain/domain.dart';

final kMockCategoryPath = 'assets/images/category/';

class CategoryMock {
  static final List<Category> categories = [
    Category(
      id: 0,
      name: 'Luxury',
      imageUrl: '${kMockCategoryPath}c0.png',
      numOfProduct: 120,
    ),
    Category(
      id: 1,
      name: 'Sneakers',
      imageUrl: '${kMockCategoryPath}c1.png',
      numOfProduct: 120,
    ),
    Category(
      id: 2,
      name: 'Toys',
      imageUrl: '${kMockCategoryPath}c2.png',
      numOfProduct: 150,
    ),
    Category(
      id: 3,
      name: 'Pre-loved Luxury',
      imageUrl: '${kMockCategoryPath}c3.png',
      numOfProduct: 150,
    ),
    Category(
      id: 4,
      name: 'Cards',
      imageUrl: '${kMockCategoryPath}c4.png',
      numOfProduct: 90,
    ),
    Category(
      id: 5,
      name: 'P&A',
      imageUrl: '${kMockCategoryPath}c5.png',
      numOfProduct: 70,
    ),
  ];
}
