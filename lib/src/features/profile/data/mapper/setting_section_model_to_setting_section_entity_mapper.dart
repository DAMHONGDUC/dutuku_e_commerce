import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/mapper/setting_item_model_to_setting_item_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/models/setting_section_model.dart';
import 'package:dutuku_e_commerce/src/features/profile/domain/entities/setting_section_entity.dart';

class SettingSectionModelToSettingSectionEntityMapper {
  const SettingSectionModelToSettingSectionEntityMapper._();

  static SettingSectionEntity toEntity(SettingSectionModel model) {
    return SettingSectionEntity(
      name: model.name ?? '',
      sectionType: model.sectionType ?? SettingSectionType.general,
      items:
          model.items
              ?.map(SettingItemModelToSettingItemEntityMapper.toEntity)
              .toList() ??
          [],
    );
  }
}
