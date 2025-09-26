import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User + Rating
        Row(
          children: [
            Text(review.userName, style: SdTextStyle.body14().wSemiBold()),
            const SdHorizontalSpacing(xRatio: 0.5),
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
          ],
        ),
        const SizedBox(height: SdSpacing.s4),

        // Comment
        Text(review.comment, style: SdTextStyle.body14()),

        // Date
        Text(
          SdDateTimeHelper.dateTimeToDDMMYY(review.createdAt),
          style: SdTextStyle.heading12().copyWith(
            color: context.colorTheme.textSubTitle,
          ),
        ),
        if (!isLast) SdVerticalSpacing(),
      ],
    );
  }
}
