part of 'banner_carousel_controller.dart';

sealed class BannerCarouselState extends Equatable {
  const BannerCarouselState();

  @override
  List<Object> get props => [];
}

final class BannerCarouselInitial extends BannerCarouselState {}

final class BannerCarouselLoading extends BannerCarouselState {}

final class BannerCarouselSuccess extends BannerCarouselState {
  final List<BannerItem> banners;

  const BannerCarouselSuccess({required this.banners});
}
