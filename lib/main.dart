import 'package:flutter/material.dart';
import 'package:flutter_f6sny/screens/about.dart';
import 'package:flutter_f6sny/screens/home.dart';
import 'package:flutter_f6sny/screens/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale("en"),
        title: 'F6sny',
        initialRoute: '/',
        routes: {
          '/home': (context) => const Home(title: 'آخر النكت'),
          '/about': (context) => const About(),
        },
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const Splash());
  }
}
