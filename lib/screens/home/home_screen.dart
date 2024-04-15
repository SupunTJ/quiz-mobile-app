import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';
import 'package:mobile_quiz_app/configs/themes/app_icons.dart';
import 'package:mobile_quiz_app/configs/themes/custom_text_styles.dart';
import 'package:mobile_quiz_app/configs/themes/ui_parameters.dart';
import 'package:mobile_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile_quiz_app/controllers/question_paper/zoom_drawer_controller.dart';
import 'package:mobile_quiz_app/screens/home/menu_screen.dart';
import 'package:mobile_quiz_app/screens/home/question_card.dart';
import 'package:mobile_quiz_app/widgets/app_circle_button.dart';
import 'package:mobile_quiz_app/widgets/content_area.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    List<Widget> carouselItems = [
      GestureDetector(
        onTap: () => controller.carouselWebBiology(),
        // _launchUrl(
        //     "https://www.google.com/"), // Replace with your actual URL
        child: Container(
          width: 300,
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/biology.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => controller.carouselWebChemisry(),
        // _launchUrl(
        //     "https://www.youtube.com/"), // Replace with your actual URL
        child: Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/chemistry.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => controller.carouselWebMaths(),
        // _launchUrl(
        //     "https://www.youtube.com/"), // Replace with your actual URL
        child: Container(
          width: 250,
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/maths.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => controller.carouselWebPhysics(),
        // _launchUrl(
        //     "https://www.youtube.com/"), // Replace with your actual URL
        child: Container(
          width: 200,
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/phys.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      // Add more items as needed
    ];

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          controller: _.zoomDrawerController,
          slideWidth: MediaQuery.of(context).size.width * 1.4,
          menuScreen: MyMenuScreen(),
          mainScreen: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            AppCircleButton(
                                onTap: controller.toggleDrawer,
                                child: const Icon(AppIcons.menuLeft,
                                    color: Colors.red)),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Welcome to Quiz Master",
                              style: headerText.copyWith(
                                  color: onSurfaceTextColor),
                            ),
                          ]),
                        ],
                      ),
                    ),

                    // Carousel Widget
                    // const SizedBox(
                    //   height: 213,
                    // ),
                    CarouselSlider(
                      items: carouselItems,
                      options: CarouselOptions(
                        height: 213.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // QuestionCards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Expanded(
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(
                            () => ListView.separated(
                                padding: UIParameters.mobileScreenPadding,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return QuestionCard(
                                      model: _questionPaperController
                                          .allPapers[index]);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount:
                                    _questionPaperController.allPapers.length),
                          ),
                        ),
                      ),
                    ),

                    // Nav Bar
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  // Function to launch a URL
  _launchUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
