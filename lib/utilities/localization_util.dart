import 'package:rsj_f/rsj_f.dart';
import 'package:flutter/cupertino.dart';

typedef TranslationDelegateChanged = Function(TranslationsDelegate);

class LocalizationUtil {
  TranslationsDelegate translationsDelegate;
  AppLanguages appLanguages;

  void initLocalization({
    List<Locale> supportedLocales = const [Locale('en')],
    Locale initialLocale = const Locale('en'),
    TranslationDelegateChanged translationDelegateChanged,
    DateTime localizationLastLoadedOn,
    SavedLastOnCallback savedLastOnCallback,
  }) {
    appLanguages = AppLanguages()
      ..setSupportedLocales(supportedLocales)
      ..onLocaleChanged = (locale) => _onLocaleChanged(locale, translationDelegateChanged);

    translationsDelegate = TranslationsDelegate(
      apiToken: '64166868afbf302d65e3d7e6b19bf45d',
      projectId: '429725',
      locale: initialLocale,
      basePath: 'assets/translations/translations_',
      type: 'apple_strings',
      lastOnCallback: () => localizationLastLoadedOn,
      savedLastOnCallback: savedLastOnCallback,
    );
  }

  void _onLocaleChanged(Locale locale, TranslationDelegateChanged translationDelegateChanged) {
    final newLocaleDelegate = translationsDelegate.switchLocale(locale);
    if (translationDelegateChanged != null) {
      translationDelegateChanged(newLocaleDelegate);
    }
  }
}
