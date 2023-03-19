import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:firebase_master_class/controller/question_paper/question_controller.dart';
import 'package:firebase_master_class/controller/question_paper/question_controller_extension.dart';
import 'package:firebase_master_class/widgets/content_area.dart';
import 'package:firebase_master_class/widgets/questions/answer_card.dart';
import 'package:firebase_master_class/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../configs/custom_text_style.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/main_button.dart';
import 'answer_check_screen.dart';

class ResultScreen extends GetView<QuestionController> {
  static const String routeName = '/resultscreen';
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.allQuestions.length);
    Color _textcolor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: SizedBox(
            height: 80,
          ),
          title: controller.CorrectAnsweredQuestions.toString(),
        ),
        body: BackGroundDecoration(
          child: Column(
            children: [
              Expanded(
                child: ContentArea(
                    child: Column(
                  children: [
                    SvgPicture.asset('assets/images/bulb.svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                      child: Text(
                        "Congratulations",
                        style: HeaderText.copyWith(color: _textcolor),
                      ),
                    ),
                    Text(
                      "you have got ${controller.points} point",
                      style: TextStyle(color: _textcolor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Tap below question number to view correct answer",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                        child: GridView.builder(
                            itemCount: controller.allQuestions.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: Get.width ~/ 75,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                            itemBuilder: (_, index) {
                              final _questions = controller.allQuestions[index];
                              AnswerStatus _status = AnswerStatus.notanswered;
                              final _selectedAnswer = _questions.selectedAnswer;
                              final _correctAnswer = _questions.correctAnswer;
                              if (_selectedAnswer == _correctAnswer) {
                                _status = AnswerStatus.correct;
                              } else if (_questions.selectedAnswer == null) {
                                _status = AnswerStatus.wrong;
                              } else {
                                _status = AnswerStatus.wrong;
                              }
                              return QuestionNumberCard(
                                index: index + 1,
                                ontap: () {
                                  controller.JumptoQuestion(index,
                                      isGoback: false);
                                  Get.toNamed(AnswerCheckScreen.routeName);
                                },
                                status: _status,
                              );
                            }))
                  ],
                )),
              ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIparameters.mobilescreenpadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                          color: Colors.blueGrey,
                          title: "Try again",
                          ontap: () {
                            controller.tryagain();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: MainButton(
                          ontap: () {
                            controller.saveTestResullt();
                          },
                          title: "Go home",
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
