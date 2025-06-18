import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const HomeAppBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SdAppBar(
      showBackButton: false,
      titleWidget: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_avt.png'),
            radius: SdSpacing.s20,
          ),
          SdHorizontalSpacing(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Duc', style: SdTextStyle.heading14()),
              Text('Let go shopping', style: SdTextStyle.body12()),
            ],
          ),
        ],
      ),
      bottom: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: SdSpacing.s2, color: AppColors.primary),
          insets: EdgeInsets.symmetric(horizontal: SdSpacing.s32),
        ),
        dividerColor: Colors.transparent,
        tabs: [
          Tab(child: Text('Home', style: SdTextStyle.heading12())),
          Tab(child: Text('Category', style: SdTextStyle.heading12())),
        ],
      ),
      noElevation: true,
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.search.fullPath);
          },
          icon: SdIcon(iconData: Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: SdIcon(iconData: Icons.notifications),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}
