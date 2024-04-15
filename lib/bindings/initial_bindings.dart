import 'package:get/get.dart';
import 'package:mobile_quiz_app/controllers/question_paper/auth_controller.dart';
import 'package:mobile_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:mobile_quiz_app/controllers/question_paper/theme_controller.dart';
import 'package:mobile_quiz_app/services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthConatroller(), permanent: true);
    //Get.put(NotificationService());
    //Get.put(FirebaseStorageService());
    Get.lazyPut(() => FirebaseStorageService());
    Get.lazyPut(() => QuestionsController());
  }
}
//"Get.put(QuestionsController())" or "Get.lazyPut(()=>QuestionsController())"