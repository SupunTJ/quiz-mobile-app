import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';
import 'package:mobile_quiz_app/screens/home/home_screen.dart';
import 'package:mobile_quiz_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star,
                size: 65,
                
                ),
              const SizedBox(height: 40,),
              const Text(
               textAlign: TextAlign.center,
               "This is a Study app. You can youse it as you want. Use it wisely!",
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40,),
              AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
                child: const Icon(Icons.arrow_forward, size: 35,)
              ),
            ],
          ),
        ),
        ),
    );
  } 
}

// ElevatedButton.icon(
//                   onPressed: () => Get.offNamed("/home"),
//                   icon: Icon(Icons.arrow_forward, size: 35),
//                   label: Text(''), // the label text here.
//                 ),