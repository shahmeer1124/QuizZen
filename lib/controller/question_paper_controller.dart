import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_master_class/controller/auth_controller.dart';
import 'package:firebase_master_class/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../firebase_ref/reference.dart';
import '../question_paper_model.dart';
import '../screens/questions/question_screen.dart';

class QuestionPaperController extends GetxController {
  final allpapersImages = <String>[].obs;
  final allpapers = <questionPaperModel>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getallpapers();
    super.onReady();
  }

  Future<void> getallpapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final PaperList = data.docs
          .map((paper) => questionPaperModel.fromSnapshot(paper))
          .toList();
      allpapers.assignAll(PaperList);
      for (var paper in PaperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl!;
      }
      allpapers.assignAll(PaperList);
    } catch (e) {}
  }

  void navigatetoQuestions(
      {required questionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isloggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed("");
        Get.toNamed(QuestionScreen.routename,
            arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuestionScreen.routename, arguments: paper);
      }
    } else {
      _authController.ShowLoginAlertDialog();
      print("${paper.title}");
    }
  }
}
