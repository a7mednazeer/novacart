import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/widgets/shimmer_box.dart';

class HomeLoadingSkeleton extends StatelessWidget {
  const HomeLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: ShimmerBox(height: 150, borderRadius: AppRadius.xl),
        ),
        const SizedBox(height: AppSpacing.xl),
        SizedBox(
          height: 92,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            itemCount: 6,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (_, __) => const Column(
              children: [
                ShimmerBox(width: 56, height: 56, borderRadius: 28),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        ...List.generate(3, (i) => const _ShimmerSection()),
      ],
    );
  }
}

class _ShimmerSection extends StatelessWidget {
  const _ShimmerSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: ShimmerBox(width: 140, height: 20),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (_, __) => const ShimmerBox(width: 168, height: 240),
            ),
          ),
        ],
      ),
    );
  }
}
