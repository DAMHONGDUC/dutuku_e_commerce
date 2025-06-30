import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'categories_section_controller.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: UIConstants.categoriesListHeight,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SdHorizontalSpacing(xRatio: 2);
                  },
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return CategoryCard(category: category);
                  },
                ),
              ),
              SdVerticalSpacing(value: SdSpacing.s8),
              _ScrollIndicator(scrollProgress: _scrollProgress),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ScrollIndicator extends StatelessWidget {
  final double scrollProgress;

  const _ScrollIndicator({required this.scrollProgress});

  @override
  Widget build(BuildContext context) {
    final indicatorWidth = 60.0;
    final thumbWidth = 16.0;

    return Container(
      width: indicatorWidth,
      height: SdSpacing.s4,
      decoration: BoxDecoration(
        color: context.colorTheme.indicatorBg,
        borderRadius: BorderRadius.circular(2),
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
          height: UIConstants.categoriesListHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SdHorizontalSpacing(xRatio: 2);
            },
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CategoryCardSkeleton();
            },
          ),
        ),
        SdVerticalSpacing(value: SdSpacing.s8),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            color: SdColors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
