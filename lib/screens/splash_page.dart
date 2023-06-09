import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_f6sny/navigation/tab_scaffold.dart';
import 'package:flutter_f6sny/themes/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: myColors["AnimatedSplashScreen"]["backgroundColor"],
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      splashIconSize: double.infinity,
      splash: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Image.asset(
                './assets/images/splash/SplashScreenMain.png',
              ),
            ),
            Image.asset('./assets/images/splash/SplashScreenSecondary.png',
                height: 100),
          ],
        ),
      ),
      nextScreen: const Main(),
      duration: 2500,
    );
  }
}
