 
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSearch extends StatelessWidget {
  const ProfileSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.9,
      height: DeviceConfig.screenHeight! * 0.048,
      decoration: BoxDecoration(
          color: const Color(0xffE1E1E1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              "Aramak istediğiniz kişi",
              style: Tstyle.headStyle(
                  textSize: 14, fontW: FontWeight.w500, color: cTextGrey),
            ),
            const Spacer(),
            const Icon(
              Icons.search,
              color: Color(0xff545454),
            )
          ],
        ),
      ),
    );
  }
}
