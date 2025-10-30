import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/router/my_order_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

final _kIconPadding = SdSpacing.s6;
final _kTitleSpacing = SdSpacing.s12;

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.surfaceDefault,
      appBar: SdAppBar(
        titleText: 'My order',
        showBackButton: false,
        titleSpacing: _kTitleSpacing,
        actionPadding: EdgeInsets.only(right: _kTitleSpacing - _kIconPadding),
        actions: [
          SdIconButton(
            padding: EdgeInsets.all(_kIconPadding),
            onPressed: () {},
            icon: SdIcon(
              iconData: Ionicons.search,
              color: context.colorTheme.primary,
            ),
          ),
          SdHorizontalSpacing(xRatio: 0.5),
          SdIconButton(
            padding: EdgeInsets.all(_kIconPadding),
            onPressed: () {},
            icon: SdIcon(
              iconData: Ionicons.chatbubble_ellipses_outline,
              color: context.colorTheme.primary,
            ),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Text('My Order Content'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(MyOrderRoutes.myOrderDetail.fullPath);
              },
              child: Text('Go to my order detail screen'),
            ),
          ],
        ),
      ),
    );
  }
}
