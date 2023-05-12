import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/screens/search.dart';
import 'package:flutter_f6sny/screens/settings.dart';
import 'package:flutter_f6sny/screens/home.dart';
import 'package:flutter_f6sny/screens/splash.dart';
import 'package:flutter_f6sny/screens/tags.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';

import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  CupertinoThemeData _buildThemeData() {
    return const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 0, 0, 0),
      primaryContrastingColor: Colors.green,
      barBackgroundColor: Color.fromARGB(255, 225, 169, 0),
      scaffoldBackgroundColor: CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 245, 245, 245),
        darkColor: Color.fromARGB(255, 68, 48, 0),
      ),
      textTheme: CupertinoTextThemeData(
        primaryColor: Colors.pink,
        textStyle: TextStyle(
            color: CupertinoDynamicColor.withBrightness(
              color: Colors.black,
              darkColor: Colors.white,
            ),
            fontSize: constants.fontSize,
            fontWeight: FontWeight.w100),
        actionTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: constants.fontSize,
            fontWeight: FontWeight.w100),
        tabLabelTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: constants.fontSize * 2,
            fontWeight: FontWeight.w100),
        navTitleTextStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: constants.fontSize * 1.2,
            fontWeight: FontWeight.w100),
        navLargeTitleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: constants.fontSize * 1.4,
            fontWeight: FontWeight.w100),
        navActionTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: constants.fontSize,
            fontWeight: FontWeight.w100),
        pickerTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: constants.fontSize,
            fontWeight: FontWeight.w100),
        dateTimePickerTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: constants.fontSize,
            fontWeight: FontWeight.w100),
      ),
    );
  }

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
        theme: _buildThemeData(),
        home: const Splash());
  }
}
