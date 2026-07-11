import 'package:dutuku_e_commerce/src/features/banner/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/notification/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/profile/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBannersUsecase extends Mock implements GetBannersUsecase {}

class MockGetCategoriesUsecase extends Mock implements GetCategoriesUsecase {}

class MockGetNotificationsUsecase extends Mock
    implements GetNotificationsUsecase {}

class MockGetProfileSettingsUsecase extends Mock
    implements GetProfileSettingsUsecase {}

class MockGetRecommendProductUsecase extends Mock
    implements GetRecommendProductUsecase {}

class MockSearchProductsUsecase extends Mock implements SearchProductsUsecase {}

class MockGetMyOrderUsecase extends Mock implements GetMyOrderUsecase {}

class MockGetOrderDetailUsecase extends Mock implements GetOrderDetailUsecase {}

class MockGetProductDetailUsecase extends Mock
    implements GetProductDetailUsecase {}

class MockGetRelatedProductUsecase extends Mock
    implements GetRelatedProductUsecase {}
