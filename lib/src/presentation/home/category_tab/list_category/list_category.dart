import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/index.dart';

import 'list_category_controller.dart';

final kImageWidth = 100.sp;

class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListCategoryController, ListCategoryState>(
      listener: (context, state) {
        // TODO: implement listener if need
      },
      buildWhen: (previous, current) =>
          current is ListCategoryLoading || current is ListCategoryLoaded,
      builder: (context, state) {
        if (state is ListCategoryLoading) {
          return _ListCategorySkeleton();
        } else if (state is ListCategoryLoaded) {
          return ListView.separated(
            padding: EdgeInsets.all(SdSpacing.s12),
            itemCount: state.categories.length,
            separatorBuilder: (_, __) => SdVerticalSpacing(),
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return _CategoryCard(category: category, isEven: index % 2 == 0);
            },
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;
  final bool isEven;

  const _CategoryCard({required this.category, required this.isEven});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffebebeb),
        borderRadius: BorderRadius.circular(SdSpacing.s12),
        boxShadow: [
          BoxShadow(
            color: SdColors.black.withValues(alpha: 0.05),
            blurRadius: SdSpacing.s12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: isEven
          ? Row(
              children: [
                _Content(
                  name: category.name,
                  numOfProduct: category.numOfProduct,
                  alignment: CrossAxisAlignment.start,
                ),
                const Spacer(),
                SdImage(imagePath: category.imageUrl, width: kImageWidth),
                SdHorizontalSpacing(),
              ],
            )
          : Row(
              children: [
                SdHorizontalSpacing(),
                SdImage(imagePath: category.imageUrl, width: kImageWidth),
                const Spacer(),
                _Content(
                  name: category.name,
                  numOfProduct: category.numOfProduct,
                  alignment: CrossAxisAlignment.end,
                ),
              ],
            ),
    );
  }
}

class _Content extends StatelessWidget {
  final String name;
  final int numOfProduct;
  final CrossAxisAlignment alignment;

  const _Content({
    required this.name,
    required this.numOfProduct,
    this.alignment = CrossAxisAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SdSpacing.s20),
      child: Column(
        crossAxisAlignment: alignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: context.textTheme.heading14),
          SdVerticalSpacing(xRatio: 0.25),
          Text('$numOfProduct Product', style: context.textTheme.body12),
        ],
      ),
    );
  }
}

class _ListCategorySkeleton extends StatelessWidget {
  const _ListCategorySkeleton();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(SdSpacing.s12),
            itemCount: 5,
            separatorBuilder: (_, __) => SdVerticalSpacing(),
            itemBuilder: (context, index) {
              return SdSkeleton(height: 140.sp, width: double.infinity);
            },
          ),
        ],
      ),
    );
  }
}
