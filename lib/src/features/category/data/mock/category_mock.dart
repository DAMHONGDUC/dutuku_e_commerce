import 'package:dutuku_e_commerce/src/features/category/data/models/category_model.dart';

final kMockCategoryPath = 'assets/images/category/';

class CategoryMock {
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: 0,
      name: 'Luxury',
      imageUrl: '${kMockCategoryPath}c0.png',
      numOfProduct: 120,
    ),
    CategoryModel(
      id: 1,
      name: 'Sneakers',
      imageUrl: '${kMockCategoryPath}c1.png',
      numOfProduct: 120,
    ),
    CategoryModel(
      id: 2,
      name: 'Toys',
      imageUrl: '${kMockCategoryPath}c2.png',
      numOfProduct: 150,
    ),
    CategoryModel(
      id: 3,
      name: 'Pre-loved Luxury',
      imageUrl: '${kMockCategoryPath}c3.png',
      numOfProduct: 150,
    ),
    CategoryModel(
      id: 4,
      name: 'Cards',
      imageUrl: '${kMockCategoryPath}c4.png',
      numOfProduct: 90,
    ),
    CategoryModel(
      id: 5,
      name: 'P&A',
      imageUrl: '${kMockCategoryPath}c5.png',
      numOfProduct: 70,
    ),
  ];
}
