import 'package:firebase_master_class/configs/themes/app_color.dart';
import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:firebase_master_class/widgets/questions/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class QuestionNumberCard extends StatelessWidget {
  final int index;
  final AnswerStatus? status;
  final VoidCallback ontap;

  const QuestionNumberCard(
      {super.key,
      required this.index,
      required this.status,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    Color _backgroundcolor = Theme.of(context).primaryColor;

    switch (status) {
      case AnswerStatus.answered:
        _backgroundcolor = Get.isDarkMode
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor;
        break;

      case AnswerStatus.correct:
        _backgroundcolor = correctAnswercolor;
        break;

      case AnswerStatus.wrong:
        _backgroundcolor = wrongAnswerColor;
        break;

      case AnswerStatus.notanswered:
        _backgroundcolor = Get.isDarkMode
            ? Colors.red.withOpacity(0.5)
            : Theme.of(context).primaryColor.withOpacity(0.5);
        break;

      default:
        _backgroundcolor = Theme.of(context).primaryColor.withOpacity(0.1);
    }

    return InkWell(
      onTap: ontap,
      borderRadius: UIparameters.cardBorderRadius,
      child: Ink(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: _backgroundcolor,
            borderRadius: UIparameters.cardBorderRadius),
        child: Center(
          child: Text(
            "$index",
            style: TextStyle(
                color: status == AnswerStatus.notanswered
                    ? Theme.of(context).primaryColor
                    : null),
          ),
        ),
      ),
    );
  }
}
