import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_avt.png'),
              radius: SdSpacing.s20,
            ),
            SdHorizontalSpacing(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, Duc', style: context.textTheme.heading12.wBold()),
                Text(
                  'Let go shopping',
                  style: context.textTheme.heading10.wColor(
                    context.colorTheme.textSubTitle,
                  ),
                ),
              ],
            ),
          ],
        ),

        Row(
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.search.fullPath);
              },
              icon: SdIcon(
                iconData: Ionicons.cart_outline,
                color: context.colorTheme.iconDefault,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SdIcon(
                iconData: Ionicons.notifications_outline,
                color: context.colorTheme.iconDefault,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
