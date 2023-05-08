import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/screens/search.dart';
import 'package:flutter_f6sny/screens/settings.dart';
import 'package:flutter_f6sny/screens/home.dart';
import 'package:flutter_f6sny/screens/splash.dart';
import 'package:flutter_f6sny/screens/tags.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  CupertinoThemeData _buildThemeData() {
    return const CupertinoThemeData(
      barBackgroundColor: Color.fromARGB(255, 255, 230, 0),
      scaffoldBackgroundColor: Color.fromARGB(255, 245, 245, 245),
      primaryColor: Color.fromARGB(255, 115, 98, 0),
      primaryContrastingColor: Colors.green,
      textTheme: CupertinoTextThemeData(
        textStyle:
            TextStyle(fontSize: constants.fontSize, color: Colors.black87),
        tabLabelTextStyle: TextStyle(color: Colors.black87),
        navTitleTextStyle: TextStyle(
            color: Colors.black87, fontSize: constants.fontSize * 1.4),
        primaryColor: Colors.pink,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale("ar"),
        title: 'F6sny',
        initialRoute: '/',
        routes: {
          AppRoutes.home: (context) => const Home(),
          AppRoutes.search: (context) => const Search(),
          AppRoutes.tags: (context) => const Tags(),
          AppRoutes.settings: (context) => const Settings(),
        },
        theme: _buildThemeData(),
        home: const Splash());
  }
}
