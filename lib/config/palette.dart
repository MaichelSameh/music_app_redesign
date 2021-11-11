// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class MyPalette {
  static const Color primary_color = Color.fromRGBO(240, 240, 243, 1);
  static const Color secondary_color = Color.fromRGBO(255, 110, 110, 1);

  static const List<BoxShadow> primary_shadow = [
    BoxShadow(
      color: Color.fromRGBO(255, 255, 255, 1),
      offset: Offset(-10, -10),
      blurRadius: 30,
      spreadRadius: 4,
    ),
    BoxShadow(
      color: Color.fromRGBO(174, 174, 192, 0.4),
      offset: Offset(10, 10),
      blurRadius: 30,
      spreadRadius: 4,
    ),
  ];

  static const List<BoxShadow> secondary_shadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.09),
      offset: Offset(-3, 3),
      blurRadius: 12,
      spreadRadius: 2,
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(0, 3),
      blurRadius: 12,
      spreadRadius: 2,
    ),
  ];
}
