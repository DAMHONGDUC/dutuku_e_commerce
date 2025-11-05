import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/setting/setting_item_entity.dart';

class SettingSectionEntity {
  final String name;
  final SettingSectionType sectionType;
  final List<SettingItemEntity> items;

  SettingSectionEntity({
    required this.name,
    required this.items,
    required this.sectionType,
  });
}
