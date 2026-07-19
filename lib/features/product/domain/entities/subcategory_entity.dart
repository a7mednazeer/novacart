import 'package:equatable/equatable.dart';

/// A subcategory belonging to one top-level [CategoryEntity] (e.g.
/// "Dresses" under "Women's Fashion"). Kept separate from
/// [ProductEntity.category] (which stays a single top-level string) so
/// the Categories screen can show a browsable subcategory grid without
/// requiring every mock/Firestore product to carry a subcategory tag.
class SubcategoryEntity extends Equatable {
  const SubcategoryEntity({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String categoryId;
  final String imageUrl;

  @override
  List<Object?> get props => [id, name, categoryId];
}
