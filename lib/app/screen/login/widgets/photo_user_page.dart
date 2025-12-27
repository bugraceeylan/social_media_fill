import 'dart:io';

import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:fill_store_bb/app/screen/login/widgets/back_to_page.dart';
import 'package:fill_store_bb/app/screen/login/widgets/head_text.dart';
import 'package:fill_store_bb/app/screen/login/widgets/loading_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PPUser extends StatelessWidget {
  const PPUser({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<LoginViewModel>();

    return Scaffold(
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => Column(
            children: [
              const AspectRatio(aspectRatio: 181 / 21),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: HeadText(
                      about:
                          "Profil fotoğrafınızı ve kullanıcı\nadınızı oluşturun",
                      type: "Kayıt Ol",
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  BackToLogin(
                    onPressed: () {
                      viewModel.isLoad ? null : Navigation.ofPop();
                    },
                  ),
                ],
              ),
              LoadingPreview(
                viewModel: viewModel,
              ),
              const AspectRatio(aspectRatio: 181 / 21),
              GestureDetector(
                onTap: () {
                  viewModel.isLoad ? null : viewModel.pickPhotos();
                },
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
              ),
              const AspectRatio(aspectRatio: 181 / 11),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  width: DeviceConfig.screenWidth! * 0.9,
                  height: DeviceConfig.screenHeight! * 0.08,
                  decoration: BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: viewModel.userTagController,
                    focusNode: viewModel.isLoad
                        ? AlwaysDisabledFocusNode()
                        : FocusNode(),
                    readOnly: viewModel.isLoad, // Zaten ayarlanmış
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        hintText: "Kullanıcı Adınız",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              const AspectRatio(aspectRatio: 181 / 11),
              viewModel.isLoad
                  ? const SizedBox()
                  : Observer(
                      builder: (context) {
                        return Visibility(
                          visible: viewModel.userNameError.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              viewModel.userNameError,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
              const AspectRatio(aspectRatio: 181 / 11),
              KeyButton(
                  title: "Hesabımı Oluştur",
                  onPressed: () async {
                    viewModel.isLoad
                        ? print("bekle")
                        : await viewModel.completedSignUp();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
