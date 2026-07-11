import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/banner/data/models/banner_model.dart';
import 'package:dutuku_e_commerce/src/features/banner/domain/entities/banner_item.dart';

class BannerModelToBannerItemMapper {
  const BannerModelToBannerItemMapper._();

  static BannerItem toEntity(BannerModel model) {
    return BannerItem(
      id: model.id ?? 0,
      imageUrl: model.imageUrl ?? '',
      tag: model.tag ?? '',
      tagType: model.tagType ?? BannerTagType.defaultTag,
      title: model.title ?? '',
      subtitle: model.subtitle ?? '',
      price: model.price ?? '',
      contentColor: model.contentColor ?? '',
    );
  }
}
