import 'package:flutter/material.dart';
import 'package:music_app_redesign/models/models.dart';

import '../widgets/widgets.dart';

class TestingScreen extends StatelessWidget {
  // ignore: constant_identifier_names
  static const String route_name = "testing_screen";
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          const Spacer(),
          SongContainer(
            song: SongInfo.empty(),
            artistName: "Maichel",
          ),
          const Spacer(),
          const CustomNavBar(currentPage: 0),
        ],
      ),
    );
  }
}
