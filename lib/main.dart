import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/screens/search.dart';
import 'package:flutter_f6sny/screens/settings.dart';
import 'package:flutter_f6sny/screens/home.dart';
import 'package:flutter_f6sny/screens/splash.dart';
import 'package:flutter_f6sny/screens/tags.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ar'),
        title: 'F6sny',
        initialRoute: '/',
        routes: {
          AppRoutes.home: (context) => const Home(),
          AppRoutes.search: (context) => const Search(),
          AppRoutes.tags: (context) => const Tags(),
          AppRoutes.settings: (context) => const Settings(),
        },
        theme: buildThemeData(),
        home: const Splash());
  }
}
