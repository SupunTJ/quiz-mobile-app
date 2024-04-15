import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/bindings/initial_bindings.dart';
import 'package:mobile_quiz_app/configs/themes/app_dark_theme.dart';
import 'package:mobile_quiz_app/configs/themes/app_light_theme.dart';
import 'package:mobile_quiz_app/controllers/question_paper/theme_controller.dart';
import 'package:mobile_quiz_app/data_uploader_screen.dart';
import 'package:mobile_quiz_app/firebase_options.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/routes/app_routes.dart';
import 'package:mobile_quiz_app/screens/introduction/introduction.dart';
import 'package:mobile_quiz_app/screens/splash/splash_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home:DataUploaderScreen()));
// }

//  Future<void> initFireBase() async {
//   await Firebase.initializeApp(
//     //  name: name,
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
// }

//  void main(List<String> args) async {
//    WidgetsFlutterBinding.ensureInitialized();
//    await initFireBase();
//    runApp(GetMaterialApp(
//      home: DataUploaderScreen(),
//    ));
//  }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: DarkTheme().buildDarkTheme(),
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
