import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/recent_activity_controller.dart';
import '../widgets/widgets.dart';
import '../models/size.dart';

class MusicLibraryScreen extends StatelessWidget {
  // ignore: constant_identifier_names
  static const String route_name = "music_library_screen";
  const MusicLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width(21)),
            child: Column(
              children: [
                const CustomAppBar(titleKey: "library"),
                SizedBox(height: _size.height(50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(type: Category.artists),
                    CategoryCard(type: Category.playLists),
                  ],
                ),
                SizedBox(height: _size.height(25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(type: Category.albums),
                    CategoryCard(type: Category.songs),
                  ],
                ),
                SizedBox(height: _size.height(25)),
                const CustomDivider(titleKey: "recently_played"),
                SizedBox(height: _size.height(25)),
                GetBuilder<RecentActivityController>(
                  builder: (songs) => Column(children: [
                    ...songs.recentSongs
                        .map<Widget>(
                          (song) =>
                              SongContainer(song: song, artistName: "Maichel"),
                        )
                        .toList(),
                    SizedBox(height: _size.height(25)),
                  ]),
                ),
              ],
            ),
          ),
          GetBuilder<RecentActivityController>(
            builder: (albums) => SizedBox(
              height: _size.height(190),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: albums.recentAlbums
                    .map<Widget>((album) => AlbumContainer(album: album))
                    .toList(),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const CustomNavBar(currentPage: 1),
    );
  }
}
