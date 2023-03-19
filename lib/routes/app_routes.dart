import 'package:firebase_master_class/controller/question_paper_controller.dart';
import 'package:firebase_master_class/controller/zoom_drawer_controller.dart';
import 'package:firebase_master_class/screens/introduction/introduction.dart';
import 'package:firebase_master_class/screens/questions/question_screen.dart';
import 'package:firebase_master_class/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../controller/question_paper/question_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/questions/answer_check_screen.dart';
import '../screens/questions/result_screen.dart';
import '../screens/questions/test_overview_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/answercheckscreen', page: () => AnswerCheckScreen()),

        GetPage(name: '/resultscreen', page: () => ResultScreen()),

        GetPage(name: '/introduction', page: () => AppIntroductionScreen()),
        GetPage(name: QuestionScreen.routename, page: () => QuestionScreen(),binding: BindingsBuilder(() {
            Get.put<QuestionController>(QuestionController());
          }),),
        GetPage(
            name: '/home',
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
          name: LoginScreen.routename,
          page: () => LoginScreen(),
          
        ),
        GetPage(
          name: TestOverViewScreen.routeName,
          page: () => TestOverViewScreen(),
          
        ),
      ];
}
