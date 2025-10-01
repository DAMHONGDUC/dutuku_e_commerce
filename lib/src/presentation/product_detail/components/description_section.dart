part of '../product_detail_screen.dart';

class DescriptionSection extends StatefulWidget {
  final String description;

  const DescriptionSection({super.key, required this.description});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: SdTextStyle.heading18()),
          SdVerticalSpacing(),
          AnimatedCrossFade(
            firstChild: _buildCollapsedDescription(),
            secondChild: _buildExpandedDescription(),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: SdTextStyle.body14(),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = true;
            });
          },
          child: Text(
            'Read More',
            style: SdTextStyle.heading12().wColor(AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.description, style: SdTextStyle.body14()),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = false;
            });
          },
          child: Text(
            'Read Less',
            style: SdTextStyle.heading12().wColor(AppColors.primary),
          ),
        ),
      ],
    );
  }
}
