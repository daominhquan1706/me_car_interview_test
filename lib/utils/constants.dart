import 'package:flutter/material.dart';

class Constant {
  static double paddingSmall = 5;
  static double paddingMedium = 10;
  static double paddingLarge = 16;

  static double textSizeSmall = 13;
  static double textSizeMedium = 15;

  static double textSizeH1 = 36;

  static double borderRadius = 3;

  static double buttonHeight = 52;

  static List<String> listImage = [
    "assets/album_image_9.png",
    "assets/album_image_7.png",
    "assets/album_image_4.png",
    "assets/album_image_2.png",
    "assets/album_image_5.png",
    "assets/album_image_6.png",
    "assets/album_image_8.png",
    "assets/album_image_1.png",
    "assets/album_image_3.png",
    "assets/album_image_10.png",
    "assets/album_image_11.png",
  ];

  static List<String> listBottomIcon = [
    "assets/ic_house.png",
    "assets/ic_search.png",
    "assets/ic_plus_white.png",
    "assets/ic_bubble.png",
    "assets/ic_account.png",
  ];

  static String logoImage = "assets/logo.png";
}

class AppTextStyle {
  static TextStyle textViewH1 =
      TextStyle(fontSize: Constant.textSizeH1, fontWeight: FontWeight.bold);
  static TextStyle buttonText =
      TextStyle(fontSize: Constant.textSizeSmall, fontWeight: FontWeight.bold);
}

class AppButtonStyle {
  static ButtonStyle buttonBlackStyle = ElevatedButton.styleFrom(
    primary: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  );

  static ButtonStyle buttonWhiteStyle = ElevatedButton.styleFrom(
      side: const BorderSide(width: 2.0, color: Colors.black),
      primary: Colors.white,
      onPrimary: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      textStyle: const TextStyle(color: Colors.black));
}

class AppTextFieldStyle {
  static final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: const BorderSide(color: Colors.black, width: 2.5),
  );
}
