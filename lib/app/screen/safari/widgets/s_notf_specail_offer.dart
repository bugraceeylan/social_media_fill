
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class SpecialOfferFollowers extends StatelessWidget {
  final String userName;
  final String imageUrl;
  final bool isFollow;
  final String userFollowersCount;
  const SpecialOfferFollowers({
    super.key,
    required this.userName,
    required this.imageUrl,
    required this.isFollow,
    required this.userFollowersCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.24,
      height: DeviceConfig.screenHeight! * 0.14,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            const CircleAvatar(),
            Text(
              userName,
              style: Tstyle.headStyle(
                textSize: 13,
                color: cTextBlack,
              ),
            ),
            Text(
              "$userFollowersCount Takipçi",
              style: Tstyle.headStyle(
                textSize: 13,
                color: cTextGrey,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: DeviceConfig.screenWidth! * 0.17,
              height: DeviceConfig.screenHeight! * 0.026,
              decoration: BoxDecoration(
                  color: const Color(0xff447FF1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Takip et",
                style: Tstyle.headStyle(textSize: 12, color: cWhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
