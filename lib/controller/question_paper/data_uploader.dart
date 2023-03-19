import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_master_class/firebase_ref/loading_status.dart';
import 'package:firebase_master_class/firebase_ref/reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingstatus = LoadingStatus.loading.obs;
  void uploadData() async {
    loadingstatus.value = LoadingStatus.loading;
    final firestore = FirebaseFirestore.instance;
    final ManifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> ManifestMap = json.decode(ManifestContent);
    final PapersinAssets = ManifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/papers') && path.contains('.json'))
        .toList();
    print(PapersinAssets);
    List<questionPaperModel> questionpaperList = [];
    for (var paper in PapersinAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionpaperList
          .add(questionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    print("items length ${questionpaperList[0].id}");
    var batch = firestore.batch();
    for (var paper in questionpaperList) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "question_count": paper.questions == null ? 0 : paper.questions!.length,
      });
      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection('answers').doc(answer.identifier),
              {"identifier": answer.identifier, "answers": answer.answer});
        }
      }
    }
    await batch.commit();
    loadingstatus.value = LoadingStatus.completed;
  }
}
