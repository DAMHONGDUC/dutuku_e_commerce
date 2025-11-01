import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:system_design_flutter/index.dart';

class Helper {
  static getSdButtonColorConfig(BuildContext context) =>
      SdButtonColorConfig.init().copyWith(
        primaryBgColor: context.colorTheme.primary,
        secondaryTextColor: context.colorTheme.textDefault,
        secondaryBorderColor: context.colorTheme.borderDefault,
      );
}
