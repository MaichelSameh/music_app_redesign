import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/size.dart';
import '../models/album_info.dart';

class AlbumContainer extends StatelessWidget {
  final AlbumInfo album;
  const AlbumContainer({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Center(
      child: Container(
        width: _size.width(135),
        height: _size.height(170),
        margin: EdgeInsets.only(right: _size.width(20)),
        decoration: BoxDecoration(
          color: MyPalette.primary_color,
          borderRadius: BorderRadius.circular(_size.width(30)),
          boxShadow: [MyPalette.primary_shadow.last],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(_size.width(30)),
                topLeft: Radius.circular(_size.width(30)),
              ),
              child: Image.network(
                album.imageURL,
                height: _size.height(126),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: _size.height(6)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _size.width(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        album.name,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(96, 96, 96, 1),
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                      ),
                      SizedBox(height: _size.height(4)),
                      Text(
                        album.songsNumber.toString(),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(96, 96, 96, 1),
                              fontSize: 8,
                            ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Text(
                    album.date.year.toString(),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(96, 96, 96, 1),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
