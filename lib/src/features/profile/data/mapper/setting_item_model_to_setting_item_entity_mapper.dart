import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/models/setting_item_model.dart';
import 'package:dutuku_e_commerce/src/features/profile/domain/entities/setting_item_entity.dart';
import 'package:flutter/material.dart';

class SettingItemModelToSettingItemEntityMapper {
  const SettingItemModelToSettingItemEntityMapper._();

  static SettingItemEntity toEntity(SettingItemModel model) {
    return SettingItemEntity(
      name: model.name ?? '',
      iconData: model.iconData ?? Icons.circle,
      itemType: model.itemType ?? SettingItemType.editProfile,
      iconColor: model.iconColor ?? Colors.grey,
      nameColor: model.nameColor,
    );
  }
}
