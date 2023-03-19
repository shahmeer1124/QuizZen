import 'package:firebase_master_class/controller/question_paper/question_controller.dart';
import 'package:firebase_master_class/widgets/questions/answer_card.dart';
import 'package:firebase_master_class/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../configs/custom_text_style.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/main_button.dart';
import '../../widgets/content_area.dart';
import '../../widgets/questions/countdown_timer.dart';


class TestOverViewScreen extends GetView<QuestionController> {
  static const String routeName = '/testoverview';
  const TestOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackGroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
            child: Column(
              children: [
                Row(
                  children: [
                    CountDownTimer(
                      time: '',
                      color: UIparameters.isdarkMode()
                          ? Theme.of(context).textTheme.bodyText1!.color
                          : Theme.of(context).primaryColor,
                    ),
                    Obx(() => Text(
                          "${controller.time} Remaining",
                          style: countDownTs(),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: controller.allQuestions.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Get.width ~/ 75,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemBuilder: (_, index) {
                        AnswerStatus? _answerStatus;
                        if (controller.allQuestions[index].selectedAnswer !=
                            null) {
                          _answerStatus = AnswerStatus.answered;
                        }
                        return QuestionNumberCard(
                          index: index + 1,
                          ontap: () => controller.JumptoQuestion(index),
                          status: _answerStatus,
                        );
                      }),
                )
              ],
            ),
          )),
          ColoredBox(
            child: Padding(
                child: MainButton(
                  title: "Complete",
                  ontap: () {
                    controller.complete();
                  },
                ),
                padding: UIparameters.mobilescreenpadding),
            color: Theme.of(context).scaffoldBackgroundColor,
          )
        ],
      )),
    );
  }
}
