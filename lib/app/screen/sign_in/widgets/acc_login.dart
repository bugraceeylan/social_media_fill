import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class AccLogin extends StatelessWidget {
  final String type;
  const AccLogin({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.9,
      height: DeviceConfig.screenHeight! * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cWhite,
          border: Border.all(width: 1, color: cTextGrey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset("assets/sign_up/$type.png"),
          ),
          const Spacer(),
          Text(
            "$type Hesabın ile giriş yap",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(
            flex: 20,
          ),
        ],
      ),
    );
  }
}

