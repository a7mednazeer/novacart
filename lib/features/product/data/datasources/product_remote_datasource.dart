import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/banner_model.dart';
import '../models/product_model.dart';
import 'product_mock_data.dart';

/// Reads the product catalog from Firestore's `products`/`banners`
/// collections. If those collections haven't been seeded yet, falls
/// back to `mockProducts`/`mockBanners` (see `product_mock_data.dart`)
/// so every screen depending on this data source works immediately.
///
/// Once real data is seeded in Firestore, this class needs **no
/// changes** — the fallback simply stops triggering because the
/// `.get()` calls stop returning empty snapshots.
class ProductRemoteDataSource {
  ProductRemoteDataSource(FirebaseFirestore? firestore) : _firestore = firestore;

  /// Nullable so the app can run in "Mock Mode" if Firebase 
  /// isn't initialized yet.
  final FirebaseFirestore? _firestore;

  Future<List<ProductModel>> getAllProducts() async {
    // Fallback to mock data if Firestore is missing
    if (_firestore == null) return mockProducts;

    try {
      final snapshot = await _firestore.collection('products').get();
      if (snapshot.docs.isEmpty) return mockProducts;

      return snapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc.id, doc.data()))
          .toList();
    } catch (_) {
      return mockProducts;
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final all = await getAllProducts();
    return all.where((p) => p.category == category).toList();
  }

  Future<List<BannerModel>> getBanners() async {
    // Fallback to mock data if Firestore is missing
    if (_firestore == null) return mockBanners;

    try {
      final snapshot = await _firestore.collection('banners').get();
      if (snapshot.docs.isEmpty) return mockBanners;

      return snapshot.docs
          .map((doc) => BannerModel.fromFirestore(doc.id, doc.data()))
          .toList();
    } catch (_) {
      return mockBanners;
    }
  }
}
