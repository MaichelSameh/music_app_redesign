import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/palette.dart';
import '../models/size.dart';

class Like extends StatelessWidget {
  final bool liked;
  final double width = 20;
  final double height = 20;
  final void Function() onTap;
  const Like({
    Key? key,
    required this.liked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(_size.width(7)),
        child: liked
            ? SvgPicture.asset(
                "assets/icons/love_icon.svg",
                color: MyPalette.secondary_color,
                width: _size.width(width),
                height: _size.height(height),
              )
            : SvgPicture.asset(
                "assets/icons/love_bordered_icon.svg",
                color: MyPalette.secondary_color,
                width: _size.width(width),
                height: _size.height(height),
              ),
      ),
    );
  }
}
