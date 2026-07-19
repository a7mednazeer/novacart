import '../../domain/entities/review_entity.dart';

/// ============================================================================
/// MOCK DATA — REPLACE BY SEEDING FIRESTORE
/// ============================================================================
/// Generates a deterministic, plausible set of reviews for any product
/// id so every Product Details screen has believable content. Once a
/// real `products/{productId}/reviews` subcollection exists in
/// Firestore, replace `generateMockReviews` in
/// `product_details_repository_impl.dart` with a Firestore query —
/// [ReviewEntity] and the rest of the presentation layer need no
/// changes since they only depend on the entity shape.
/// ============================================================================

const List<Map<String, dynamic>> _reviewTemplates = [
  {'name': 'Amira K.', 'rating': 5.0, 'comment': 'Exactly as described, arrived fast and the quality feels premium.'},
  {'name': 'Youssef M.', 'rating': 4.0, 'comment': 'Really good, though sizing runs slightly small — order one size up.'},
  {'name': 'Salma H.', 'rating': 5.0, 'comment': 'Obsessed with this! Already ordered a second color.'},
  {'name': 'Omar T.', 'rating': 3.5, 'comment': 'Decent for the price, but packaging could be better.'},
  {'name': 'Nour A.', 'rating': 4.5, 'comment': "Great value. Customer service was also super responsive when I had a question."},
  {'name': 'Karim S.', 'rating': 5.0, 'comment': 'Second time ordering this — consistently great quality.'},
];

List<ReviewEntity> generateMockReviews(String productId) {
  final seed = productId.hashCode;

  return List.generate(_reviewTemplates.length, (i) {
    final template = _reviewTemplates[(seed + i) % _reviewTemplates.length];
    return ReviewEntity(
      id: '$productId-review-$i',
      userName: template['name'] as String,
      rating: template['rating'] as double,
      comment: template['comment'] as String,
      date: DateTime.now().subtract(Duration(days: (seed.abs() + i * 7) % 120)),
      avatarSeed: '$productId-$i',
    );
  });
}
