import 'package:get/get.dart';

enum Language {
  HINDI,
  ENGLISH,
  SPANISH,
  FRENCH,
  GERMAN,
}

extension LanguageExtension on Language {
  String toLanguageSign() {
    switch (this) {
      case Language.HINDI:
        return 'hi-IN';
      case Language.ENGLISH:
        return 'en-IN';
      case Language.SPANISH:
        return 'es-ES';
      case Language.FRENCH:
        return 'fr-FR';
      case Language.GERMAN:
        return 'de-DE';
    }
  }

  String toDisplayName() {
    // Capitalizes the first letter of the enum name (e.g., HINDI -> Hindi)
    return name.toString().capitalizeFirst ?? '';
  }
}
