import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Screens/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
    return AnimatedSplashScreen(
        backgroundColor: Colors.blue,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        animationDuration: Duration(seconds: 1),
        splash: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cloud",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.white)),
            Text("Ager",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.orange))
          ],
        ),
        nextScreen: HomePage());
  }
}
