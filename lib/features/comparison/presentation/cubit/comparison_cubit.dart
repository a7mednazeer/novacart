import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/domain/entities/product_entity.dart';

part 'comparison_state.dart';

/// Registered as an app-wide singleton so Category Products (and later
/// Search) can both add to the same in-progress comparison. Unlike
/// Wishlist/Cart/Recently Viewed, this is deliberately **not**
/// Firestore-backed — a comparison selection is a throwaway part of one
/// browsing session, not something worth syncing across devices or
/// surviving an app restart.
class ComparisonCubit extends Cubit<ComparisonState> {
  ComparisonCubit() : super(const ComparisonState());

  static const int maxProducts = 3;

  /// Returns `false` (and leaves state unchanged) if adding would
  /// exceed [maxProducts], so the caller can show a message.
  bool toggle(ProductEntity product) {
    final current = [...state.products];
    final existingIndex = current.indexWhere((p) => p.id == product.id);

    if (existingIndex != -1) {
      current.removeAt(existingIndex);
      emit(state.copyWith(products: current));
      return true;
    }

    if (current.length >= maxProducts) return false;

    current.add(product);
    emit(state.copyWith(products: current));
    return true;
  }

  void remove(String productId) {
    emit(state.copyWith(
      products: state.products.where((p) => p.id != productId).toList(),
    ));
  }

  void clear() => emit(const ComparisonState());
}
