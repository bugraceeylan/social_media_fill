
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowersUserContanier extends StatelessWidget {
  final String userName;
  final String userImage;

  const FollowersUserContanier({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.90,
      height: DeviceConfig.screenHeight! * 0.068,
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(userImage),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                userName,
                style: Tstyle.headStyle(textSize: 14),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 24,
              color: Color(0xff545454),
            )
          ],
        ),
      ),
    );
  }
}
