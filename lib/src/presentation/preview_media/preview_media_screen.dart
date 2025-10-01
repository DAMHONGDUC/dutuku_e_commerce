import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'preview_media_args.dart';

class PreviewMediaScreen extends StatelessWidget {
  const PreviewMediaScreen({super.key, required this.args});
  final PreviewMediaArgs args;

  @override
  Widget build(BuildContext context) {
    return SdPreviewMediaView(items: args.items);
  }
}
