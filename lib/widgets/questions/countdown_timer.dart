import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/custom_text_style.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({super.key, this.color, required this.time});
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: countDownTs().copyWith(color: color),
        )
      ],
    );
  }
}
