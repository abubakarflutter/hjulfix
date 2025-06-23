import 'dart:ui' show PlatformDispatcher;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hjulfix_new/core/localization/translation_data.dart';
import 'package:hjulfix_new/core/localization/translation_keys.dart';

import '../services/cache_service.dart';
import 'language_model.dart';

class LanguageNotifier extends StateNotifier<String> {
  final CacheService _cacheService;

  LanguageNotifier(this._cacheService) : super('en') {
    _loadLanguage();
  }

  void _loadLanguage() {
    if (_cacheService.hasSelectedLanguage()) {
      // User has previously selected a language
      final savedLanguage = _cacheService.getSelectedLanguage();
      state = savedLanguage;
    } else {
      // First time - check if device language is supported
      final deviceLanguage = _getDeviceLanguage();
      state = deviceLanguage;
    }
  }

  String _getDeviceLanguage() {
    try {
      final deviceLocale = PlatformDispatcher.instance.locale;
      final deviceLanguageCode = deviceLocale.languageCode;

      // Check if device language is supported
      final supportedCodes = Language.supportedLanguages
          .map((l) => l.code)
          .toList();
      if (supportedCodes.contains(deviceLanguageCode)) {
        return deviceLanguageCode;
      }
    } catch (e) {
      // If there's any error getting device language, fall back to English
    }

    return 'en'; // Default fallback
  }

  Future<void> changeLanguage(String languageCode) async {
    await _cacheService.saveSelectedLanguage(languageCode);
    state = languageCode;
  }

  String translate(TranslationKeys key) {
    return TranslationData.getText(state, key);
  }

  Language get currentLanguage => Language.getLanguageByCode(state);
}
