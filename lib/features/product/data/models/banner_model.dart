import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.ctaLabel,
    required super.imageUrl,
    super.targetCategory,
  });

  factory BannerModel.fromFirestore(String id, Map<String, dynamic> data) {
    return BannerModel(
      id: id,
      title: data['title'] as String? ?? '',
      subtitle: data['subtitle'] as String? ?? '',
      ctaLabel: data['ctaLabel'] as String? ?? 'Shop Now',
      imageUrl: data['imageUrl'] as String? ?? '',
      targetCategory: data['targetCategory'] as String?,
    );
  }
}
