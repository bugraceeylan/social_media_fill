import 'dart:io';

import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class SettingsProfileEdit extends StatelessWidget {
  const SettingsProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = getIt.get<LoginViewModel>();
    final viewModel = getIt.get<ProfileViewModel>();

    return Scaffold(
      appBar: SettingsAppbar(title: "Profili Düzenle"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Observer(builder: (_) {
            return Wrap(
              alignment: WrapAlignment.start,
              children: [
                AspectRatio(aspectRatio: 181 / 11),
                GestureDetector(
                  onTap: () {
                    _viewModel.isLoad ? null : viewModel.pickPhotos();
                  },
                  child: SEditProfilPhoto(viewModel: _viewModel),
                ),
                AspectRatio(aspectRatio: 181 / 11),
                Text(
                  "Ad",
                  style: Tstyle.headStyle(textSize: 12, color: cTextGrey),
                ),
                AspectRatio(aspectRatio: 181 / 6),
                ProfileUserWidget(
                  viewModel: viewModel,
                  content: viewModel.nameController.text,
                  controller: viewModel.nameController,
                ),
                AspectRatio(aspectRatio: 181 / 6),
                Text(
                  "Soyad",
                  style: Tstyle.headStyle(textSize: 12, color: cTextGrey),
                ),
                AspectRatio(aspectRatio: 181 / 6),
                ProfileUserWidget(
                  viewModel: viewModel,
                  content: viewModel.surNameController.text,
                  controller: viewModel.surNameController,
                ),
                AspectRatio(aspectRatio: 181 / 6),
                Text(
                  "Kullanıcı Adı",
                  style: Tstyle.headStyle(textSize: 12, color: cTextGrey),
                ),
                AspectRatio(aspectRatio: 181 / 6),
                ProfileUserWidget(
                  viewModel: viewModel,
                  content: viewModel.userTagController.text,
                  controller: viewModel.userTagController,
                ),
                AspectRatio(aspectRatio: 181 / 6),
                Container(
                  alignment: Alignment.centerLeft,
                  width: DeviceConfig.screenWidth! * 0.9,
                  height: DeviceConfig.screenHeight! * 0.064,
                  decoration: BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Hitaplar",
                      style: Tstyle.headStyle(textSize: 14, color: cTextBlack),
                    ),
                  ),
                ),
                AspectRatio(aspectRatio: 181 / 6),
                Text(
                  "Hakkında",
                  style: Tstyle.headStyle(textSize: 12, color: cTextGrey),
                ),
                AspectRatio(aspectRatio: 181 / 6),
                ProfileUserWidget(
                  viewModel: viewModel,
                  controller: viewModel.aboutController,
                  content: viewModel.aboutController.text.isEmpty
                      ? "Biyografi giriniz"
                      : viewModel.aboutController.text,
                  ctHeight: 0.18,
                ),
                AspectRatio(aspectRatio: 181 / 11),
                KeyButton(
                  title: "Değişiklikleri Onayla",
                  onPressed: () async {
                    await viewModel.updateUserProfile();
                    Navigation.ofPop();
                  },
                ),
                AspectRatio(aspectRatio: 181 / 11),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class ProfileUserWidget extends StatelessWidget {
  final String content;
  final double ctWidth;
  final double ctHeight;
  final TextEditingController controller;
  const ProfileUserWidget(
      {super.key,
      required this.viewModel,
      required this.content,
      this.ctWidth = 0.9,
      this.ctHeight = 0.064,
      required this.controller});

  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * ctWidth,
      height: DeviceConfig.screenHeight! * ctHeight,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          style: Tstyle.headStyle(textSize: 14, color: cTextGrey),
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class SEditProfilPhoto extends StatelessWidget {
  const SEditProfilPhoto({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: DeviceConfig.screenWidth! * 0.6,
        height: DeviceConfig.screenHeight! * 0.23,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: DeviceConfig.screenWidth! * 0.5,
              height: DeviceConfig.screenHeight! * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: viewModel.selectedPhotos == null
                      ? const AssetImage("assets/sign_up/user.png")
                      : FileImage(
                          File(viewModel.selectedPhotos!.path),
                        ),
                ),
                shape: BoxShape.circle,
                color: const Color(0xffD9D9D9),
                border: Border.all(
                  width: 4,
                  color: const Color.fromARGB(242, 168, 167, 167),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 50,
                height: 50,
                child: SvgPicture.asset(
                  "assets/svg_assets/edit.svg",
                  fit: BoxFit.none,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: cPrimaryGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
