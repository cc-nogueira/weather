import 'dart:ui';

enum Language {
  none,
  en,
  pt;

  static Language forLanguageCode(String languageCode) => values.firstWhere(
        (element) => element.name == languageCode,
        orElse: () => none,
      );

  static Language forLocale(Locale locale) => forLanguageCode(locale.languageCode);

  String get languageCode => this == none ? '' : name;
}

enum LanguageCountry {
  none(null, '', [Language.none]),
  australia('AU', '🇦🇺', [Language.en]),
  canada('CA', '🇨🇦', [Language.en]),
  brazil('BR', '🇧🇷', [Language.pt]),
  india('IN', '🇮🇳', [Language.en]),
  portugal('PT', '🇵🇹', [Language.pt]),
  unitedKingdom('UK', '🇬🇧', [Language.en]),
  unitedStates('US', '🇺🇸', [Language.en]);

  const LanguageCountry(this.countryCode, this.flag, this.languages);

  static List<LanguageCountry> forLanguage(Language language) =>
      values.where((each) => each.languages.contains(language)).toList();

  final String? countryCode;
  final String flag;
  final List<Language> languages;
}

class LanguageOption {
  const LanguageOption._(this.language, this.country);

  static const none = LanguageOption._(Language.none, LanguageCountry.none);

  static const _defaultLanguageOptions = [
    none,
    LanguageOption._(Language.en, LanguageCountry.unitedStates),
    LanguageOption._(Language.pt, LanguageCountry.brazil)
  ];

  final Language language;
  final LanguageCountry country;

  /// Default LanguageOption for a language or none.
  static LanguageOption defaultLanguageOptionFor(Language language) =>
      _defaultLanguageOptions.firstWhere(
        (each) => each.language == language,
        orElse: () => none,
      );

  /// Find a matching LanguageOption for a languageCode and an optional countryCode.
  ///
  /// This is probably only used by the Preferences Usecase to load the last used LanguageOption.
  static LanguageOption matching(String languageCode, String? countryCode) {
    final language = Language.forLanguageCode(languageCode);
    if (language == Language.none) {
      return none;
    }
    if (countryCode == null) {
      return defaultLanguageOptionFor(language);
    }

    for (final country in LanguageCountry.forLanguage(language)) {
      if (country.countryCode == countryCode) {
        return LanguageOption._(language, country);
      }
    }

    return defaultLanguageOptionFor(language);
  }

  /// List of available LanguageOptions.
  ///
  /// This is list is constructed in the following order:
  /// - first is none.
  /// - second is currentOption.
  /// - then options is systemLocales.
  /// - last default options for each language
  static List<LanguageOption> languageOptions(
      List<Locale> systemLocales, LanguageOption currentOption) {
    final languagesInSystem = <Language>{};
    for (final locale in systemLocales) {
      final language = Language.forLocale(locale);
      if (language != Language.none) {
        languagesInSystem.add(language);
      }
    }

    // first is none
    final list = <LanguageOption>[none];
    final found = <Language>{Language.none};

    // second is currentOption
    if (currentOption != none) {
      list.add(currentOption);
      found.add(currentOption.language);
    }

    // then options is systemLocales
    for (final language in languagesInSystem) {
      if (found.contains(language)) {
        continue;
      }
      final option = _findOptionInSystemLocales(systemLocales, language);
      if (option != null) {
        list.add(option);
        found.add(option.language);
      }
    }

    // last default options for each language
    if (Language.values.length > list.length) {
      for (final language in Language.values) {
        if (found.contains(language)) {
          continue;
        }
        final defaultOption = defaultLanguageOptionFor(language);
        if (defaultOption != none) {
          list.add(defaultOption);
        }
      }
    }
    return list;
  }

  static LanguageOption? _findOptionInSystemLocales(List<Locale> systemLocales, Language language) {
    final countries = LanguageCountry.forLanguage(language);
    for (final locale in systemLocales) {
      if (locale.languageCode == language.name) {
        final countryCode = locale.countryCode;
        if (countryCode != null) {
          for (final country in countries) {
            if (country.countryCode == countryCode) {
              return LanguageOption._(language, country);
            }
          }
        }
      }
    }
    return null;
  }

  /// Is this a none option?
  bool get isNone => language == Language.none;

  String get languageCode => language.languageCode;
  String? get countryCode => country.countryCode;

  Locale? get locale => isNone ? null : Locale(languageCode, countryCode);

  @override
  bool operator ==(Object other) =>
      other is LanguageOption && other.language == language && other.country == country;

  @override
  int get hashCode => language.hashCode & country.hashCode;
}
