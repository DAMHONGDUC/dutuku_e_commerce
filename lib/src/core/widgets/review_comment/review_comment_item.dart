import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

const _kAssetsReviewSize = 100.0;

class ReviewCommentItem extends StatelessWidget {
  const ReviewCommentItem({
    super.key,
    required this.review,
    required this.isLast,
  });

  final ReviewComment review;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final limitedAssets = review.assets.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // User
            Text(review.userName, style: SdTextStyle.body14().wSemiBold()),
            const SdHorizontalSpacing(xRatio: 0.5),
            // Rating
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < review.rating.round()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                ),
              ),
            ),
            Spacer(),
            // Date
            Text(
              SdDateTimeHelper.dateTimeToDDMMYY(review.createdAt),
              style: SdTextStyle.heading12().copyWith(
                color: context.colorTheme.textSubTitle,
              ),
            ),
          ],
        ),
        const SdVerticalSpacing(xRatio: 0.25),

        // Comment
        Text(review.comment, style: SdTextStyle.body14()),

        const SdVerticalSpacing(xRatio: 0.5),

        // Assets (max 2)
        if (limitedAssets.isNotEmpty) ...[
          const SizedBox(height: SdSpacing.s4),
          SizedBox(
            height: _kAssetsReviewSize,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: limitedAssets.length,
              separatorBuilder: (_, __) => SdHorizontalSpacing(),
              itemBuilder: (context, index) {
                final asset = limitedAssets[index];
                if (asset.type == AssetType.image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(SdSpacing.s8),
                    child: SdImage(
                      imagePath: asset.url,
                      width: _kAssetsReviewSize,
                      height: _kAssetsReviewSize,
                    ),
                  );
                } else {
                  return SdVideoPlaceHolder(
                    videoPath: asset.url,
                    width: _kAssetsReviewSize,
                    height: _kAssetsReviewSize,
                  );
                }
              },
            ),
          ),
        ],

        if (!isLast) SdVerticalSpacing(),
      ],
    );
  }
}
