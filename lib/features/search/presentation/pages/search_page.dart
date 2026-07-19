import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/product_card.dart';
import '../../../../core/widgets/product_filter_sheet.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SearchCubit>(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto-focus so the keyboard is up the instant Search opens —
    // this screen only exists to type into.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _selectQuery(String query) {
    _controller.text = query;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: query.length),
    );
    context.read<SearchCubit>().submitSearch(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: 42,
          margin: const EdgeInsets.only(right: AppSpacing.lg),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Row(
            children: [
              const Icon(Icons.search_rounded, size: 20, color: AppColors.textMutedLight),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.search,
                  textAlignVertical: TextAlignVertical.center,
                  style: AppTextStyles.bodyMedium(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Search products, brands…',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: false,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onChanged: (value) =>
                      context.read<SearchCubit>().onQueryChanged(value),
                  onSubmitted: (value) =>
                      context.read<SearchCubit>().submitSearch(value),
                ),
              ),
              GestureDetector(
                onTap: () => AppSnackBar.showInfo(
                  context,
                  'Voice search is coming in a future update',
                ),
                child: const Icon(Icons.mic_none_rounded,
                    size: 20, color: AppColors.textMutedLight),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return switch (state) {
            SearchIdle() => _IdleView(
                recentSearches: state.recentSearches,
                onSelect: _selectQuery,
              ),
            SearchLoading() => const _SearchSkeleton(),
            SearchError() => ErrorStateView(
                message: state.message,
                onRetry: () =>
                    context.read<SearchCubit>().submitSearch(_controller.text),
              ),
            SearchLoaded() => _ResultsView(state: state),
          };
        },
      ),
    );
  }
}

class _IdleView extends StatelessWidget {
  const _IdleView({required this.recentSearches, required this.onSelect});

  final List<String> recentSearches;
  final ValueChanged<String> onSelect;

  static const List<String> _trending = [
    'Sneakers', 'Headphones', 'Trench Coat', 'Skincare Set', 'Smart Watch',
  ];

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        if (recentSearches.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Searches', style: AppTextStyles.h3(color: textPrimary)),
              TextButton(
                onPressed: () => context.read<SearchCubit>().clearRecentSearches(),
                child: const Text('Clear All'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          ...recentSearches.map(
            (query) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.history_rounded, color: AppColors.textMutedLight),
              title: Text(query, style: AppTextStyles.bodyMedium(color: textPrimary)),
              trailing: IconButton(
                icon: const Icon(Icons.close_rounded, size: 18),
                onPressed: () => context.read<SearchCubit>().removeRecentSearch(query),
              ),
              onTap: () => onSelect(query),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        Text('Trending Searches', style: AppTextStyles.h3(color: textPrimary)),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _trending.map((label) {
            return ActionChip(
              label: Text(label),
              avatar: const Icon(Icons.trending_up_rounded, size: 16),
              onPressed: () => onSelect(label),
              side: BorderSide(color: Theme.of(context).dividerColor),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ResultsView extends StatelessWidget {
  const _ResultsView({required this.state});
  final SearchLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '${state.filteredResults.length} results for "${state.query}"',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
                ),
              ),
              if (state.allResults.isNotEmpty)
                OutlinedButton.icon(
                  onPressed: () async {
                    final result = await showProductFilterSheet(
                      context,
                      current: state.filter,
                      availableBrands: state.availableBrands,
                      catalogMaxPrice: state.maxPrice,
                    );
                    if (result != null && context.mounted) {
                      context.read<SearchCubit>().applyFilter(result);
                    }
                  },
                  icon: const Icon(Icons.tune_rounded, size: 16),
                  label: Text(state.filter.isActive
                      ? 'Filters (${state.filter.activeCount})'
                      : 'Filter'),
                  style: OutlinedButton.styleFrom(minimumSize: const Size(0, 34)),
                ),
            ],
          ),
        ),
        Expanded(
          child: state.filteredResults.isEmpty
              ? EmptyStateView(
                  icon: Icons.search_off_rounded,
                  title: 'No results found',
                  message: state.allResults.isEmpty
                      ? 'We couldn\'t find anything for "${state.query}". Try a different keyword.'
                      : 'No products match your filters. Try adjusting them.',
                )
              : GridView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.xl,
                  ),
                  itemCount: state.filteredResults.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppSpacing.lg,
                    crossAxisSpacing: AppSpacing.md,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.filteredResults[index];
                    return LayoutBuilder(
                      builder: (context, constraints) => ProductCard(
                        product: product,
                        width: constraints.maxWidth,
                        onTap: () =>
                            context.push(AppRoutes.productDetailsPath(product.id)),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _SearchSkeleton extends StatelessWidget {
  const _SearchSkeleton();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.lg,
        crossAxisSpacing: AppSpacing.md,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) => const ShimmerBox(height: 260),
    );
  }
}
