import '../models/banner_model.dart';
import '../models/product_model.dart';

/// ============================================================================
/// MOCK DATA — REPLACE BY SEEDING FIRESTORE
/// ============================================================================
/// This file exists so NovaCart is fully demoable before a real product
/// catalog exists in Firestore. [ProductRemoteDataSource] tries Firestore
/// first and only falls back to these lists if the `products`/`banners`
/// collections are empty or unreachable.
///
/// To go live: seed Firestore's `products` collection with documents
/// shaped like [ProductModel.toFirestore] (see that file), and a
/// `banners` collection shaped like [BannerModel]. Once documents exist,
/// this file is never touched again — delete it once Firestore is
/// seeded and remove the two fallback calls in
/// `product_remote_datasource.dart`.
/// ============================================================================

String _img(String seed) => 'https://picsum.photos/seed/$seed/600/600';

final List<ProductModel> mockProducts = [
  ProductModel(
    id: 'p1',
    name: 'Air Zoom Runner Sneakers',
    brand: 'Nike',
    category: "Men's Fashion",
    price: 3500,
    imageUrl: _img('novacart-sneaker-1'),
    discountPercent: 15,
    rating: 4.8,
    reviewCount: 7500,
    soldCount: 3230,
    isFlashSale: true,
    flashSaleEndsAt: DateTime.now().add(const Duration(hours: 6, minutes: 24)),
    description:
        'A bold, street-ready silhouette built for all-day comfort with '
        'a responsive cushioned sole and breathable knit upper.',
    images: [_img('novacart-sneaker-1'), _img('novacart-sneaker-1b'), _img('novacart-sneaker-1c')],
    colors: ['#1A1A1A', '#C0392B', '#2E5FC9'],
    sizes: ['38', '39', '40', '41', '42'],
    createdAt: DateTime.now().subtract(const Duration(days: 40)),
  ),
  ProductModel(
    id: 'p2',
    name: 'Premium Wireless Headphones',
    brand: 'SoundCore',
    category: 'Headphones',
    price: 2200,
    imageUrl: _img('novacart-headphones-1'),
    discountPercent: 25,
    rating: 4.6,
    reviewCount: 2140,
    soldCount: 980,
    isFlashSale: true,
    flashSaleEndsAt: DateTime.now().add(const Duration(hours: 2, minutes: 50)),
    description:
        'Immersive active noise-cancelling sound with 40-hour battery life.',
    images: [_img('novacart-headphones-1')],
    colors: ['#10192B', '#F7F9FC'],
    createdAt: DateTime.now().subtract(const Duration(days: 12)),
  ),
  ProductModel(
    id: 'p3',
    name: 'Classic Trench Coat',
    brand: 'Everlane',
    category: "Women's Fashion",
    price: 4200,
    imageUrl: _img('novacart-coat-1'),
    rating: 4.7,
    reviewCount: 860,
    soldCount: 410,
    isNew: true,
    description: 'A timeless double-breasted trench in water-resistant cotton twill.',
    images: [_img('novacart-coat-1')],
    colors: ['#C9A876', '#1A1A1A'],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  ProductModel(
    id: 'p4',
    name: 'UltraBook Pro 14"',
    brand: 'NovaTech',
    category: 'Laptops & Electronics',
    price: 42000,
    imageUrl: _img('novacart-laptop-1'),
    discountPercent: 10,
    rating: 4.9,
    reviewCount: 512,
    soldCount: 210,
    description: 'Featherlight aluminum chassis, all-day battery, stunning display.',
    images: [_img('novacart-laptop-1')],
    createdAt: DateTime.now().subtract(const Duration(days: 90)),
  ),
  ProductModel(
    id: 'p5',
    name: 'Everyday Leather Tote',
    brand: 'Marlowe',
    category: "Women's Fashion",
    price: 1850,
    imageUrl: _img('novacart-bag-1'),
    rating: 4.5,
    reviewCount: 302,
    soldCount: 640,
    isNew: true,
    description: 'Full-grain leather tote with an interior zip pocket and laptop sleeve.',
    images: [_img('novacart-bag-1')],
    colors: ['#5C4033', '#1A1A1A', '#C9A876'],
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
  ProductModel(
    id: 'p6',
    name: 'Aviator Sunglasses',
    brand: 'Ray Horizon',
    category: 'Eyewear',
    price: 950,
    imageUrl: _img('novacart-sunglasses-1'),
    discountPercent: 20,
    rating: 4.4,
    reviewCount: 1204,
    soldCount: 1890,
    description: 'UV400-protected polarized lenses in a classic gold frame.',
    images: [_img('novacart-sunglasses-1')],
    createdAt: DateTime.now().subtract(const Duration(days: 200)),
  ),
  ProductModel(
    id: 'p7',
    name: 'Smart Fitness Watch',
    brand: 'NovaTech',
    category: 'Headphones',
    price: 3100,
    imageUrl: _img('novacart-watch-1'),
    rating: 4.6,
    reviewCount: 980,
    soldCount: 1520,
    isNew: true,
    description: 'Track workouts, sleep, and heart rate with a 10-day battery life.',
    images: [_img('novacart-watch-1')],
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  ProductModel(
    id: 'p8',
    name: 'Organic Skincare Set',
    brand: 'Pure Botanics',
    category: 'Skincare',
    price: 1250,
    imageUrl: _img('novacart-skincare-1'),
    discountPercent: 30,
    rating: 4.7,
    reviewCount: 640,
    soldCount: 2200,
    isFlashSale: true,
    flashSaleEndsAt: DateTime.now().add(const Duration(hours: 10, minutes: 5)),
    description: 'A 4-piece daily routine set with vitamin C serum and SPF moisturizer.',
    images: [_img('novacart-skincare-1')],
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
  ),
];

final List<BannerModel> mockBanners = [
  BannerModel(
    id: 'b1',
    title: 'Up to 25% Off',
    subtitle: 'On all Headphones & AirPods',
    ctaLabel: 'Shop Now',
    imageUrl: _img('novacart-banner-audio'),
    targetCategory: 'Headphones',
  ),
  BannerModel(
    id: 'b2',
    title: "New Season, New You",
    subtitle: "Women's Fashion arrivals just dropped",
    ctaLabel: 'Explore',
    imageUrl: _img('novacart-banner-fashion'),
    targetCategory: "Women's Fashion",
  ),
  BannerModel(
    id: 'b3',
    title: 'Tech Upgrade Days',
    subtitle: 'Save big on laptops & electronics',
    ctaLabel: 'Shop Deals',
    imageUrl: _img('novacart-banner-tech'),
    targetCategory: 'Laptops & Electronics',
  ),
];
