import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_appbar.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_device_permisson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsSecurity extends StatelessWidget {
  const SettingsSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppbar(title: "Güvenlik Ayarları"),
      body: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          AspectRatio(aspectRatio: 181 / 22),
          SSecurityWidget(
              type: "Şifre Değiştirme",
              assetType: "assets/profil/settings_lock.svg",
              isOnline: null,
              onPressed: () {}),
          AspectRatio(aspectRatio: 181 / 8),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          AspectRatio(aspectRatio: 181 / 4),
          SSecurityWidget(
              type: "Hesap Durumu",
              assetType: "assets/profil/settings_status.svg",
              isOnline: true,
              onPressed: () {}),
          AspectRatio(aspectRatio: 181 / 8),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          AspectRatio(aspectRatio: 181 / 4),
          SSecurityWidget(
              type: "Cihaz İzinleri",
              assetType: "assets/profil/settings_permisson.svg",
              isOnline: null,
              onPressed: () {
                Navigation.push(page: SettingsDevicePermission());
              }),
          AspectRatio(aspectRatio: 181 / 8),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          AspectRatio(aspectRatio: 181 / 4),
          SSecurityWidget(
              type: "Engellenen Kişiler",
              assetType: "assets/profil/settings_block.svg",
              isOnline: null,
              onPressed: () {}),
          AspectRatio(aspectRatio: 181 / 8),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          AspectRatio(aspectRatio: 181 / 121),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cBlack,
          ),
          AspectRatio(aspectRatio: 181 / 7),
          Text(
            "Hesap Hakkında",
            style: Tstyle.headStyle(textSize: 14, color: cTextBlack),
          ),
          AspectRatio(aspectRatio: 181 / 7),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cBlack,
          ),
          AspectRatio(aspectRatio: 181 / 7),
          Text(
            "Gizlilik İlkesi",
            style: Tstyle.headStyle(textSize: 14, color: cTextBlack),
          ),
          AspectRatio(aspectRatio: 181 / 7),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cBlack,
          ),
          AspectRatio(aspectRatio: 181 / 7),
          Text(
            "Kullanım Koşulları",
            style: Tstyle.headStyle(textSize: 14, color: cTextBlack),
          ),
          AspectRatio(aspectRatio: 181 / 7),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cBlack,
          ),
        ],
      ),
    );
  }
}

class SSecurityWidget extends StatelessWidget {
  final String type;
  final String assetType;
  final VoidCallback onPressed;
  final bool? isOnline;
  const SSecurityWidget({
    super.key,
    required this.type,
    required this.assetType,
    required this.onPressed,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: DeviceConfig.screenWidth!,
          height: DeviceConfig.screenHeight! * 0.04,
          color: appColor,
          child: Row(
            children: [
              SvgPicture.asset(
                assetType,
                color: cTextBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                type,
                style: Tstyle.headStyle(
                  textSize: 13,
                  color: cTextBlack,
                ),
              ),
              const Spacer(),
              isOnline == true
                  ? Text(
                      "aktif",
                      style:
                          Tstyle.headStyle(textSize: 13, color: cPrimaryGreen),
                    )
                  : isOnline == false
                      ? Text(
                          "Aktif Değil",
                          style:
                              Tstyle.headStyle(textSize: 13, color: Colors.red),
                        )
                      : isOnline == null
                          ? const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff545454),
                              size: 14,
                            )
                          : const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff545454),
                              size: 14,
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
