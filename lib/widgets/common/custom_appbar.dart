import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../configs/custom_text_style.dart';
import '../../configs/themes/app_icons.dart';
import '../app_circle_button.dart';
import '../../screens/questions/test_overview_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.showActionIcon = false,
      this.titleWidget,
      this.leading,
      this.onMenuActionTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mobileScreenpadding, vertical: mobileScreenpadding),
        child: Stack(
          children: [
            Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: appBarTs,
                        ),
                      )
                    : Center(
                        child: titleWidget,
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: BackButton(),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(1, 0),
                    child: AppCircleButton(
                      ontap: onMenuActionTap ??
                          () => Get.toNamed(TestOverViewScreen.routeName),
                      child: Icon(
                        AppIcons.menu,
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
