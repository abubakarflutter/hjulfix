// Step 3: Create Language Model
class Language {
  final String code;
  final String name;
  final String nativeName;
  final String flagAsset;

  const Language({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flagAsset,
  });

  static const List<Language> supportedLanguages = [
    Language(
      code: 'en',
      name: 'English',
      nativeName: 'English',
      flagAsset: 'assets/images/lang-english.png',
    ),
    Language(
      code: 'da',
      name: 'Danish',
      nativeName: 'Dansk',
      flagAsset: 'assets/images/lang-danish.png',
    ),
  ];

  static Language getLanguageByCode(String code) {
    return supportedLanguages.firstWhere(
      (lang) => lang.code == code,
      orElse: () => supportedLanguages.first, // Default to English
    );
  }
}
