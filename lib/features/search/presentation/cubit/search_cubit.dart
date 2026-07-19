import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage_service.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/entities/product_filter.dart';
import '../../../product/domain/usecases/filter_products.dart';
import '../../domain/usecases/search_products_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchProducts, this._localStorage)
      : super(SearchIdle(_localStorage.recentSearches));

  final SearchProductsUseCase _searchProducts;
  final LocalStorageService _localStorage;

  Timer? _debounce;

  /// Called on every keystroke. Debounces so a fast typist doesn't
  /// trigger a search (and results-list rebuild) on every character.
  void onQueryChanged(String query) {
    _debounce?.cancel();

    if (query.trim().isEmpty) {
      emit(SearchIdle(_localStorage.recentSearches));
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 400), () {
      _performSearch(query);
    });
  }

  /// Called when the user explicitly submits (keyboard "search" action,
  /// or tapping a recent-search/suggestion chip) — searches immediately
  /// and records the query in search history.
  Future<void> submitSearch(String query) async {
    _debounce?.cancel();
    if (query.trim().isEmpty) return;
    await _localStorage.addRecentSearch(query.trim());
    await _performSearch(query);
  }

  Future<void> _performSearch(String query) async {
    emit(SearchLoading(query));
    final result = await _searchProducts(query);

    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (products) => emit(SearchLoaded(
        query: query,
        allResults: products,
        filteredResults: products,
        filter: const ProductFilter(),
      )),
    );
  }

  void applyFilter(ProductFilter filter) {
    final current = state;
    if (current is! SearchLoaded) return;

    emit(SearchLoaded(
      query: current.query,
      allResults: current.allResults,
      filteredResults: FilterProducts.call(current.allResults, filter),
      filter: filter,
    ));
  }

  Future<void> removeRecentSearch(String query) async {
    await _localStorage.removeRecentSearch(query);
    emit(SearchIdle(_localStorage.recentSearches));
  }

  Future<void> clearRecentSearches() async {
    await _localStorage.clearRecentSearches();
    emit(SearchIdle(_localStorage.recentSearches));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
