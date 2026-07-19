import 'package:flutter/material.dart';
import '../../../../core/widgets/coming_soon_placeholder.dart';

class CategoriesPlaceholderPage extends StatelessWidget {
  const CategoriesPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonPlaceholder(
      title: 'Categories',
      icon: Icons.grid_view_rounded,
      message:
          'Full category browsing with filters, sorting, and subcategories '
          'is built in an upcoming step.',
    );
  }
}
