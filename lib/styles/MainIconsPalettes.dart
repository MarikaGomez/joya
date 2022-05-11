import 'package:flutter/material.dart';
import 'package:joya/styles/MainColorPalettes.dart';

class MainIconsPalettes {
  static const Map<String, dynamic> iconCurved = {
    "ICONS_NAV_BAR": [
      Icon(
        Icons.home,
        size: 35,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      Icon(
        Icons.qr_code,
        size: 35,
        color: MaterialColor(0xFFFFFFFF, {
          50: Color.fromARGB(255, 255, 255, 255),
        }),
      ),
      Icon(
        Icons.more_vert,
        size: 35,
        color: MaterialColor(0xFFFFFFFF, {
          50: Color.fromARGB(255, 255, 255, 255),
        }),
      ),
    ]
  };

  static const Map<String, dynamic> iconButtons = {
    "BACK": Icon(
      Icons.arrow_back,
      size: 30,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    "NEXT": Icon(
      Icons.arrow_forward,
      size: 30,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    "CAMERA": Icon(
      Icons.add,
      size: 30,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    "QR": Icon(
      Icons.qr_code,
      color: Color.fromARGB(255, 0, 0, 0),
      size: 300.0,
    ),
    "BUILD": Icon(
      Icons.build,
      size: 300.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  };
}
