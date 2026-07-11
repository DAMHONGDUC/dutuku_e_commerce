import 'package:dutuku_e_commerce/src/features/category/data/models/category_model.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/domain.dart';

class CategoryModelToCategoryEntityMapper {
  const CategoryModelToCategoryEntityMapper._();

  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id ?? 0,
      name: model.name ?? '',
      imageUrl: model.imageUrl ?? '',
      numOfProduct: model.numOfProduct ?? 0,
    );
  }
}
