import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child:
            // Lottie.network(
            //     "https://lottie.host/6f7746a0-51d2-47c2-a55b-2db4cc98d4c0/aQOK7oN0NL.json",
            //     width: 350),

            Image.asset(
          "assets/images/splash.gif",
          width: 300,
          height: 300,
        ),
      ),
      // Image.asset(
      //   "assets/images/splash.gif",
      //   width: 400,
      //   height: 400,
      // ),
    );
  }
}
