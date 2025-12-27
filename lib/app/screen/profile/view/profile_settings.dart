import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/components/service/log_out_service.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_appbar.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_notf.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_profile_edit.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_security.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: const SettingsAppbar(title: "Ayarlar"),
      body: Column(
        children: [
          const AspectRatio(aspectRatio: 181 / 11),
          SettigsWidget(
            type: 'Profili Düzenle',
            assetType: 'assets/svg_assets/edit.svg',
            onPressed: () {
              Navigation.push(page: const SettingsProfileEdit());
            },
          ),
          const AspectRatio(aspectRatio: 181 / 2),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          const AspectRatio(aspectRatio: 181 / 8),
          SettigsWidget(
            type: 'Bildirim Tercihleri',
            assetType: 'assets/profil/notf.svg',
            onPressed: () {
              print("asd");
              Navigation.push(page: SettingsNotf());
            },
          ),
          const AspectRatio(aspectRatio: 181 / 2),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          const AspectRatio(aspectRatio: 181 / 8),
          SettigsWidget(
            type: 'Hesap Gizliği',
            assetType: 'assets/profil/locked.svg',
            isSwitchButton: true,
            onPressed: () {},
          ),
          const AspectRatio(aspectRatio: 181 / 6),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          const AspectRatio(aspectRatio: 181 / 8),
          SettigsWidget(
            type: 'Güvenlik Ayarları',
            assetType: 'assets/profil/key.svg',
            onPressed: () {
              Navigation.push(page: SettingsSecurity());
            },
          ),
          const AspectRatio(aspectRatio: 181 / 6),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          const AspectRatio(aspectRatio: 181 / 8),
          SettigsWidget(
            type: 'Dil',
            assetType: 'assets/profil/language.svg',
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset("assets/profil/turkey.svg"),
            ),
            onPressed: () {},
          ),
          const AspectRatio(aspectRatio: 181 / 6),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          const AspectRatio(aspectRatio: 181 / 8),
          SettigsWidget(
            type: 'Hakkında',
            assetType: 'assets/profil/about.svg',
            onPressed: () async {},
          ),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          const AspectRatio(aspectRatio: 181 / 8),
          SettigsWidget(
            type: 'Çıkış Yap',
            assetType: 'assets/profil/about.svg',
            onPressed: () async {
              print("asd");
              await logoutUser();
            },
          ),
          const AspectRatio(aspectRatio: 181 / 6),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
        ],
      ),
    );
  }
}

class SettigsWidget extends StatelessWidget {
  final String type;
  final String assetType;
  final VoidCallback onPressed;
  final Widget? widget;
  final bool isSwitchButton;
  const SettigsWidget({
    super.key,
    required this.type,
    required this.assetType,
    required this.onPressed,
    this.widget,
    this.isSwitchButton = false,
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
                color: const Color(0xff545454),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                type,
                style: Tstyle.headStyle(
                  textSize: 13,
                  color: const Color(0xff545454),
                ),
              ),
              widget ?? const SizedBox(),
              const Spacer(),
              isSwitchButton
                  ? CupertinoSwitch(
                      value: isSwitchButton,
                      activeColor:
                          CupertinoColors.systemGreen, // Açık olduğunda rengi
                      onChanged: (bool value) {},
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
