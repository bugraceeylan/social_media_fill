import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoNetworkScreen extends StatelessWidget {
  final VoidCallback onPressed;
  const NoNetworkScreen({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "İnternet Bağlantısı Yok!",
            style: Tstyle.headStyle(
                textSize: 14, color: cTextGrey, fontW: FontWeight.w600),
          ),
          SizedBox(
            width: DeviceConfig.screenWidth! * 2,
            height: DeviceConfig.screenHeight! * 0.2,
            child:
                Lottie.asset(fit: BoxFit.cover, "assets/lottie/network_4.json"),
          ),
          const AspectRatio(aspectRatio: 181 / 100),
          Text(
            textAlign: TextAlign.center,
            "Bağlantınızı kontrol edin. \nSizin için bağlantınızı yeniliyoruz!",
            style: Tstyle.headStyle(
                textSize: 14, color: cTextGrey, fontW: FontWeight.w600),
          ),
          const AspectRatio(aspectRatio: 181 / 24),
          KeyButton(
            title: "Tekrar Bağlan",
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
