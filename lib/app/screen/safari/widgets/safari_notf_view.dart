import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/s_notf_follow_req.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/s_notf_specail_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SafariNotfView extends StatelessWidget {
  const SafariNotfView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = getIt.get<MainViewModel>();

    return Observer(
      builder: (context) => mainViewModel.selectedIndex == 1
          ? Scaffold(
              appBar: const ConstAppBar(title: "Bildirimler"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AspectRatio(aspectRatio: 181 / 11),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Senin İçin Önerilenler",
                        style: Tstyle.headStyle(
                          textSize: 14,
                          color: cTextBlack,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: SizedBox(
                          height: DeviceConfig.screenHeight! * 0.14,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: SpecialOfferFollowers(
                                  userName: 'burabulut',
                                  imageUrl: '',
                                  isFollow: false,
                                  userFollowersCount: '1.116',
                                ),
                              );
                            },
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Arkadaşlık İsteklerim",
                        style: Tstyle.headStyle(
                          textSize: 14,
                          color: cTextBlack,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        width: DeviceConfig.screenWidth,
                        height: DeviceConfig.screenHeight!,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: FollowRequest(
                                senderName: 'onur.aydin23',
                                senderUrl: '',
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavBarWidget(viewModel: mainViewModel),
            )
          : MainView(),
    );
  }
}
