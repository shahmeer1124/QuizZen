import 'package:firebase_master_class/screens/questions/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../configs/custom_text_style.dart';
import '../../configs/themes/app_color.dart';
import '../../controller/question_paper/question_controller.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/content_area.dart';
import '../../widgets/questions/answer_card.dart';

class AnswerCheckScreen extends GetView<QuestionController> {
  static const String routeName = '/answercheckscreen';
  const AnswerCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
              "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
              style: appBarTs,
            )),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackGroundDecoration(
        child: Obx(() => Column(
              children: [
                Expanded(
                    child: ContentArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<QuestionController>(
                            id: 'answer_review_lise',
                            builder: (_) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    final selectedanswer = controller
                                        .currentQuestion.value!.selectedAnswer;
                                    final correctanswer = controller
                                        .currentQuestion.value!.correctAnswer;
                                    final String answerText =
                                        "${answer.identifier}. ${answer.answer}";
                                    if (correctanswer == selectedanswer &&
                                        answer.identifier == selectedanswer) {
                                      return CorrectAnswer(
                                        answer: answerText,
                                      );

                                      // correct_answer
                                    } else if (selectedanswer == null) {
                                      return NotAnswered(answer: answerText);
                                      //  not selected
                                    } else if (correctanswer !=
                                            selectedanswer &&
                                        answer.identifier == selectedanswer) {
                                      return WrongAnswer(answer: answerText);
                                    } else if (correctanswer ==
                                        answer.identifier) {
                                      return CorrectAnswer(
                                        answer: answerText,
                                      );
                                    }
                                    return AnswerCard(
                                      answer: answerText,
                                      ontap: () {},
                                      isselected: false,
                                    );
                                  },
                                  separatorBuilder: (_, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length);
                            })
                      ],
                    ),
                  ),
                ))
              ],
            )),
      ),
    );
  }
}

// class CorrectAnswer extends StatelessWidget {
//   final String answer;
//   const CorrectAnswer({super.key,required this.answer});

//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       child: Text(answer,style: TextStyle(
//         color: correctAnswercolor,fontWeight: FontWeight.bold
//       ),),
//     );
//   }
// }
