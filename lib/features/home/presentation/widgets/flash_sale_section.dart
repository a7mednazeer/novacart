import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../../generated/l10n/app_localizations.dart';
import 'countdown_timer.dart';
import '../../../../core/widgets/product_horizontal_list.dart';
import 'section_header.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({
    super.key,
    required this.products,
    required this.onProductTap,
    this.onFavoriteToggle,
    this.favoriteIds = const {},
  });

  final List<ProductEntity> products;
  final ValueChanged<ProductEntity> onProductTap;
  final ValueChanged<ProductEntity>? onFavoriteToggle;
  final Set<String> favoriteIds;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    final earliestEnd = products
        .map((p) => p.flashSaleEndsAt)
        .whereType<DateTime>()
        .fold<DateTime?>(null, (soonest, end) {
      if (soonest == null) return end;
      return end.isBefore(soonest) ? end : soonest;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: AppLocalizations.of(context).flashSaleTitle,
          trailing: earliestEnd != null
              ? CountdownTimer(endTime: earliestEnd)
              : null,
        ),
        const SizedBox(height: AppSpacing.sm),
        ProductHorizontalList(
          products: products,
          onProductTap: onProductTap,
          onFavoriteToggle: onFavoriteToggle,
          favoriteIds: favoriteIds,
        ),
      ],
    );
  }
}
