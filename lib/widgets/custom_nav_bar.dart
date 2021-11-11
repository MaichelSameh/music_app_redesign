import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/localization_controller.dart';
import '../config/palette.dart';
import '../models/size.dart';

class CustomNavBar extends StatelessWidget {
  final int currentPage;
  const CustomNavBar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Container(
      width: _size.width(333),
      height: _size.height(86),
      padding: EdgeInsets.symmetric(horizontal: _size.width(25)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_size.width(50)),
        color: MyPalette.primary_color,
        boxShadow: MyPalette.primary_shadow,
      ),
      margin: EdgeInsets.only(bottom: _size.height(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavBarItem(context, _size, 0, "search_icon", "search"),
          buildNavBarItem(context, _size, 1, "radio_icon", "radio"),
          buildNavBarItem(context, _size, 2, "downloads_icon", "downloads"),
          buildNavBarItem(context, _size, 3, "love_bordered_icon", "for_you"),
          buildNavBarItem(context, _size, 4, "music_icon", "library"),
        ],
      ),
    );
  }

  Widget buildNavBarItem(
    BuildContext context,
    Size _size,
    int index,
    String iconName,
    String textKey,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/$iconName.svg",
          color: index == currentPage
              ? MyPalette.secondary_color
              : const Color.fromRGBO(96, 96, 96, 1),
          height: _size.height(27),
          width: _size.width(27),
        ),
        if (index == currentPage)
          Padding(
            padding: EdgeInsets.only(top: _size.height(4)),
            child: Text(
              Get.find<AppLocalizationController>().getTranslatedValue(textKey),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: MyPalette.secondary_color,
                  ),
            ),
          ),
      ],
    );
  }
}
