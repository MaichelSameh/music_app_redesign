import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/palette.dart';
import '../controllers/localization_controller.dart';
import '../models/size.dart';

class CustomDivider extends StatelessWidget {
  final String titleKey;
  const CustomDivider({Key? key, required this.titleKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Get.find<AppLocalizationController>()
                  .getTranslatedValue(titleKey),
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              Get.find<AppLocalizationController>()
                  .getTranslatedValue("see_all"),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: MyPalette.secondary_color,
                  ),
            )
          ],
        ),
        SizedBox(height: _size.height(11)),
        const Divider(color: Color.fromRGBO(112, 112, 112, 1)),
      ],
    );
  }
}
