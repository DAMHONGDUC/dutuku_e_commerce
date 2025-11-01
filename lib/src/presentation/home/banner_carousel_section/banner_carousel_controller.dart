import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banner_carousel_state.dart';

class BannerCarouselController extends Cubit<BannerCarouselState> {
  final GetBannersUsecase _getBannersUsecase;

  BannerCarouselController(this._getBannersUsecase)
    : super(BannerCarouselInitial());

  Future getData() async {
    emit(BannerCarouselLoading());

    final result = await _getBannersUsecase.call(NoParams());

    result.fold(
      (failure) {
        // TODO: handle fail
      },
      (r) {
        emit(BannerCarouselSuccess(banners: r));
      },
    );
  }
}
