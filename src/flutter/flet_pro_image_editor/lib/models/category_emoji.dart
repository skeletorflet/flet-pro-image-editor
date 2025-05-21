import '../utils/json_utils.dart' as utils;
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
    return CategoryEmoji(
      category: utils.JsonUtils.parseString(json['category'], 'Default'),
      emojis: utils.JsonUtils.parseList<String>(json['emojis'], (item) => utils.JsonUtils.parseString(item, ''), []),
      // locale: json['locale'] != null ? Locale(utils.JsonUtils.parseString(json['locale'], 'en')) : null,
    );
  }
}
