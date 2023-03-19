import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_master_class/controller/question_paper/question_controller.dart';
import 'package:firebase_master_class/question_paper_model.dart';
import 'package:get/get.dart';

import '../../firebase_ref/reference.dart';
import '../auth_controller.dart';

extension QuestionControllerExtension on QuestionController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get CorrectAnsweredQuestions {
    return "$correctQuestionCount out of ${allQuestions.length} are correct";
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionpaper.timeSeconds - remainSeconds) /
        questionpaper.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResullt() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getuser();
    if (_user == null) return;
    batch.set(
        UserRf.doc(_user.email)
            .collection("my_recent_test")
            .doc(questionpaper.id),
        {
          "points": points,
          "correct_answer": "$correctQuestionCount/${allQuestions.length}",
          "question_id": questionpaper.id,
          "time": questionpaper.timeSeconds - remainSeconds
        });
    batch.commit();
    navigatetohomepage();
  }
}

// rules_version = '2';
// service cloud.firestore {
//   match /databases/{database}/documents {
//     match /questionPaper/{document=**} {
//       allow read;
//       allow write: if request.auth != null;
//     }
//     match /users/{email} {
//       allow read;
//       allow write: if request.auth != null && request.auth.token.email == email;
//     }
//   }
// }