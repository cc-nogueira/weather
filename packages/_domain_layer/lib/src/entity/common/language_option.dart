import 'dart:ui';

import 'package:flutter/widgets.dart';

enum Language { en, pt }

enum LanguageCountry {
  australia('AU', '🇦🇺', [Language.en]),
  canada('CA', '🇨🇦', [Language.en]),
  brazil('BR', '🇧🇷', [Language.pt]),
  india('IN', '🇮🇳', [Language.en]),
  portugal('PT', '🇵🇹', [Language.pt]),
  unitedKingdom('UK', '🇬🇧', [Language.en]),
  unitedStates('US', '🇺🇸', [Language.en]);

  const LanguageCountry(this.countryCode, this.flag, this.languages);

  final String countryCode;
  final String flag;
  final List<Language> languages;
}

enum LanguageOption {
  none('', null, ''),
  en('en', null, '🇺🇸'),
  enAU('en', 'AU', '🇦🇺'),
  enUK('en', 'UK', '🇬🇧'),
  enUS('en', 'US', '🇺🇸'),
  pt('pt', null, '🇧🇷'),
  ptBR('pt', 'BR', '🇧🇷'),
  ptPT('pt', 'PT', '🇵🇹');

  const LanguageOption(this.languageCode, this.countryCode, this.flag);

  factory LanguageOption.from(String languageCode, {String? country}) {
    LanguageOption? defaultForLang;
    for (final each in values) {
      if (each.languageCode == languageCode) {
        if (each.countryCode == country) {
          return each;
        }
        if (each.countryCode == null) {
          defaultForLang = each;
        }
      }
    }
    return defaultForLang ?? defaultOption;
  }

  factory LanguageOption.of(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return LanguageOption.from(locale.languageCode, country: locale.countryCode);
  }

  static LanguageOption get defaultOption => none;

  static List<LanguageOption> languagesForThisSystemCurrentlyUsing(LanguageOption currentOption) {
    final sysLocale = window.locale;
    final sysCountryCode = sysLocale.countryCode;
    LanguageOption? sysOption;
    for (final each in values) {
      if (each.countryCode == sysCountryCode && each.languageCode == sysLocale.languageCode) {
        sysOption = each;
        break;
      }
    }
    final list = <LanguageOption>[];
    final found = <String>{};
    for (final each in values) {
      final langCode = each.languageCode;
      if (found.contains(langCode)) {
        continue;
      }
      if (langCode == currentOption.languageCode) {
        list.add(currentOption);
        found.add(langCode);
      } else if (langCode == sysOption?.languageCode) {
        list.add(sysOption!);
        found.add(langCode);
      } else if (each.countryCode == null) {
        list.add(each);
        found.add(langCode);
      }
    }
    return list;
  }

  Locale? get locale => this == none ? null : Locale(languageCode, countryCode);

  final String languageCode;
  final String? countryCode;
  final String flag;
}
