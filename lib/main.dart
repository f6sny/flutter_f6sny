import 'package:flutter/material.dart';
import 'package:flutter_f6sny/screens/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("ar", "SA"),
        title: 'F6sny',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const Splash());
  }
}
