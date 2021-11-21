import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/localization_controller.dart';
import '../models/size.dart';

enum Category { albums, songs, artists, playLists }

class CategoryCard extends StatelessWidget {
  final Category type;
  late final String imageName;
  late final String name;
  late final String route;
  CategoryCard({Key? key, required this.type}) : super(key: key) {
    switch (type) {
      case Category.albums:
        imageName = "albums_image";
        name = "albums";
        route = "";
        break;
      case Category.songs:
        imageName = "songs_image";
        name = "songs";
        route = "";
        break;
      case Category.artists:
        imageName = "artists_image";
        name = "artists";
        route = "";
        break;
      case Category.playLists:
        imageName = "play_list_image";
        name = "playlist";
        route = "";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(_size.width(20)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: _size.width(150),
            height: _size.height(150),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/$imageName.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: _size.width(150),
              height: _size.height(150),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(250, 87, 193, 1),
                    Color.fromRGBO(177, 102, 204, 1),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          Text(
            Get.find<AppLocalizationController>().getTranslatedValue(name),
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
