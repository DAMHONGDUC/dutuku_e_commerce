import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'home_tab/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(tabController: _tabController),
      backgroundColor: context.appThemeColor.bgPrimary,
      body: TabBarView(
        controller: _tabController,
        children: [HomeTab(), _CategoryTab()],
      ),
    );
  }
}

class _CategoryTab extends StatelessWidget {
  const _CategoryTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Category Tab Content', style: SdTextStyle.body18()),
    );
  }
}
