
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistorySearchContanier extends StatelessWidget {
  final String imageUrl;
  final String name;
  const HistorySearchContanier({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        width: DeviceConfig.screenWidth! * 0.9,
        height: DeviceConfig.screenHeight! * 0.066,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                  // backgroundImage: NetworkImage(imageUrl),
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  name,
                  style: Tstyle.headStyle(
                    textSize: 14,
                    color: cTextBlack,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  "assets/safari/delete.svg",
                  width: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
