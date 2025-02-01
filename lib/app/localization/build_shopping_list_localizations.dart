import 'dart:ui' as locale;

import 'package:build_shopping_list/app/localization/translations_es.i69n.dart';
import 'package:flutter/material.dart';

import 'translations.i69n.dart';

const _supportedLocales = [
  'en',
  'es',
];

class BuildShoppingListLocalizations {
  const BuildShoppingListLocalizations(this.translations);

  final Translations translations;

  static final _translations = <String, Translations Function()>{
    'en': () => const Translations(),
    'es': () => const Translations_es(),
  };

  static const LocalizationsDelegate<BuildShoppingListLocalizations> delegate =
      _BuildShoppingListLocalizationsDelegate();

  static final List<Locale> supportedLocales =
      _supportedLocales.map((x) => Locale(x)).toList();

  static Future<BuildShoppingListLocalizations> load(locale.Locale locale) =>
      Future.value(BuildShoppingListLocalizations(
          _translations[locale.languageCode]!()));

  static Translations of(BuildContext context) =>
      Localizations.of<BuildShoppingListLocalizations>(
              context, BuildShoppingListLocalizations)!
          .translations;
}

class _BuildShoppingListLocalizationsDelegate
    extends LocalizationsDelegate<BuildShoppingListLocalizations> {
  const _BuildShoppingListLocalizationsDelegate();

  @override
  bool isSupported(locale.Locale locale) =>
      _supportedLocales.contains(locale.languageCode);

  @override
  Future<BuildShoppingListLocalizations> load(locale.Locale locale) =>
      BuildShoppingListLocalizations.load(locale);

  @override
  bool shouldReload(
          LocalizationsDelegate<BuildShoppingListLocalizations> old) =>
      false;
}
