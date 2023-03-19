import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_master_class/controller/auth_controller.dart';
import 'package:firebase_master_class/controller/question_paper/question_controller_extension.dart';
import 'package:firebase_master_class/firebase_ref/reference.dart';
import 'package:firebase_master_class/question_paper_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../firebase_ref/loading_status.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/questions/result_screen.dart';
import '../question_paper_controller.dart';

class QuestionController extends GetxController {
  final loadingstatus = LoadingStatus.loading.obs;
  late questionPaperModel questionpaper;
  final allQuestions = <Questions>[];
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  Timer? _timer;
  int remainSeconds = 1;
  final time = "00.00".obs;

  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastquestion => questionIndex.value >= allQuestions.length - 1;

  @override
  void onReady() {
    final _question_paper = Get.arguments as questionPaperModel;
    loadData(_question_paper);
    super.onReady();
  }

  loadData(questionPaperModel question_paper) async {
    questionpaper = question_paper;
    loadingstatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(question_paper.id)
              .collection("questions")
              .get();
      final questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();
      question_paper.questions = questions;
      for (Questions _question in question_paper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(question_paper.id)
                .collection('questions')
                .doc(_question.id)
                .collection("answers")
                .get();

        final answers = answersQuery.docs
            .map((answer) => Answers.fromSnapShot(answer))
            .toList();
        _question.answers = answers;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    if (questionpaper.questions != null &&
        questionpaper.questions!.isNotEmpty) {
      allQuestions.assignAll(questionpaper.questions!);
      currentQuestion.value = question_paper.questions![0];
      _startTimer(question_paper.timeSeconds);
      loadingstatus.value = LoadingStatus.completed;
    } else {
      loadingstatus.value = LoadingStatus.error;
    }
  }

  void selectedanswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answer_list']);
  }

  String get completedTest {
    final answered = allQuestions
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return "$answered out of ${allQuestions.length} answered";
  }

  void JumptoQuestion(int index, {bool isGoback = true}) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if (isGoback) {
      Get.back();
    }
  }

  void complete() {
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routeName);
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) return;
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void previousQuestion() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
    }
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time.value = minutes.toString().padLeft(2, '0') +
            ":" +
            seconds.toString().padLeft(2, '0');
        remainSeconds--;
      }
    });
  }

  void tryagain() {
    Get.find<QuestionPaperController>()
        .navigatetoQuestions(paper: questionpaper, tryAgain: true);
  }

  void navigatetohomepage() {
    _timer!.cancel();
    Get.offNamedUntil(HomeScreen.routename, (route) => false);
  }
}
