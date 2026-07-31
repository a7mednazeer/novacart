import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

/// Builds one [TableRow] for the comparison table: a label cell plus
/// one cell per product, built by [cellBuilder]. Kept generic so both
/// simple text attributes and richer cells (color swatches) can share
/// the same row/label styling.
TableRow buildComparisonRow<T>({
  required String label,
  required List<T> values,
  required Widget Function(T value) cellBuilder,
  bool shaded = false,
}) {
  return TableRow(
    decoration: BoxDecoration(
      color: shaded ? AppColors.shimmerBaseLight.withValues(alpha: 0.4) : null,
    ),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Text(
          label,
          style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      ...values.map(
        (value) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: cellBuilder(value),
        ),
      ),
    ],
  );
}
