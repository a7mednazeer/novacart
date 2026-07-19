import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class ExpandableDescription extends StatefulWidget {
  const ExpandableDescription({super.key, required this.text});
  final String text;

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Text(
            widget.text,
            maxLines: _expanded ? null : 3,
            overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              _expanded ? 'Show Less' : 'Read More',
              style: AppTextStyles.bodySmall(color: AppColors.primary)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
