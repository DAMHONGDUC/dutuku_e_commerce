import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:system_design_flutter/index.dart';

part 'banner_carousel_state.dart';

@injectable
class BannerCarouselController extends Cubit<BannerCarouselState> {
  BannerCarouselController() : super(BannerCarouselInitial());

  Future getData() async {
    emit(BannerCarouselLoading());

    await SdHelper.delayLoading();

    emit(BannerCarouselSuccess(banners: MockData.banners));
  }
}
