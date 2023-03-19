import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../configs/themes/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient()
        ),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/app_splash_logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
