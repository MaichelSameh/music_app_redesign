import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
    Get.put<RecentActivityController>(RecentActivityController());
    return GetBuilder<AppLocalizationController>(builder: (localization) {
      return MaterialApp(
        locale: localization.currentLocale,
        localizationsDelegates: [
          AppLocalizationController.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: localization.locales,
        initialRoute: MusicLibraryScreen.route_name,
        routes: {
          MusicLibraryScreen.route_name: (_) =>
              const MusicLibraryScreen(key: Key(MusicLibraryScreen.route_name)),
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
    });
  }
}
