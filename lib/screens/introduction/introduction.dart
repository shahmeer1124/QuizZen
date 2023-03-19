import 'package:firebase_master_class/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_color.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 65,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'This is a study app you can use it as you want.If you understand how it works you will be able to scale it.With this you will master firebase backend and flutter front end',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: surfaceTextColor),
              ),
              SizedBox(
                height: 40,
              ),
              AppCircleButton(
                ontap: () => Get.toNamed('/home'),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
