import 'package:fill_store_bb/app/constant/assets_text.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserDayWords extends StatelessWidget {
  final String userDayWords;
  const UserDayWords({
    super.key,
    required this.viewModel,
    required this.userDayWords,
  });

  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.90,
      height: DeviceConfig.screenHeight! * 0.049,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "#",
              style: TextStyle(
                color: cBlack,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          Text(userDayWords,
              style: Tstyle.headStyle(textSize: 14, fontW: FontWeight.w700)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(svgEditDay),
          ),
        ],
      ),
    );
  }
}
