import 'package:firebase_master_class/configs/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      this.title = '',
      required this.ontap,
      this.child,
      this.color,
      this.enabled = true});
  final String title;
  VoidCallback ontap;
  final enabled;
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : ontap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color ?? Theme.of(context).cardColor),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child ??
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode
                              ? surfaceTextColor
                              : Theme.of(context).primaryColor),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
