import 'package:system_design_flutter/index.dart';

class PreviewMediaArgs {
  final List<SdPreviewMediaConfig> items;

  PreviewMediaArgs({required this.items});

  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }

  factory PreviewMediaArgs.fromJson(Map<String, dynamic> json) {
    return PreviewMediaArgs(
      items: (json['items'] as List)
          .map((e) => SdPreviewMediaConfig.fromJson(e))
          .toList(),
    );
  }
}
