import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_master_class/controller/theme_controller.dart';
import 'package:firebase_master_class/routes/app_routes.dart';
import 'package:firebase_master_class/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/initial_binding.dart';
import 'firebase_options.dart';

void main() async {
  Get.put(FirebaseStorageService());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InitialBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.put(ThemeController()).lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
