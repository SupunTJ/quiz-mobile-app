import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/controllers/question_paper/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthConatroller>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthConatroller>().signOut();
    print("logged out 1");
  }

  void signIn() {}

  void recentScores() {
    _launch("/");
  }

  void physics() {
    _launch("https://www.mathsapi.com/2017/09/physics-notes.html");
  }

  void chemistry() {
    _launch(
        "https://www.mathsapi.com/2018/11/advanced-level-chemistry-notes.html");
  }

  void maths() {
    _launch("https://www.mathsapi.com/2017/09/combined-maths-notes.html");
  }

  void biology() {
    _launch(
        "https://www.mathsapi.com/2021/04/gce-advanced-level-al-biology-notes.html");
  }

  void carouselWebBiology() {
    _launch(
        "https://www.youtube.com/playlist?list=PLmLnnsAHQpTaD1C1bTuQFjIF14tD4Xz5b");
  }

  void carouselWebChemisry() {
    _launch(
        "https://www.youtube.com/playlist?list=PLfak6pT2ExJ2bUqVUxB19KFjSsLG7QztH");
  }

  void carouselWebMaths() {
    _launch(
        "https://www.youtube.com/playlist?list=PLcUOoycaDS-kRa7WMbzSxUYOXNcuJFPZR");
  }

  void carouselWebPhysics() {
    _launch(
        "https://www.youtube.com/playlist?list=PLsPevjuqTZjaSJ1sFOjupFZsJRUV7Jmor");
  }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'jayaweeraspn@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) throw 'could not launch $url';
  }
}
