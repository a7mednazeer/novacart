import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/l10n/app_localizations.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSelect,
  });

  final List<String> sizes;
  final String? selectedSize;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    if (sizes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).sizeLabel,
          style: AppTextStyles.h3(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: sizes.map((size) {
            final selected = size == selectedSize;
            return GestureDetector(
              onTap: () => onSelect(size),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? AppColors.primary : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? AppColors.primary
                        : Theme.of(context).dividerColor,
                    width: 1.4,
                  ),
                ),
                child: Text(
                  size,
                  style: AppTextStyles.bodyMedium(
                    color: selected
                        ? Colors.white
                        : Theme.of(context).colorScheme.onSurface,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
