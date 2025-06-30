enum Language {
  HINDI,
  ENGLISH,
}

extension LanguageExtension on Language {
  String toLanguageSign() {
    switch (this) {
      case Language.HINDI:
        return 'hi-IN';
      case Language.ENGLISH:
        return 'en-IN';
    }
  }
}
