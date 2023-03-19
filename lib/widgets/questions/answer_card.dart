import 'package:firebase_master_class/configs/themes/app_color.dart';
import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../controller/question_paper/question_controller.dart';

enum AnswerStatus { correct, wrong, answered, notanswered }

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isselected;
  final VoidCallback ontap;
  const AnswerCard(
      {super.key,
      required this.answer,
      this.isselected = false,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIparameters.cardBorderRadius,
      onTap: ontap,
      child: Ink(
        child: Text(
          answer,
          style: TextStyle(color: isselected ? surfaceTextColor : null),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    isselected ? answerSelectedColor() : answerBorderColor()),
            borderRadius: UIparameters.cardBorderRadius,
            color: isselected
                ? answerSelectedColor()
                : Theme.of(context).cardColor),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  final String answer;
  const CorrectAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: UIparameters.cardBorderRadius,
          color: correctAnswercolor.withOpacity(0.1)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
            color: correctAnswercolor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  final String answer;
  const WrongAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: UIparameters.cardBorderRadius,
          color: wrongAnswerColor.withOpacity(0.1)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
            color: wrongAnswerColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  final String answer;
  const NotAnswered({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: UIparameters.cardBorderRadius,
          color: correctAnswercolor.withOpacity(0.1)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
            color: notansweredColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
