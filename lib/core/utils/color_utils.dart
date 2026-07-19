import 'package:flutter/material.dart';

/// Parses a `#RRGGBB` or `#AARRGGBB` hex string (as stored on
/// [ProductEntity.colors]) into a [Color]. Falls back to a neutral
/// grey if parsing fails so a malformed value never crashes the UI.
Color hexToColor(String hex) {
  var value = hex.replaceAll('#', '').trim();
  if (value.length == 6) value = 'FF$value';

  try {
    return Color(int.parse(value, radix: 16));
  } catch (_) {
    return Colors.grey;
  }
}
