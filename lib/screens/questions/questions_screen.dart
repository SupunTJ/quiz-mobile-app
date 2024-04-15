import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';
import 'package:mobile_quiz_app/configs/themes/custom_text_styles.dart';
import 'package:mobile_quiz_app/configs/themes/ui_parameters.dart';
import 'package:mobile_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:mobile_quiz_app/firebase_ref/loading_status.dart';
import 'package:mobile_quiz_app/screens/questions/test_overview_screen.dart';
import 'package:mobile_quiz_app/widgets/common/background_decoration.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/widgets/common/custom_app_bar.dart';
import 'package:mobile_quiz_app/widgets/common/main_button.dart';
import 'package:mobile_quiz_app/widgets/common/question_place_holder.dart';
import 'package:mobile_quiz_app/widgets/content_area.dart';
import 'package:mobile_quiz_app/widgets/questions/answer_card.dart';
import 'package:mobile_quiz_app/widgets/questions/count_down_timer.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const ShapeDecoration(
              shape: StadiumBorder(
                side: BorderSide(
                  color: onSurfaceTextColor,
                  width: 2,
                ),
              ),
            ),
            child: Obx(() => CountDownTimer(
                  time: controller.time.value,
                  color: onSurfaceTextColor,
                )),
          ),
          showActionIcon: true,
          titleWidget: Obx(
            () => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
              style: appBarTS,
            ),
          )),
          
      body: BackgroundDecoration( 
          child: Center(
              child: Obx(() => Column(children: [
                    if (controller.loadingStatus.value == LoadingStatus.loading)
                      const Expanded(
                          child: ContentArea(child: QuestionScreenHolder())),
                    if (controller.loadingStatus.value ==
                        LoadingStatus.completed)
                      Expanded(
                          child: ContentArea(
                              child: SingleChildScrollView(
                                  padding: const EdgeInsets.only(
                                      top: 25, left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.currentQuestion.value!
                                            .question, // printing the question
                                        style: questionTS,
                                      ),
                                      GetBuilder<QuestionsController>(
                                          id: 'answers_list',
                                          builder: (context) {
                                            return ListView.separated(
                                                shrinkWrap: true,
                                                padding: const EdgeInsets.only(
                                                    top: 25,
                                                    left: 15,
                                                    right: 15),
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final answer = controller
                                                      .currentQuestion
                                                      .value!
                                                      .answers[index];

                                                  return AnswerCard(
                                                    answer:
                                                        '${answer.identifire}. ${answer.answer}',
                                                    onTap: () {
                                                      controller.selectedAnswer(
                                                          answer.identifire);
                                                    },
                                                    isSelected:
                                                        answer.identifire ==
                                                            controller
                                                                .currentQuestion
                                                                .value!
                                                                .selectedAnswer,
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                            int index) =>
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                itemCount: controller
                                                    .currentQuestion
                                                    .value!
                                                    .answers
                                                    .length);
                                          }),
                                    ],
                                  )))),
                    ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: UIParameters.mobileScreenPadding,
                        child: Row(children: [
                          Visibility(
                            visible: controller.isFirstQuestion,
                            child: SizedBox(
                              width: 55,
                              height: 55,
                              child: MainButton(
                                onTap: () {
                                  controller.prevQuestion();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Get.isDarkMode
                                      ? onSurfaceTextColor
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Visibility(
                                visible: controller.loadingStatus.value ==
                                    LoadingStatus.completed,
                                child: MainButton(
                                  onTap: () {
                                    controller.isLastQuestion
                                        ? Get.toNamed(
                                            TestOverviewScreen.routeName)
                                        : controller.nextQuestion();
                                  },
                                  title: controller.isLastQuestion
                                      ? 'Complete'
                                      : 'Next',
                                )),
                          )
                        ]),
                      ),
                    )
                  ])))),
    );
  }
}
