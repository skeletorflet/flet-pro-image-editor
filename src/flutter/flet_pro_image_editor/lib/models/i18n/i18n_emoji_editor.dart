import 'package:flutter/material.dart'; // For Locale
import '../../utils/json_utils.dart' as utils;

class I18nEmojiEditor {
  final String bottomNavigationBarText;
  final String search;
  final String categoryRecent;
  final String categorySmileys;
  final String categoryAnimals;
  final String categoryFood;
  final String categoryActivities;
  final String categoryTravel;
  final String categoryObjects;
  final String categorySymbols;
  final String categoryFlags;
  final bool enableSearchAutoI18n;
  final Locale? locale; // Changed from String? to Locale?

  const I18nEmojiEditor({
    this.bottomNavigationBarText = 'Emoji',
    this.search = 'Search',
    this.categoryRecent = 'Recent',
    this.categorySmileys = 'Smileys & People',
    this.categoryAnimals = 'Animals & Nature',
    this.categoryFood = 'Food & Drink',
    this.categoryActivities = 'Activities',
    this.categoryTravel = 'Travel & Places',
    this.categoryObjects = 'Objects',
    this.categorySymbols = 'Symbols',
    this.categoryFlags = 'Flags',
    this.enableSearchAutoI18n = false,
    this.locale, // Default is null
  });

  factory I18nEmojiEditor.fromJson(Map<String, dynamic> json) {
    return I18nEmojiEditor(
      bottomNavigationBarText: utils.JsonUtils.parseString(json['bottomNavigationBarText'], 'Emoji'),
      search: utils.JsonUtils.parseString(json['search'], 'Search'),
      categoryRecent: utils.JsonUtils.parseString(json['categoryRecent'], 'Recent'),
      categorySmileys: utils.JsonUtils.parseString(json['categorySmileys'], 'Smileys & People'),
      categoryAnimals: utils.JsonUtils.parseString(json['categoryAnimals'], 'Animals & Nature'),
      categoryFood: utils.JsonUtils.parseString(json['categoryFood'], 'Food & Drink'),
      categoryActivities: utils.JsonUtils.parseString(json['categoryActivities'], 'Activities'),
      categoryTravel: utils.JsonUtils.parseString(json['categoryTravel'], 'Travel & Places'),
      categoryObjects: utils.JsonUtils.parseString(json['categoryObjects'], 'Objects'),
      categorySymbols: utils.JsonUtils.parseString(json['categorySymbols'], 'Symbols'),
      categoryFlags: utils.JsonUtils.parseString(json['categoryFlags'], 'Flags'),
      enableSearchAutoI18n: utils.JsonUtils.parseBool(json['enableSearchAutoI18n'], false),
      locale: json['locale'] != null ? Locale(utils.JsonUtils.parseString(json['locale'], 'en')) : null,
    );
  }
}
