import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

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
        children: const [_HomeTab(), _CategoryTab()],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final ScrollController? scrollController;

  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text('Item $index', style: SdTextStyle.body18()),
          ),
        );
      },
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
