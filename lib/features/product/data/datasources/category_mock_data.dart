import 'package:flutter/material.dart';
import '../../domain/entities/category_entity.dart';

/// Top-level shop categories. These are stable enough (unlike products)
/// that a hardcoded list is a reasonable long-term choice, but could be
/// moved to a Firestore `categories` collection later using the same
/// pattern as `ProductRemoteDataSource` if categories need to be
/// managed remotely without an app update.
const List<CategoryEntity> shopCategories = [
  CategoryEntity(id: 'womens-fashion', name: "Women's Fashion", icon: Icons.checkroom_rounded),
  CategoryEntity(id: 'mens-fashion', name: "Men's Fashion", icon: Icons.style),
  CategoryEntity(id: 'skincare', name: 'Skincare', icon: Icons.spa_rounded),
  CategoryEntity(id: 'beauty', name: 'Beauty', icon: Icons.face_rounded),
  CategoryEntity(id: 'headphones', name: 'Headphones', icon: Icons.headphones),
  CategoryEntity(id: 'cameras', name: 'Cameras', icon: Icons.camera_alt_rounded),
  CategoryEntity(id: 'electronics', name: 'Laptops & Electronics', icon: Icons.laptop),
  CategoryEntity(id: 'baby-toys', name: 'Baby & Toys', icon: Icons.toys),
];
