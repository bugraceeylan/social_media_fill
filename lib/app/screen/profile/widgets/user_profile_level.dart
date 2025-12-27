import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class UserLevel extends StatelessWidget {
  const UserLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.14,
      height: DeviceConfig.screenHeight! * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(colors: [
          Color(0xff172368),
          Color(0xffE249AF),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 43,
            top: 10,
            child: Image.asset(
              "assets/profil/star_right.png",
              width: 14,
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              "assets/profil/star.png",
              width: 24,
            ),
          )),
          Positioned(
            right: 43,
            top: 10,
            child: Image.asset(
              "assets/profil/star_left.png",
              width: 14,
            ),
          ),
          const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "100",
                  style: TextStyle(
                      color: cWhite, fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ))
        ],
      ),
    );
  }
}