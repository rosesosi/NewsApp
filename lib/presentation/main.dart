import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/presentation/view/home_screen.dart';
import 'package:news_app/presentation/view/news/NewsItemDetails.dart';
import 'package:news_app/presentation/view/news_details_screen.dart';
import 'package:news_app/presentation/view/searchPage.dart';
import 'package:news_app/presentation/view/settings/SettingScreen.dart';
import 'package:news_app/presentation/view/splash_screen.dart';
import 'package:news_app/provider/SettingsProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingProvider;

  @override
  Widget build(BuildContext context) {
    settingProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        //AppLocalizations.supportedLocales,
        Locale('en', ''), // English, no country code
        Locale('ar', ''),
      ],
      locale: Locale(settingProvider.currentLang),
      title: "News",
      theme: MyTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
        NewsDetailsScreen.routeName: (_) => NewsDetailsScreen(),
        NewsItemDetails.routeName: (_) => NewsItemDetails(),
        SearchPage.routeName: (_) => SearchPage(),
        SettingScreen.routeName: (_) => SettingScreen(),
      },
    );
  }
}
