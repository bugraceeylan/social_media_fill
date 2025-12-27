import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class SignUpContanier extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const SignUpContanier({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.9,
      height: DeviceConfig.screenHeight! * 0.08,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Tstyle.headStyle(textSize: 14, color: cTextGrey)),
      ),
    );
  }
}
