import 'package:flutter/material.dart';
import 'package:fruit_hub/core/localization/locale_provider.dart';
import 'package:provider/provider.dart';

extension ProviderExt on BuildContext {
  LocaleProvider get localeProvider =>
      Provider.of<LocaleProvider>(this, listen: false);

  LocaleProvider get readLocaleProvider => read<LocaleProvider>();
}

extension LocaleExt on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  bool get isArabic => locale.languageCode == 'ar';

  bool get isEnglish => locale.languageCode == 'en';
}
