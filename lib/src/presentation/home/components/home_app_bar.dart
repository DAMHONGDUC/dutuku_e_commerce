import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
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
      bottom: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: SdSpacing.s2, color: AppColors.primary),
          insets: EdgeInsets.symmetric(horizontal: SdSpacing.s32),
        ),
        dividerColor: SdColors.transparent,
        labelColor: AppColors.primary,
        unselectedLabelColor: context.colorTheme.textSubTitle,
        labelStyle: context.textTheme.heading14,
        unselectedLabelStyle: context.textTheme.heading14,
        tabs: const [
          Tab(text: 'Dashboard'),
          Tab(text: 'Category'),
        ],
      ),
      noElevation: true,
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.search.fullPath);
          },
          icon: SdIcon(
            iconData: Ionicons.search,
            color: context.colorTheme.iconPrimary,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SdIcon(
            iconData: Ionicons.notifications_outline,
            color: context.colorTheme.iconPrimary,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}
