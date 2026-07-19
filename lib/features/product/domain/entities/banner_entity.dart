import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  const BannerEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.ctaLabel,
    required this.imageUrl,
    this.targetCategory,
  });

  final String id;
  final String title;
  final String subtitle;
  final String ctaLabel;
  final String imageUrl;
  final String? targetCategory;

  @override
  List<Object?> get props => [id, title];
}
