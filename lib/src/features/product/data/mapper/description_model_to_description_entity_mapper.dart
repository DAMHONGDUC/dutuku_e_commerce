import 'package:dutuku_e_commerce/src/features/product/data/models/description_model.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/description.dart';

class DescriptionModelToDescriptionEntityMapper {
  const DescriptionModelToDescriptionEntityMapper._();

  static Description toEntity(DescriptionModel model) {
    return Description(
      content: model.content ?? '',
      images: model.images ?? [],
    );
  }
}
