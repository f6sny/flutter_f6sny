import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/pages/my_home_page.dart';

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
        body: Center(
            child: Column(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/images/Logo.png',
                height: 150,
              ),
            ),
            const Text("بكل ❤️ من الدرجات الست")
          ],
        )),
      ),
      nextScreen: const MyHomePage(title: "آخر النكت"),
      duration: 2500,
    );
  }
}
