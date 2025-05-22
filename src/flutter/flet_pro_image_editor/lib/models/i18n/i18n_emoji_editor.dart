import 'package:flutter/material.dart'; // For Locale
import 'package:flet/flet.dart';

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
      bottomNavigationBarText: parseString(json['bottomNavigationBarText'] as String?, 'Emoji'),
      search: parseString(json['search'] as String?, 'Search'),
      categoryRecent: parseString(json['categoryRecent'] as String?, 'Recent'),
      categorySmileys: parseString(json['categorySmileys'] as String?, 'Smileys & People'),
      categoryAnimals: parseString(json['categoryAnimals'] as String?, 'Animals & Nature'),
      categoryFood: parseString(json['categoryFood'] as String?, 'Food & Drink'),
      categoryActivities: parseString(json['categoryActivities'] as String?, 'Activities'),
      categoryTravel: parseString(json['categoryTravel'] as String?, 'Travel & Places'),
      categoryObjects: parseString(json['categoryObjects'] as String?, 'Objects'),
      categorySymbols: parseString(json['categorySymbols'] as String?, 'Symbols'),
      categoryFlags: parseString(json['categoryFlags'] as String?, 'Flags'),
      enableSearchAutoI18n: parseBool(json['enableSearchAutoI18n'], false),
      locale: json['locale'] != null ? Locale(parseString(json['locale'] as String?, 'en')) : null,
    );
  }
}
