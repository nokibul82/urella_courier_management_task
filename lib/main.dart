import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/login_controller.dart';
import './views/screens/login_screen.dart';
import './views/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: Obx(() {
          return loginController.isAuth.value ? const MainScreen() : const LoginScreen();
        }
      ),
    );
  }
}
