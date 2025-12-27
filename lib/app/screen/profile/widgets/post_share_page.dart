import 'dart:io';

import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/Posts/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PostSharePage extends StatelessWidget {
  const PostSharePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ProfileViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xff231F1F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            actions: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AppBarBack(),
              )
            ],
            backgroundColor: const Color(0xff231F1F),
            title: Text(
              "Post Paylaş",
              style: Tstyle.headStyle(textSize: 16, color: cWhite),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Observer(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AspectRatio(aspectRatio: 181 / 22),
            Container(
              width: DeviceConfig.screenWidth!,
              height: DeviceConfig.screenHeight! * 0.39,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(251, 251, 251, 0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  viewModel.pickPostPhoto();
                },
                child: Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "Görsel seç",
                      style:
                          Tstyle.headStyle(textSize: 20, color: cPrimaryGreen),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 56,
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: cPrimaryGreen),
                      child: const Icon(
                        Icons.add,
                        color: cWhite,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const AspectRatio(aspectRatio: 181 / 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Seçilenler",
                style: Tstyle.headStyle(textSize: 16, color: cWhite),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: SizedBox(
                width: DeviceConfig.screenWidth!,
                height: DeviceConfig.screenHeight! * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.selectedPostPhoto.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: DeviceConfig.screenWidth! * 0.22,
                        decoration: BoxDecoration(
                          color: cWhite,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              File(viewModel.selectedPostPhoto[index].path),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: 31,
                                  height: 31,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(35, 31, 31, 0.5),
                                  ),
                                  child: SvgPicture.asset(
                                      fit: BoxFit.scaleDown,
                                      width: 1,
                                      height: 1,
                                      "assets/profil/delete_sembol.svg")),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const AspectRatio(aspectRatio: 181 / 11),
            Center(
                child: KeyButton(
              title: "Devam et",
              onPressed: () {
                Navigation.push(
                    page: PostView(
                  selectedPostPhoto:
                      viewModel.selectedPostPhoto.first.path.toString(),
                ));
              },
            ))
          ],
        );
      }),
    );
  }
}
