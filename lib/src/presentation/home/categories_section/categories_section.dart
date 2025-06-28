import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/index.dart';

import 'categories_section_controller.dart';

final kImageWidth = 40.sp;
final kCardWidth = 80.sp;
final kCardHeight = 80.sp;

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesController>()..getData(),
      child: const _CategoriesView(),
    );
  }
}

class _CategoriesView extends StatefulWidget {
  const _CategoriesView();

  @override
  State<_CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<_CategoriesView> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollProgress);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollProgress() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;

      if (maxScroll > 0) {
        setState(() {
          _scrollProgress = (currentScroll / maxScroll).clamp(0.0, 1.0);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesController, CategoriesState>(
      listener: (context, state) {
        // TODO: implement listener if needed
      },
      buildWhen: (previous, current) =>
          current is CategoriesLoading || current is CategoriesLoaded,
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const _ListCategorySkeleton();
        } else if (state is CategoriesLoaded) {
          return Column(
            children: [
              SizedBox(
                height: kCardHeight,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SdHorizontalSpacing();
                  },
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return _CategoryCard(category: category);
                  },
                ),
              ),
              SdVerticalSpacing(),
              _ScrollIndicator(scrollProgress: _scrollProgress),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kCardWidth,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(SdSpacing.s8),
        boxShadow: [
          BoxShadow(
            color: SdColors.black.withValues(alpha: 0.05),
            blurRadius: SdSpacing.s8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(SdSpacing.s8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SdImage(
              imagePath: category.imageUrl,
              width: kImageWidth,
              height: kImageWidth,
            ),
            SdVerticalSpacing(xRatio: 0.5),
            Text(
              category.name,
              style: context.textTheme.body10,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _ScrollIndicator extends StatelessWidget {
  final double scrollProgress;

  const _ScrollIndicator({required this.scrollProgress});

  @override
  Widget build(BuildContext context) {
    final indicatorWidth = 60.sp;
    final thumbWidth = 16.sp;

    return Container(
      width: indicatorWidth,
      height: SdSpacing.s4,
      decoration: BoxDecoration(
        color: context.colorTheme.indicatorBg,
        borderRadius: BorderRadius.circular(2.sp),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            left: scrollProgress * (indicatorWidth - thumbWidth),
            child: Container(
              width: thumbWidth,
              height: SdSpacing.s4,
              decoration: BoxDecoration(
                color: context.colorTheme.indicatorActive,
                borderRadius: BorderRadius.circular(SdSpacing.s2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListCategorySkeleton extends StatelessWidget {
  const _ListCategorySkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kCardHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: SdSpacing.s12),
                child: SdSkeleton(height: 100.sp, width: kCardWidth),
              );
            },
          ),
        ),
        SdVerticalSpacing(),
        Container(
          width: 60.sp,
          height: 4.sp,
          decoration: BoxDecoration(
            color: SdColors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(2.sp),
          ),
        ),
      ],
    );
  }
}
