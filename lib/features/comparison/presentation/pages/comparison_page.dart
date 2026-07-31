import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/color_utils.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../cubit/comparison_cubit.dart';
import '../widgets/comparison_row.dart';

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compare Products'),
        actions: [
          BlocBuilder<ComparisonCubit, ComparisonState>(
            bloc: sl<ComparisonCubit>(),
            builder: (context, state) {
              if (state.products.isEmpty) return const SizedBox.shrink();
              return TextButton(
                onPressed: () => sl<ComparisonCubit>().clear(),
                child: const Text('Clear All'),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ComparisonCubit, ComparisonState>(
        bloc: sl<ComparisonCubit>(),
        builder: (context, state) {
          final products = state.products;

          if (products.isEmpty) {
            return EmptyStateView(
              icon: Icons.compare_arrows_rounded,
              title: 'Nothing to compare yet',
              message: 'Select 2-3 products from a category to compare them side by side.',
              actionLabel: 'Browse Categories',
              onAction: () => context.go(AppRoutes.categories),
            );
          }

          final textPrimary = Theme.of(context).colorScheme.onSurface;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(color: Theme.of(context).dividerColor),
                ),
                columnWidths: {
                  0: const FixedColumnWidth(96),
                  for (var i = 1; i <= products.length; i++)
                    i: const FixedColumnWidth(150),
                },
                children: [
                  TableRow(
                    children: [
                      const SizedBox(),
                      ...products.map((product) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(AppRadius.md),
                                      child: CachedNetworkImage(
                                        imageUrl: product.imageUrl,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => const ShimmerBox(
                                          width: 120, height: 120, borderRadius: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -8,
                                      right: -8,
                                      child: GestureDetector(
                                        onTap: () => sl<ComparisonCubit>().remove(product.id),
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: AppColors.error,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.close_rounded,
                                              size: 14, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  product.name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodySmall(color: textPrimary)
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  buildComparisonRow<String>(
                    label: 'Brand',
                    values: products.map((p) => p.brand).toList(),
                    cellBuilder: (v) => Text(v, style: AppTextStyles.bodySmall(color: textPrimary)),
                    shaded: true,
                  ),
                  buildComparisonRow<double>(
                    label: 'Price',
                    values: products.map((p) => p.discountedPrice).toList(),
                    cellBuilder: (v) => Text(
                      'EGP ${v.toStringAsFixed(0)}',
                      style: AppTextStyles.bodyMedium(color: AppColors.primary)
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  buildComparisonRow<double>(
                    label: 'Rating',
                    values: products.map((p) => p.rating).toList(),
                    cellBuilder: (v) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star_rounded, size: 14, color: AppColors.rating),
                        const SizedBox(width: 2),
                        Text(v.toStringAsFixed(1), style: AppTextStyles.bodySmall(color: textPrimary)),
                      ],
                    ),
                    shaded: true,
                  ),
                  buildComparisonRow<int>(
                    label: 'Units Sold',
                    values: products.map((p) => p.soldCount).toList(),
                    cellBuilder: (v) => Text('$v+', style: AppTextStyles.bodySmall(color: textPrimary)),
                  ),
                  buildComparisonRow<String>(
                    label: 'Category',
                    values: products.map((p) => p.category).toList(),
                    cellBuilder: (v) => Text(v, style: AppTextStyles.bodySmall(color: textPrimary)),
                    shaded: true,
                  ),
                  buildComparisonRow<List<String>>(
                    label: 'Colors',
                    values: products.map((p) => p.colors).toList(),
                    cellBuilder: (colors) => colors.isEmpty
                        ? Text('—', style: AppTextStyles.bodySmall(color: AppColors.textMutedLight))
                        : Wrap(
                            spacing: 4,
                            children: colors
                                .map((hex) => Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: hexToColor(hex),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Theme.of(context).dividerColor),
                                      ),
                                    ))
                                .toList(),
                          ),
                  ),
                  buildComparisonRow<List<String>>(
                    label: 'Sizes',
                    values: products.map((p) => p.sizes).toList(),
                    cellBuilder: (sizes) => Text(
                      sizes.isEmpty ? '—' : sizes.join(', '),
                      style: AppTextStyles.bodySmall(color: textPrimary),
                    ),
                    shaded: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
