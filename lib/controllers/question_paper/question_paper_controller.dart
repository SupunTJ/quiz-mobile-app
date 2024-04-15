import 'package:get/get.dart';
import 'package:mobile_quiz_app/controllers/question_paper/app_logger.dart';
import 'package:mobile_quiz_app/controllers/question_paper/auth_controller.dart';
import 'package:mobile_quiz_app/firebase_ref/references.dart';
import 'package:mobile_quiz_app/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_quiz_app/screens/questions/questions_screen.dart';
import 'package:mobile_quiz_app/services/firebase_storage_service.dart';
import 'auth_controller.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];

    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();

      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        // allPaperImages.add(imgUrl!);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
      //print("Successful");
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthConatroller _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        Get.toNamed(QuestionsScreen.routeName,
            arguments: paper, preventDuplicates: false);
        //Get.offNamed();
      } else {
        //print("logged in");

        Get.toNamed(QuestionsScreen.routeName, arguments: paper); // route
      }
    } else {
      print('The title is ${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
