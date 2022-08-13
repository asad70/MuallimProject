import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MWLocalizations {
  MWLocalizations(this.locale);

  final Locale locale;

  static MWLocalizations of(BuildContext context) =>
      Localizations.of<MWLocalizations>(context, MWLocalizations);

  static List<String> languages() => ['en'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
  }) =>
      [enText][languageIndex] ?? '';
}

class MWLocalizationsDelegate extends LocalizationsDelegate<MWLocalizations> {
  const MWLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      MWLocalizations.languages().contains(locale.languageCode);

  @override
  Future<MWLocalizations> load(Locale locale) =>
      SynchronousFuture<MWLocalizations>(MWLocalizations(locale));

  @override
  bool shouldReload(MWLocalizationsDelegate old) => false;
}

final kTranslationsMap =
    <Map<String, Map<String, String>>>[].reduce((a, b) => a..addAll(b));
