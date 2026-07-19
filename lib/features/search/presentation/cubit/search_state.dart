part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

/// Shown when the search field is empty — displays recent search
/// history (and, in the UI layer, instant "trending"/suggested chips).
class SearchIdle extends SearchState {
  const SearchIdle(this.recentSearches);
  final List<String> recentSearches;

  @override
  List<Object?> get props => [recentSearches];
}

class SearchLoading extends SearchState {
  const SearchLoading(this.query);
  final String query;

  @override
  List<Object?> get props => [query];
}

class SearchLoaded extends SearchState {
  const SearchLoaded({
    required this.query,
    required this.allResults,
    required this.filteredResults,
    required this.filter,
  });

  final String query;
  final List<ProductEntity> allResults;
  final List<ProductEntity> filteredResults;
  final ProductFilter filter;

  List<String> get availableBrands =>
      allResults.map((p) => p.brand).toSet().toList()..sort();

  double get maxPrice => allResults.isEmpty
      ? 1000
      : allResults.map((p) => p.price).reduce((a, b) => a > b ? a : b);

  @override
  List<Object?> get props => [query, allResults, filteredResults, filter];
}

class SearchError extends SearchState {
  const SearchError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
