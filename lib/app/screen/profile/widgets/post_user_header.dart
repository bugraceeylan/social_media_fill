import 'dart:io';
import 'dart:ui';

import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserPostHeader extends StatelessWidget {
  final String userName;
  final int userInt;
  final String userPhoto;
  final VoidCallback goUserStory;
  final double screenHeight;
  final bool backGroundOn;
  final double avatarPadding;
  final double stepWidth;
  final VoidCallback goUserProfile;

  const UserPostHeader({
    super.key,
    required this.userName,
    required this.userInt,
    required this.userPhoto,
    required this.goUserStory,
    required this.screenHeight,
    this.backGroundOn = true,
    this.avatarPadding = 8,
    this.stepWidth = 0.10,
    required this.goUserProfile,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = GestureDetector(
      onTap: goUserProfile,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: avatarPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: goUserStory,
              child: Hero(
                tag: "story",
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: cPrimaryColor, width: 1),
                  ),
                  child: CircleAvatar(
                    backgroundImage: userPhoto.isEmpty
                        ? const AssetImage("assets/sign_up/user.png")
                            as ImageProvider
                        : FileImage(File(userPhoto)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: Tstyle.subStyle(
                            color: cTextBlack,
                            textSize: 14,
                            fontW: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/profil/post_inc.svg",
                              width: 20,
                              theme: const SvgTheme(currentColor: cBlack),
                            ),
                            Text(
                              userInt.toString(),
                              style: Tstyle.subStyle(
                                color: cTextBlack,
                                textSize: 14,
                                fontW: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            stepWidth: DeviceConfig.screenWidth! * stepWidth,
            child: Container(
              height: screenHeight,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(50),
              ),
              child: backGroundOn
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 30),
                        child: content,
                      ),
                    )
                  : content,
            ),
          )
        ],
      ),
    );
  }
}
