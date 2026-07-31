import '../../domain/entities/review_entity.dart';

/// ============================================================================
/// MOCK DATA — REPLACE BY SEEDING FIRESTORE
/// ============================================================================
/// Generates a deterministic, plausible set of reviews for any product
/// id so every Product Details screen has believable content.
/// ============================================================================

const List<Map<String, dynamic>> _reviewTemplates = [
  {'name': 'Amira K.', 'rating': 5.0, 'comment': 'Exactly as described, arrived fast and the quality feels premium.'},
  {'name': 'Youssef M.', 'rating': 4.0, 'comment': 'Really good, though sizing runs slightly small — order one size up.'},
  {'name': 'Salma H.', 'rating': 5.0, 'comment': 'Obsessed with this! Already ordered a second color.'},
  {'name': 'Omar T.', 'rating': 3.5, 'comment': 'Decent for the price, but packaging could be better.'},
  {'name': 'Nour A.', 'rating': 4.5, 'comment': "Great value. Customer service was also super responsive."},
  {'name': 'Karim S.', 'rating': 5.0, 'comment': 'Second time ordering this — consistently great quality.'},
  {'name': 'Laila B.', 'rating': 5.0, 'comment': 'Beautiful design and very functional. Highly recommend!'},
  {'name': 'Hassan Z.', 'rating': 4.5, 'comment': 'Exceeded my expectations for the price. Very happy with the purchase.'},
  {'name': 'Mariam G.', 'rating': 3.0, 'comment': 'It is okay, but the color is slightly different from the photos.'},
  {'name': 'Ahmed R.', 'rating': 5.0, 'comment': 'Fast delivery and excellent packaging. Will buy again.'},
  {'name': 'Fatma E.', 'rating': 4.0, 'comment': 'Good quality product, but shipping took a bit longer than expected.'},
  {'name': 'Mostafa N.', 'rating': 2.5, 'comment': 'Not what I expected. The material feels a bit cheap.'},
];

List<ReviewEntity> generateMockReviews(String productId) {
  final seed = productId.hashCode;
  // Deterministic count based on product ID (between 4 and 10 reviews)
  final count = 4 + (seed.abs() % 7);

  return List.generate(count, (i) {
    final template = _reviewTemplates[(seed.abs() + i) % _reviewTemplates.length];
    return ReviewEntity(
      id: '$productId-review-$i',
      userName: template['name'] as String,
      rating: template['rating'] as double,
      comment: template['comment'] as String,
      date: DateTime.now().subtract(Duration(days: (seed.abs() + i * 5) % 150)),
      avatarSeed: 'user-${(seed.abs() + i) % 20}',
    );
  });
}
