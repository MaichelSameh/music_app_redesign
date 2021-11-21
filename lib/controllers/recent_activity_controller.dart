// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

import '../models/models.dart';

class RecentActivityController extends GetxController {
  List<SongInfo> _recentSongs = [];

  List<AlbumInfo> _recentAlbums = [];

  List<SongInfo> get recentSongs => _recentSongs;
  List<AlbumInfo> get recentAlbums => _recentAlbums;

  void addNewSong(SongInfo song) {
    _recentSongs.add(song);
    update();
  }

  void deleteSong(int id) {
    _recentSongs.removeWhere((element) => element.id == id);
    update();
  }

  void addNewAlbum(AlbumInfo album) {
    _recentAlbums.add(album);
    update();
  }

  void deleteAlbum(int id) {
    _recentAlbums.removeWhere((element) => element.id == id);
    update();
  }

  @override
  void onInit() {
    for (int i = 0; i < 10; i++) {
      addNewAlbum(AlbumInfo.empty());
      addNewSong(SongInfo.empty());
    }
    super.onInit();
  }
}
