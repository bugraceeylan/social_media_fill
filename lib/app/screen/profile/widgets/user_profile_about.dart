import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class UserAboutProfile extends StatelessWidget {
  final String name;
  final String surname;
  final String userName;
  final String userTitle;
  final String userAbout;
  const UserAboutProfile({
    super.key,
    required this.name,
    required this.surname,
    required this.userName,
    required this.userTitle,
    required this.userAbout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.42,
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(children: [
              TextSpan(
                text: name,
                style: Tstyle.headStyle(textSize: 14),
              ),
              WidgetSpan(
                  child: SizedBox(
                width: 4,
              )),
              TextSpan(
                text: surname,
                style: Tstyle.headStyle(textSize: 14),
              ),
            ]),
            TextSpan(
                text: "\n$userName",
                style: Tstyle.headStyle(textSize: 12, color: cTextGrey)),
            TextSpan(
                text: "\n$userTitle", style: Tstyle.headStyle(textSize: 12)),
            TextSpan(
                text: "\n$userAbout",
                style: Tstyle.headStyle(textSize: 12, fontW: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
