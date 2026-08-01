import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:novacart/generated/l10n/app_localizations.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
  });

  final String id;
  final String name;
  final IconData icon;

  /// Localized name based on the entity ID.
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (id) {
      'womens-fashion' => l10n.categoryWomensFashion,
      'mens-fashion' => l10n.categoryMensFashion,
      'skincare' => l10n.categorySkincare,
      'beauty' => l10n.categoryBeauty,
      'headphones' => l10n.categoryHeadphones,
      'cameras' => l10n.categoryCameras,
      'electronics' => l10n.categoryLaptopsElectronics,
      'baby-toys' => l10n.categoryBabyToys,
      _ => name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
