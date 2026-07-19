import 'package:flutter/material.dart';
import '../../../../core/widgets/coming_soon_placeholder.dart';

class WishlistPlaceholderPage extends StatelessWidget {
  const WishlistPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonPlaceholder(
      title: 'Wishlist',
      icon: Icons.favorite_rounded,
      message:
          'Your saved favorites will sync across devices here in an '
          'upcoming step.',
    );
  }
}
