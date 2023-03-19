import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppCircleButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? ontap;
  const AppCircleButton(
      {super.key,
      required this.child,
      this.color,
      this.width = 60,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: ontap,
        child: child,
      ),
      // shape: CircleBorder(),
    );
  }
}
