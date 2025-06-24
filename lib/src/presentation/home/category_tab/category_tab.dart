import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_category/list_category.dart';
import 'list_category/list_category_controller.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>
    with AutomaticKeepAliveClientMixin<CategoryTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ListCategoryController>()..getData()),
      ],
      child: Container(
        color: context.colorTheme.pageDefault,
        child: ListCategory(),
      ),
    );
  }
}
