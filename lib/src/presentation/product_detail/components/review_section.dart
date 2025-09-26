part of '../product_detail_screen.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final limitedReviews = product.reviewComments.take(2).toList();
    final reviewAvailable = product.reviewComments.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: SdSpacing.s12),
      color: context.colorTheme.surfaceDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SdSpacing.s16),
            child: Row(
              children: [
                Row(
                  children: [
                    const SdIcon(iconData: Icons.star, color: Colors.amber),
                    const SdHorizontalSpacing(xRatio: 0.4),
                    Text(
                      product.averageRating.toStringAsFixed(1),
                      style: SdTextStyle.heading16(),
                    ),
                    const SdHorizontalSpacing(xRatio: 0.5),
                    Text(
                      ' (${product.reviewComments.length} Reviews)',
                      style: SdTextStyle.body14().copyWith(
                        color: context.colorTheme.textSubTitle,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                if (reviewAvailable)
                  GestureDetector(
                    onTap: () {
                      // TODO: navigate to review screen
                    },
                    child: Text(
                      "View All",
                      style: context.textTheme.heading12.wColor(
                        AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (reviewAvailable) ...[
            SdVerticalSpacing(value: SdSpacing.s4),
            SdDivider(),
            SdVerticalSpacing(value: SdSpacing.s4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SdSpacing.s16),
              child: Column(
                children: [
                  ...limitedReviews.mapIndexed(
                    (index, review) => ReviewItem(
                      review: review,
                      isLast: index == limitedReviews.length - 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review, required this.isLast});

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
            Text(
              review.userName,
              style: SdTextStyle.body14().copyWith(fontWeight: FontWeight.w600),
            ),
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
