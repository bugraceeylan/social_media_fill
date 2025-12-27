import 'dart:ui';

import 'package:fill_store_bb/app/constant/assets_text.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostDetailsButton extends StatelessWidget {
  final VoidCallback showPostOpt;
  const PostDetailsButton({
    super.key,
    required this.showPostOpt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: GestureDetector(
        onTap: showPostOpt,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: DeviceConfig.screenWidth! * 0.06,
              height: DeviceConfig.screenHeight! * 0.04,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cWhite.withOpacity(0.5),
              ),
              child: SvgPicture.asset(fit: BoxFit.none, postOpt),
            ),
          ),
        ),
      ),
    );
  }
}
