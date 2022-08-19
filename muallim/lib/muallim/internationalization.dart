import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MWLocalizations {
  MWLocalizations(this.locale);

  final Locale locale;

  static MWLocalizations of(BuildContext context) =>
      Localizations.of<MWLocalizations>(context, MWLocalizations);

  static List<String> languages() => ['en'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String enText = '',
  }) =>
      [enText][languageIndex] ?? '';
}

class MWLocalizationsDelegate extends LocalizationsDelegate<MWLocalizations> {
  const MWLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      MWLocalizations.languages().contains(locale.toString());

  @override
  Future<MWLocalizations> load(Locale locale) =>
      SynchronousFuture<MWLocalizations>(MWLocalizations(locale));

  @override
  bool shouldReload(MWLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
  languageCode: language.split('_').first,
  scriptCode: language.split('_').last,
)
    : Locale(language);

final kTranslationsMap =
<Map<String, Map<String, String>>>[].reduce((a, b) => a..addAll(b));
