import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class BackToLogin extends StatelessWidget {
  final VoidCallback onPressed;
  const BackToLogin({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
      ),
      child: SizedBox(
        width: DeviceConfig.screenWidth! * 0.09,
        height: DeviceConfig.screenHeight! * 0.04,
        child: const Icon(
          Icons.arrow_back_rounded,
          color: cWhite,
        ),
      ),
    );
  }
}
