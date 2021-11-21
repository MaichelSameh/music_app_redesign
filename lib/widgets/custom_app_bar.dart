import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/palette.dart';
import '../models/size.dart';
import '../controllers/controllers.dart';

class CustomAppBar extends StatelessWidget {
  final String? titleKey;
  const CustomAppBar({Key? key, this.titleKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Container(
      margin: EdgeInsets.only(
        top: _size.height(74),
      ),
      padding: EdgeInsets.symmetric(horizontal: _size.width(20)),
      alignment: Alignment.center,
      width: _size.width(333),
      height: _size.height(66),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_size.width(30)),
        boxShadow: MyPalette.primary_shadow,
        color: MyPalette.primary_color,
      ),
      child: Row(
        children: [
          Text(
            Get.find<AppLocalizationController>().getTranslatedValue(
              titleKey ?? Get.find<UserController>().currentUser.name,
            ),
            style: Theme.of(context).textTheme.headline1,
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.grey[350],
            backgroundImage:
                NetworkImage(Get.find<UserController>().currentUser.imageUrl),
          ),
        ],
      ),
    );
  }
}
