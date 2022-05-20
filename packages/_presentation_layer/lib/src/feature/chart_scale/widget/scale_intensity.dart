import '../../../common/translation/noum_gender.dart';
import '../../../l10n/translations.dart';

enum ScaleIntensity {
  light,
  moderate,
  strong,
  storm;

  String translation(Translations translations, NoumGender gender) {
    if (gender == NoumGender.masculine) {
      return translations.intensity_masc(this);
    }
    return translations.intensity_fem(this);
  }
}
