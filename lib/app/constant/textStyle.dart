import 'package:fill_store_bb/app/constant/color.dart';
import 'package:flutter/material.dart';

class Tstyle {
  static TextStyle headStyle(
      {required int textSize,
      Color color = cTextBlack,
      FontWeight fontW = FontWeight.w600}) {
    return TextStyle(
      fontSize: textSize.toDouble(),
      color: color,
      fontWeight: fontW,
      fontFamily: "Montserrat",
    );
  }

  static TextStyle subStyle(
      {required int textSize,
      Color color = cTextGrey,
      FontWeight fontW = FontWeight.w500}) {
    return TextStyle(
      fontSize: textSize.toDouble(),
      color: color,
      fontWeight: fontW,
      fontFamily: "Proxima",
    );
  }
}
