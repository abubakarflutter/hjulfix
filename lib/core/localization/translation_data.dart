// Step 2: Create Translation Data Class
import 'package:hjulfix_new/core/localization/translation_keys.dart';

class TranslationData {
  static const Map<String, Map<TranslationKeys, String>> translations = {
    'en': {
      // English translations
      TranslationKeys.welcomeTo: 'Welcome to',
      TranslationKeys.professionalRimRenovation:
          'Professional rim renovation and powder coating',
      TranslationKeys.selectLanguage: 'Select Language',
      TranslationKeys.chooseFavoriteLanguage: 'Choose your favorite language',
      TranslationKeys.english: 'English',
      TranslationKeys.danish: 'Danish',
      TranslationKeys.continueButton: 'Continue',
      TranslationKeys.login: 'Login',
      TranslationKeys.register: 'Register',
      TranslationKeys.forgotPassword: 'Forgot Password?',
      TranslationKeys.email: 'Email',
      TranslationKeys.password: 'Password',
    },
    'da': {
      // Danish translations
      TranslationKeys.welcomeTo: 'Velkommen til',
      TranslationKeys.professionalRimRenovation:
          'Professionel fælgrenovering og pulverlakering',
      TranslationKeys.selectLanguage: 'Vælg sprog',
      TranslationKeys.chooseFavoriteLanguage: 'Vælg dit foretrukne sprog',
      TranslationKeys.english: 'Engelsk',
      TranslationKeys.danish: 'Dansk',
      TranslationKeys.continueButton: 'Fortsæt',
      TranslationKeys.login: 'Log ind',
      TranslationKeys.register: 'Registrer',
      TranslationKeys.forgotPassword: 'Glemt adgangskode?',
      TranslationKeys.email: 'E-mail',
      TranslationKeys.password: 'Adgangskode',
    },
  };

  static String getText(String languageCode, TranslationKeys key) {
    return translations[languageCode]?[key] ?? translations['en']![key]!;
  }
}
