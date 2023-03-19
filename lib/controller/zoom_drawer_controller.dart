import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_master_class/controller/auth_controller.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController {
  final zoomdrawercontroller = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getuser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomdrawercontroller.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}
  void website() {
    _launch('www.google.com'); 
  }
  void facebook() {
    _launch('www.facebook.com'); 
  }

  void email() {
    final Uri emaillaunchUri =
        Uri(scheme: "mailto", path: "muhammadshahmeer544@gmail.com");
    _launch(emaillaunchUri.toString());
  }

  _launch(String url) async {
    if (!await _launch(url)) {
      throw "could not launch $url";
    }
  }
}
