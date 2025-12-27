import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class LoginContanier extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isEmail;
  final double width;

  const LoginContanier({
    super.key,
    required this.hintText,
    required this.controller,
    this.isEmail = false,
    this.width = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isEmail ? width : DeviceConfig.screenWidth! * 0.43,
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
            hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
