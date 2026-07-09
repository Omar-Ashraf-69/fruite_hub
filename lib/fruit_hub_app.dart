import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/localization/locale_provider.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub',
      locale: Provider.of<LocaleProvider>(context).locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title)),
      body: Center(
        child: TextButton(
          onPressed: () {
            final provider = context.readLocaleProvider;

            if (provider.locale?.languageCode == 'en') {
              provider.changeLanguage('ar');
            } else {
              provider.changeLanguage('en');
            }
          },
          child: Text("Hello"),
        ),
      ),
    );
  }
}
