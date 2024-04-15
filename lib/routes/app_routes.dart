import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:mobile_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:mobile_quiz_app/controllers/question_paper/zoom_drawer_controller.dart';
import 'package:mobile_quiz_app/models/question_paper_model.dart';
import 'package:mobile_quiz_app/screens/home/home_screen.dart';
import 'package:mobile_quiz_app/screens/introduction/introduction.dart';
import 'package:mobile_quiz_app/screens/login/login_screen.dart';
import 'package:mobile_quiz_app/screens/login/register_screen.dart';
import 'package:mobile_quiz_app/screens/questions/answer_check_screen.dart';
import 'package:mobile_quiz_app/screens/questions/questions_screen.dart';
import 'package:mobile_quiz_app/screens/questions/result_screen.dart';
import 'package:mobile_quiz_app/screens/questions/test_overview_screen.dart';
import 'package:mobile_quiz_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => const AnswerCheckScreen(),
        ),
        GetPage(
          name: RegisterScreen.routeName,
          page: () => RegisterScreen(),
        )
      ];
}
