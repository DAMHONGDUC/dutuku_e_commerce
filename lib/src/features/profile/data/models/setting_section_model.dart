import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/models/setting_item_model.dart';

class SettingSectionModel {
  final String? name;
  final SettingSectionType? sectionType;
  final List<SettingItemModel>? items;

  const SettingSectionModel({this.name, this.sectionType, this.items});
}
