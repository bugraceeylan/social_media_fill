
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class FollowRequest extends StatelessWidget {
  final String senderName;
  final String senderUrl;
  const FollowRequest({
    super.key,
    required this.senderName,
    required this.senderUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.99,
      height: DeviceConfig.screenHeight! * 0.053,
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            const CircleAvatar(
                // backgroundImage: NetworkImage(senderUrl),
                ),
            const SizedBox(
              width: 8,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: senderName,
                    style: Tstyle.headStyle(
                      textSize: 12,
                      color: cTextBlack,
                    ),
                  ),
                  TextSpan(
                    text: "\nSeni takip etmek istiyor",
                    style: Tstyle.headStyle(
                      textSize: 12,
                      fontW: FontWeight.w400,
                      color: cTextBlack,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              "Yoksay",
              style: Tstyle.headStyle(textSize: 12, color: cTextBlack),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                alignment: Alignment.center,
                width: DeviceConfig.screenWidth! * 0.14,
                height: DeviceConfig.screenHeight! * 0.037,
                decoration: BoxDecoration(
                    color: cTextBlue, borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Onayla",
                  style: Tstyle.headStyle(textSize: 12, color: cWhite),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
