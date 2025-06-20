// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../presentation/home/dashboard_tab/banner_carousel_section/banner_carousel_controller.dart'
    as _i692;
import '../presentation/home/dashboard_tab/product_grid_section/product_grid_controller.dart'
    as _i684;
import '../presentation/tutorial/tutorial_controller.dart' as _i509;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i692.BannerCarouselController>(
      () => _i692.BannerCarouselController(),
    );
    gh.factory<_i684.ProductGridController>(
      () => _i684.ProductGridController(),
    );
    gh.factory<_i509.TutorialController>(() => _i509.TutorialController());
    return this;
  }
}
