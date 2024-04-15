import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile_quiz_app/configs/themes/app_icons.dart';
import 'package:mobile_quiz_app/configs/themes/custom_text_styles.dart';
import 'package:mobile_quiz_app/configs/themes/ui_parameters.dart';
import 'package:mobile_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:mobile_quiz_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/widgets/app_icon_text.dart';

import '../../configs/themes/app_icons.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: Theme.of(context).cardColor),
        child: InkWell(
          // onTap Method
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(model.title),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(model.description),
                        // Add more text information if needed
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Continue'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        controller.navigateToQuestions(
                            paper: model, tryAgain: false);
                      },
                    ),
                  ],
                );
              },
            );
            // controller.navigateToQuestions(paper: model, tryAgain: false);
          },
          child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColoredBox(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          child: SizedBox(
                            height: Get.height * 0.08,
                            width: Get.width * 0.17,
                            child: CachedNetworkImage(
                              imageUrl: model.imageUrl!,
                              placeholder: (context, url) => Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                  "assets/images/app_splash_logo.png"),
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            style: cartTitles(context),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            // child: Text(
                            //   model.description,
                            // ),
                          ),
                          Row(
                            children: [
                              AppIconText(
                                  icon: Icon(
                                    Icons.help_outline_sharp,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  ),
                                  text: Text(
                                    '${model.questionCount} questions',
                                    style: detailText.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              AppIconText(
                                  icon: Icon(
                                    Icons.timer,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  ),
                                  text: Text(
                                    '${model.timeInMinits()}',
                                    style: detailText.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: -_padding,
                    right: -_padding,
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 15,
                        ),
                        child: Icon(AppIcons.trophyOutline),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cardBorderRadius),
                              bottomRight: Radius.circular(cardBorderRadius),
                            ),
                            color: Theme.of(context).primaryColor),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
