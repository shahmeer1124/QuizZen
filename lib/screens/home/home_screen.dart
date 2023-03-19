import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_master_class/controller/question_paper_controller.dart';
import 'package:firebase_master_class/screens/home/question_card.dart';
import 'package:firebase_master_class/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../configs/custom_text_style.dart';
import '../../configs/themes/app_color.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controller/zoom_drawer_controller.dart';
import '../../widgets/content_area.dart';
import 'menu_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});
  static const routename = "/home";


  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionpapercontrller = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(
      builder: (_) {
        return Container(
          child: ZoomDrawer(
            borderRadius: 50,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            slideWidth: MediaQuery.of(context).size.width * 0.9,
            controller: _.zoomdrawercontroller,
            menuScreen: Container(
              width: MediaQuery.of(context).size.width,
              child: MenuScreen(),
            ),
            mainScreen: Container(
                decoration: BoxDecoration(gradient: mainGradient()),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(mobileScreenpadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppCircleButton(
                              ontap: controller.toogleDrawer,
                              child: const Icon(
                                AppIcons.menuLeft,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    AppIcons.peace,
                                  ),
                                  Text(
                                    "Hello friend",
                                    style: DetailText.copyWith(
                                      color: surfaceTextColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "What do you want to learn today?",
                              style: HeaderText,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ContentArea(
                            addpadding: false,
                            child: Obx(
                              () => ListView.separated(
                                padding: UIparameters.mobilescreenpadding,
                                itemBuilder: (BuildContext context, int index) {
                                  return QuestionCard(
                                    model: _questionpapercontrller
                                        .allpapers[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount:
                                    _questionpapercontrller.allpapers.length,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    ));
  }
}
