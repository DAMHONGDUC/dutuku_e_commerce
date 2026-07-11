import 'package:dutuku_e_commerce/src/features/banner/data/data_sources/banner_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/banner/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/data_sources/notification_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/notification/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/profile/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockBannerRepository extends Mock implements BannerRepository {}

class MockCategoryRepository extends Mock implements CategoryRepository {}

class MockProductRepository extends Mock implements ProductRepository {}

class MockOrderRepository extends Mock implements OrderRepository {}

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockNotificationRepository extends Mock
    implements NotificationRepository {}

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

class MockCategoryRemoteDataSource extends Mock
    implements CategoryRemoteDataSource {}

class MockBannerRemoteDataSource extends Mock
    implements BannerRemoteDataSource {}

class MockNotificationRemoteDataSource extends Mock
    implements NotificationRemoteDataSource {}

class MockOrderRemoteDataSource extends Mock implements OrderRemoteDataSource {}

class MockProfileRemoteDataSource extends Mock
    implements ProfileRemoteDataSource {}
