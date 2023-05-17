import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/screens/search_page.dart';
import 'package:flutter_f6sny/screens/home_page.dart';
import 'package:flutter_f6sny/screens/settings_page.dart';
import 'package:flutter_f6sny/screens/splash_page.dart';
import 'package:flutter_f6sny/screens/tags_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/themes/theme.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'app_routes.dart';

Future main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const String title = 'Settings';
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Settings.getValue<bool>('key-dark-mode');

    return ValueChangeObserver(
      cacheKey: 'key-dark-mode',
      defaultValue: true,
      builder: (_, isDarkMode, __) => CupertinoApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('ar'),
          title: 'F6sny',
          initialRoute: '/',
          routes: {
            AppRoutes.home: (context) => const HomePage(),
            AppRoutes.search: (context) => SearchPage(),
            AppRoutes.tags: (context) => const TagsPage(),
            AppRoutes.settings: (context) => const SettingsPage(),
          },
          theme: buildThemeData(isDarkMode),
          home: const SplashPage()),
    );
  }
}
