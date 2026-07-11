import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/category/data/mock/category_mock.dart';
import 'package:dutuku_e_commerce/src/features/category/data/models/category_model.dart';
import 'package:system_design_flutter/index.dart';

import 'category_remote_data_source.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  const CategoryRemoteDataSourceImpl();

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      await SdHelper.delayLoading();
      return CategoryMock.categories;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
