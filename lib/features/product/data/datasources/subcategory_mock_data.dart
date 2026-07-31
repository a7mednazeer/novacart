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
  'skincare': [
    SubcategoryEntity(id: 's-moisturizers', name: 'Moisturizers', categoryId: 'skincare', imageUrl: _img('sub-moisturizer')),
    SubcategoryEntity(id: 's-cleansers', name: 'Cleansers', categoryId: 'skincare', imageUrl: _img('sub-cleanser')),
    SubcategoryEntity(id: 's-serums', name: 'Serums', categoryId: 'skincare', imageUrl: _img('sub-serum')),
    SubcategoryEntity(id: 's-sunscreen', name: 'Sunscreen', categoryId: 'skincare', imageUrl: _img('sub-sunscreen')),
    SubcategoryEntity(id: 's-masks', name: 'Face Masks', categoryId: 'skincare', imageUrl: _img('sub-mask')),
    SubcategoryEntity(id: 's-eye-care', name: 'Eye Care', categoryId: 'skincare', imageUrl: _img('sub-eyecare')),
    SubcategoryEntity(id: 's-toners', name: 'Toners', categoryId: 'skincare', imageUrl: _img('sub-toner')),
    SubcategoryEntity(id: 's-oils', name: 'Face Oils', categoryId: 'skincare', imageUrl: _img('sub-oil')),
    SubcategoryEntity(id: 's-kits', name: 'Kits & Sets', categoryId: 'skincare', imageUrl: _img('sub-skinkit')),
  ],
  'beauty': [
    SubcategoryEntity(id: 'b-makeup', name: 'Makeup', categoryId: 'beauty', imageUrl: _img('sub-makeup')),
    SubcategoryEntity(id: 'b-perfume', name: 'Fragrance', categoryId: 'beauty', imageUrl: _img('sub-perfume')),
    SubcategoryEntity(id: 'b-hair', name: 'Hair Care', categoryId: 'beauty', imageUrl: _img('sub-haircare')),
    SubcategoryEntity(id: 'b-nails', name: 'Nail Care', categoryId: 'beauty', imageUrl: _img('sub-nails')),
    SubcategoryEntity(id: 'b-bath', name: 'Bath & Body', categoryId: 'beauty', imageUrl: _img('sub-bath')),
    SubcategoryEntity(id: 'b-tools', name: 'Tools & Brushes', categoryId: 'beauty', imageUrl: _img('sub-tools')),
  ],
  'headphones': [
    SubcategoryEntity(id: 'h-overear', name: 'Over-Ear', categoryId: 'headphones', imageUrl: _img('sub-overear')),
    SubcategoryEntity(id: 'h-inear', name: 'In-Ear', categoryId: 'headphones', imageUrl: _img('sub-inear')),
    SubcategoryEntity(id: 'h-wireless', name: 'Wireless', categoryId: 'headphones', imageUrl: _img('sub-wireless-h')),
    SubcategoryEntity(id: 'h-gaming', name: 'Gaming', categoryId: 'headphones', imageUrl: _img('sub-gaming-h')),
    SubcategoryEntity(id: 'h-sport', name: 'Sport', categoryId: 'headphones', imageUrl: _img('sub-sport-h')),
    SubcategoryEntity(id: 'h-accessories', name: 'Accessories', categoryId: 'headphones', imageUrl: _img('sub-h-acc')),
  ],
  'cameras': [
    SubcategoryEntity(id: 'c-dslr', name: 'DSLR', categoryId: 'cameras', imageUrl: _img('sub-dslr')),
    SubcategoryEntity(id: 'c-mirrorless', name: 'Mirrorless', categoryId: 'cameras', imageUrl: _img('sub-mirrorless')),
    SubcategoryEntity(id: 'c-action', name: 'Action Cameras', categoryId: 'cameras', imageUrl: _img('sub-actioncam')),
    SubcategoryEntity(id: 'c-lenses', name: 'Lenses', categoryId: 'cameras', imageUrl: _img('sub-lens')),
    SubcategoryEntity(id: 'c-tripods', name: 'Tripods', categoryId: 'cameras', imageUrl: _img('sub-tripod')),
    SubcategoryEntity(id: 'c-bags', name: 'Camera Bags', categoryId: 'cameras', imageUrl: _img('sub-cambag')),
  ],
  'electronics': [
    SubcategoryEntity(id: 'e-laptops', name: 'Laptops', categoryId: 'electronics', imageUrl: _img('sub-laptop')),
    SubcategoryEntity(id: 'e-tablets', name: 'Tablets', categoryId: 'electronics', imageUrl: _img('sub-tablet')),
    SubcategoryEntity(id: 'e-monitors', name: 'Monitors', categoryId: 'electronics', imageUrl: _img('sub-monitor')),
    SubcategoryEntity(id: 'e-storage', name: 'Storage', categoryId: 'electronics', imageUrl: _img('sub-storage')),
    SubcategoryEntity(id: 'e-peripherals', name: 'Peripherals', categoryId: 'electronics', imageUrl: _img('sub-keyboard')),
    SubcategoryEntity(id: 'e-networking', name: 'Networking', categoryId: 'electronics', imageUrl: _img('sub-router')),
  ],
  'baby-toys': [
    SubcategoryEntity(id: 'bt-infant', name: 'Infant Toys', categoryId: 'baby-toys', imageUrl: _img('sub-infant')),
    SubcategoryEntity(id: 'bt-educational', name: 'Educational', categoryId: 'baby-toys', imageUrl: _img('sub-edu')),
    SubcategoryEntity(id: 'bt-dolls', name: 'Dolls', categoryId: 'baby-toys', imageUrl: _img('sub-doll')),
    SubcategoryEntity(id: 'bt-outdoor', name: 'Outdoor Play', categoryId: 'baby-toys', imageUrl: _img('sub-outdoor')),
    SubcategoryEntity(id: 'bt-clothing', name: 'Baby Clothing', categoryId: 'baby-toys', imageUrl: _img('sub-babyclothes')),
    SubcategoryEntity(id: 'bt-gear', name: 'Baby Gear', categoryId: 'baby-toys', imageUrl: _img('sub-babygear')),
  ],
};
