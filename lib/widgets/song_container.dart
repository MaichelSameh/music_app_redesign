import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/localization_controller.dart';
import '../config/palette.dart';
import '../models/models.dart';
import '../models/size.dart';
import 'like_button.dart';

class SongContainer extends StatefulWidget {
  final SongInfo song;
  //TODO must implement a method to get the song artist in the same file
  final String artistName;
  const SongContainer({
    Key? key,
    required this.song,
    required this.artistName,
  }) : super(key: key);

  @override
  State<SongContainer> createState() => _SongContainerState();
}

class _SongContainerState extends State<SongContainer> {
  int currentDuration = 0;

  final double height = 80;
  final double width = 333;
  final double borderRadius = 15;
  final double padding = 16;

  bool like = false;

  Timer? timer;
  bool playing = false;

  @override
  void initState() {
    super.initState();
  }

  void playMusic() {
    setState(() {
      playing = true;
    });
    if (timer == null) {
      timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
        if (currentDuration != widget.song.durationInMilleSeconds) {
          setState(() {
            currentDuration += 1;
          });
        } else {
          pauseMusic();
        }
      });
    } else {}
  }

  void pauseMusic() {
    timer!.cancel();
    timer = null;
    playing = false;
    setState(() {});
  }

  double getWidthPercentage(double duration) {
    double result = (duration / widget.song.durationInMilleSeconds);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Stack(
      children: [
        Container(
          width: _size.width(width),
          height: _size.height(height),
          margin: EdgeInsets.symmetric(vertical: _size.height(7)),
          decoration: BoxDecoration(
              boxShadow: MyPalette.secondary_shadow,
              borderRadius: BorderRadius.circular(_size.width(borderRadius))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_size.width(borderRadius)),
            child: Stack(
              alignment: Get.find<AppLocalizationController>().isRTLanguage
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              children: [
                Container(
                  height: double.infinity,
                  color: MyPalette.primary_color,
                  width: _size.width(width),
                ),
                Container(
                  height: _size.height(height),
                  width: getWidthPercentage(currentDuration.toDouble()) *
                      _size.width(width),
                  color: MyPalette.secondary_color.withOpacity(0.3),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: _size.width(width),
          height: _size.height(height),
          padding: EdgeInsets.symmetric(horizontal: _size.width(padding)),
          color: Colors.transparent,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[350],
                radius: _size.width(20),
                backgroundImage: NetworkImage(widget.song.imageURL),
              ),
              SizedBox(width: _size.width(12)),
              buildSongInfo(
                context: context,
                size: _size,
                songName: widget.song.name,
                artistName: widget.artistName,
              ),
              GestureDetector(
                onTap: playing ? pauseMusic : playMusic,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _size.width(7)),
                  child: SvgPicture.asset(
                    playing
                        ? "assets/icons/pause_song_icon.svg"
                        : "assets/icons/play_song_icon.svg",
                    width: _size.width(18),
                    height: _size.height(16),
                    color: MyPalette.secondary_color,
                  ),
                ),
              ),
              const Spacer(),
              Like(
                  liked: like,
                  onTap: () {
                    setState(() {
                      like = !like;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSongInfo({
    required BuildContext context,
    required Size size,
    required String songName,
    required String artistName,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width(180),
          child: Text(
            songName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SizedBox(
          width: size.width(180),
          child: Text(
            artistName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
