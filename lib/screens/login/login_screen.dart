import 'package:firebase_master_class/configs/themes/app_color.dart';
import 'package:firebase_master_class/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});
  static const routename = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: Text(
                "This is a study app you can use this as you want you have full access to all the material in the course",
                style: TextStyle(
                  color: surfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            MainButton(
              ontap: () {
                controller.signInWithGoogle();
               },
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: SvgPicture.asset("assets/icons/google.svg")),
                  Center(
                    child: Text(
                      "Sign in with google",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
