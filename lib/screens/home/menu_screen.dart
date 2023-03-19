// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_master_class/configs/themes/app_color.dart';
import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:firebase_master_class/controller/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIparameters.mobilescreenpadding,
      width: double.infinity,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: surfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                  children: [
                    Obx(() => controller.user.value == null
                        ? SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: surfaceTextColor,
                            ),
                          )),
                    Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(
                      icon: Icons.web,
                      label: "Website",
                      onpressed: () => controller.website(),
                    ),
                    _DrawerButton(
                      icon: Icons.facebook,
                      label: "facebook",
                      onpressed: () => controller.facebook(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: _DrawerButton(
                        icon: Icons.email,
                        label: "email",
                        onpressed: () => controller.email(),
                      ),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    _DrawerButton(
                      icon: Icons.logout,
                      label: "LogOut",
                      onpressed: () => controller.signOut(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onpressed;
  const _DrawerButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed:  onpressed,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
