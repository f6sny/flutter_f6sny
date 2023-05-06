import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/screens/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color.fromARGB(255, 255, 208, 0),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      splash: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Image.asset('assets/images/splash/SplashScreenMain.png'),
            Image.asset('assets/images/splash/SplashScreenSecondary.png')
          ],
        ),
      ),
      nextScreen: Home(title: AppLocalizations.of(context)!.timeline),
      duration: 2500,
    );
  }
}
