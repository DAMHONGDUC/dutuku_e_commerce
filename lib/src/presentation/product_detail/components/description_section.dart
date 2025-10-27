part of '../product_detail_screen.dart';

class DescriptionSection extends StatefulWidget {
  final Description description;
  const DescriptionSection({super.key, required this.description});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SdHelper.getPageDefaultPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: SdTextStyle.heading18()),
          SdVerticalSpacing(),
          AnimatedCrossFade(
            firstChild: _CollapsedDescription(
              onClickReadMore: () {
                setState(() {
                  isExpanded = true;
                });
              },
              description: widget.description.content,
            ),
            secondChild: _ExpandedDescription(
              onClickReadLess: () {
                setState(() {
                  isExpanded = false;
                });
              },
              description: widget.description,
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

class _ExpandedDescription extends StatelessWidget {
  const _ExpandedDescription({
    required this.onClickReadLess,
    required this.description,
  });
  final void Function() onClickReadLess;
  final Description description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(description.content, style: SdTextStyle.body14()),
        SdVerticalSpacing(),
        ...description.images
            .take(2)
            .map(
              (e) => SdImage(
                imagePath: e,
                width: _kImgHeight / 1.5,
                height: _kImgHeight / 1.5,
              ),
            ),
        SdVerticalSpacing(),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: onClickReadLess,
            child: Text(
              'Read Less',
              style: SdTextStyle.heading12().wColor(context.colorTheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}

class _CollapsedDescription extends StatelessWidget {
  const _CollapsedDescription({
    required this.onClickReadMore,
    required this.description,
  });
  final void Function() onClickReadMore;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: SdTextStyle.body14(),
        ),
        SdVerticalSpacing(),
        GestureDetector(
          onTap: onClickReadMore,
          child: Text(
            'Read More',
            style: SdTextStyle.heading12().wColor(AppColors.primary),
          ),
        ),
      ],
    );
  }
}
