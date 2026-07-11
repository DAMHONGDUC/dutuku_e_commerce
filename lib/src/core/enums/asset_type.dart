enum AssetType { image, video, unknow }

extension AssetTypeExtension on AssetType {
  static AssetType fromString(String? value) {
    return AssetType.values.firstWhere(
      (e) => e.name == value?.toLowerCase(),
      orElse: () => AssetType.unknow,
    );
  }
}
