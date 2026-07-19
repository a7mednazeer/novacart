import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/color_utils.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onSelect,
  });

  final List<String> colors;
  final String? selectedColor;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    if (colors.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: AppTextStyles.h3(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: colors.map((hex) {
            final selected = hex == selectedColor;
            return Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: GestureDetector(
                onTap: () => onSelect(hex),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: hexToColor(hex),
                    border: Border.all(
                      color: selected ? AppColors.primary : Colors.transparent,
                      width: 2.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: selected
                      ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
