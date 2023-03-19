import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:firebase_master_class/controller/question_paper/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../configs/custom_text_style.dart';
import '../../configs/themes/app_color.dart';
import '../../firebase_ref/loading_status.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/main_button.dart';
import '../../widgets/common/question_placeholder.dart';
import '../../widgets/content_area.dart';
import '../../widgets/questions/answer_card.dart';
import '../../widgets/questions/countdown_timer.dart';
import 'test_overview_screen.dart';
import 'test_overview_screen.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({super.key});
  static const routename = "/question_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
              "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
              style: appBarTs,
            )),
        showActionIcon: true,
        leading: Container(
          decoration: ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(color: surfaceTextColor, width: 2))),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Obx(() => CountDownTimer(
                time: controller.time.value,
                color: surfaceTextColor,
              )),
        ),
      ),
      body: BackGroundDecoration(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingstatus.value == LoadingStatus.loading)
                    const Expanded(
                        child: ContentArea(child: QuestionScreenHolder())),
                  if (controller.loadingstatus.value == LoadingStatus.completed)
                    Expanded(
                      child: ContentArea(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(top: 25),
                          child: Column(
                            children: [
                              Text(
                                controller.currentQuestion.value!.question,
                                style: QuestionText,
                              ),
                              GetBuilder<QuestionController>(
                                  id: "answers_list",
                                  builder: (context) {
                                    return ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(top: 25),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final answer = controller
                                              .currentQuestion
                                              .value!
                                              .answers[index];
                                          return AnswerCard(
                                            answer:
                                                "${answer.identifier}. ${answer.answer}",
                                            ontap: () {
                                              controller.selectedanswer(
                                                  answer.identifier);
                                            },
                                            isselected: answer.identifier ==
                                                controller.currentQuestion
                                                    .value!.selectedAnswer,
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                        itemCount: controller.currentQuestion
                                            .value!.answers.length);
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: UIparameters.mobilescreenpadding,
                      child: Row(
                        children: [
                          Visibility(
                              visible: controller.isFirstQuestion,
                              child: SizedBox(
                                width: 55,
                                height: 55,
                                child: MainButton(
                                  color: Get.isDarkMode
                                      ? surfaceTextColor
                                      : Theme.of(context).primaryColor,
                                  ontap: () {
                                    controller.previousQuestion();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Visibility(
                              visible: controller.loadingstatus.value ==
                                  LoadingStatus.completed,
                              child: Expanded(
                                child: MainButton(
                                    title: controller.isLastquestion
                                        ? "Submit"
                                        : "Next",
                                    ontap: () {
                                      controller.isLastquestion
                                          ? Get.toNamed(
                                              TestOverViewScreen.routeName)
                                          : controller.nextQuestion();
                                    }),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
