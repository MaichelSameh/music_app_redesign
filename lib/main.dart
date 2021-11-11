import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/palette.dart';
import 'controllers/controllers.dart';
import 'screens/screens.dart';

void main() {
  Get.put<AppLocalizationController>(AppLocalizationController.empty());
  Get.put<UserController>(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TestingScreen(),
      // initialRoute: TestingScreen.route_name,
      routes: {
        TestingScreen.route_name: (_) =>
            const TestingScreen(key: Key("testing_screen")),
      },
      theme: ThemeData(
        fontFamily: "Helvetica",
        canvasColor: MyPalette.primary_color,
        scaffoldBackgroundColor: MyPalette.primary_color,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: MyPalette.secondary_color,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Color.fromRGBO(23, 23, 23, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Color.fromRGBO(54, 54, 54, 1),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(54, 54, 54, 1),
            fontSize: 11,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
