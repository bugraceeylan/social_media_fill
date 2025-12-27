import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class BackGroundFake extends StatelessWidget {
  const BackGroundFake({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.9,
      height: DeviceConfig.screenHeight! * 0.6,
      decoration: const BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
    );
  }
}