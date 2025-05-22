import 'package:flet/flet.dart';
// import 'package:flutter/material.dart'; // For Locale if used

class CategoryEmoji {
  final String category;
  final List<String> emojis;
  // final Locale? locale; // Was in Python, but might be simpler here

  const CategoryEmoji({
    this.category = "Default",
    this.emojis = const [],
    // this.locale,
  });

  factory CategoryEmoji.fromJson(Map<String, dynamic> json) {
    List<String> tempEmojis = [];
    dynamic rawEmojis = json['emojis'];
    if (rawEmojis is List) {
      tempEmojis = rawEmojis.map((item) => parseString(item as String?, '')).toList().cast<String>();
    }
    return CategoryEmoji(
      category: parseString(json['category'] as String?, 'Default'),
      emojis: tempEmojis,
      // locale: json['locale'] != null ? Locale(parseString(json['locale'] as String?, 'en')) : null,
    );
  }
}
