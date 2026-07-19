import '../../domain/entities/subcategory_entity.dart';

/// Subcategories shown on the Categories screen. As with
/// `category_mock_data.dart`, this is a reasonable hardcoded list for
/// now (subcategories rarely change) — move to a Firestore
/// `subcategories` collection later if merchandising needs to manage
/// this without an app release.
String _img(String seed) => 'https://picsum.photos/seed/$seed/300/300';

final Map<String, List<SubcategoryEntity>> subcategoriesByCategory = {
  'womens-fashion': [
    SubcategoryEntity(id: 'w-dresses', name: 'Dresses', categoryId: 'womens-fashion', imageUrl: _img('sub-dresses')),
    SubcategoryEntity(id: 'w-jeans', name: 'Jeans', categoryId: 'womens-fashion', imageUrl: _img('sub-w-jeans')),
    SubcategoryEntity(id: 'w-skirts', name: 'Skirts', categoryId: 'womens-fashion', imageUrl: _img('sub-skirts')),
    SubcategoryEntity(id: 'w-pijamas', name: 'Pijamas', categoryId: 'womens-fashion', imageUrl: _img('sub-pijamas')),
    SubcategoryEntity(id: 'w-bags', name: 'Bags', categoryId: 'womens-fashion', imageUrl: _img('sub-w-bags')),
    SubcategoryEntity(id: 'w-tshirts', name: 'T-shirts', categoryId: 'womens-fashion', imageUrl: _img('sub-w-tshirts')),
    SubcategoryEntity(id: 'w-footwear', name: 'Footwear', categoryId: 'womens-fashion', imageUrl: _img('sub-w-footwear')),
    SubcategoryEntity(id: 'w-eyewear', name: 'Eyewear', categoryId: 'womens-fashion', imageUrl: _img('sub-w-eyewear')),
    SubcategoryEntity(id: 'w-watches', name: 'Watches', categoryId: 'womens-fashion', imageUrl: _img('sub-w-watches')),
  ],
  'mens-fashion': [
    SubcategoryEntity(id: 'm-tshirts', name: 'T-shirts', categoryId: 'mens-fashion', imageUrl: _img('sub-m-tshirts')),
    SubcategoryEntity(id: 'm-shorts', name: 'Shorts', categoryId: 'mens-fashion', imageUrl: _img('sub-shorts')),
    SubcategoryEntity(id: 'm-jeans', name: 'Jeans', categoryId: 'mens-fashion', imageUrl: _img('sub-m-jeans')),
    SubcategoryEntity(id: 'm-pants', name: 'Pants', categoryId: 'mens-fashion', imageUrl: _img('sub-pants')),
    SubcategoryEntity(id: 'm-footwear', name: 'Footwear', categoryId: 'mens-fashion', imageUrl: _img('sub-m-footwear')),
    SubcategoryEntity(id: 'm-suits', name: 'Suits', categoryId: 'mens-fashion', imageUrl: _img('sub-suits')),
    SubcategoryEntity(id: 'm-watches', name: 'Watches', categoryId: 'mens-fashion', imageUrl: _img('sub-m-watches')),
    SubcategoryEntity(id: 'm-bags', name: 'Bags', categoryId: 'mens-fashion', imageUrl: _img('sub-m-bags')),
    SubcategoryEntity(id: 'm-eyewear', name: 'Eyewear', categoryId: 'mens-fashion', imageUrl: _img('sub-m-eyewear')),
  ],
};
