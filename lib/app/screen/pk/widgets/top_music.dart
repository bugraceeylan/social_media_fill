import 'package:fill_store_bb/app/components/AppBar/PK_appbar.dart';
import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_user_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TopMusic extends StatelessWidget {
  const TopMusic({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = getIt.get<MainViewModel>();

    return Observer(
        builder: (context) => mainViewModel.selectedIndex == 0
            ? Scaffold(
                appBar: PKViewAppBar(title: ""),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Top3TitleGradient(
                        title: 'Müzikler',
                      ),
                      AspectRatio(aspectRatio: 181 / 8),
                      BestMusicContanier(
                        songPhoto: "assets/pk/music.jpeg",
                        songUrl: '',
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        pkNumber: '1',
                        songName: 'Kalbinin Sesini dinle',
                        shareCount: '336,1k',
                      ),
                      BestMusicContanier(
                        songPhoto: "assets/pk/music.jpeg",
                        songUrl: '',
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        pkNumber: '2',
                        songName: 'Kalbinin Sesini dinle',
                        shareCount: '336,1k',
                      ),
                      BestMusicContanier(
                        songPhoto: "assets/pk/music.jpeg",
                        songUrl: '',
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        pkNumber: '3',
                        songName: 'Kalbinin Sesini dinle',
                        shareCount: '336,1k',
                      ),
                      BestMusicContanier(
                        songPhoto: "assets/pk/music.jpeg",
                        songUrl: '',
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        pkNumber: '4',
                        songName: 'Kalbinin Sesini dinle',
                        shareCount: '336,1k',
                      ),
                      BestMusicContanier(
                        songPhoto: "assets/pk/music.jpeg",
                        songUrl: '',
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        pkNumber: '5',
                        songName: 'Kalbinin Sesini dinle',
                        shareCount: '336,1k',
                      )
                    ],
                  ),
                ),
                bottomNavigationBar:
                    BottomNavBarWidget(viewModel: mainViewModel),
              )
            : MainView());
  }
}

class BestMusicContanier extends StatelessWidget {
  final String songPhoto;
  final String songUrl;
  final String userName;
  final int userPostPoint;
  final String pkNumber;
  final String songName;
  final String shareCount;
  const BestMusicContanier({
    super.key,
    required this.songPhoto,
    required this.songUrl,
    required this.userName,
    required this.userPostPoint,
    required this.pkNumber,
    required this.songName,
    required this.shareCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: DeviceConfig.screenWidth! * 0.92,
        height: DeviceConfig.screenHeight! * 0.18,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: DeviceConfig.screenWidth! * 0.36,
                height: DeviceConfig.screenHeight! * 0.16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    songPhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              children: [
                Row(
                  children: [
                    UserPostHeader(
                      backGroundOn: false,
                      avatarPadding: 0,
                      userName: userName,
                      userInt: 100,
                      userPhoto: "",
                      goUserStory: () {},
                      screenHeight: DeviceConfig.screenHeight! * 0.050,
                      goUserProfile: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 15),
                      child: SvgPicture.asset(
                        height: 40,
                        "assets/pk_numbers/$pkNumber.svg",
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: songName,
                          style: Tstyle.headStyle(
                              textSize: 14,
                              fontW: FontWeight.w700,
                              color: cTextDarkGrey),
                        ),
                        TextSpan(
                          text: "\n$shareCount Gönderi",
                          style: Tstyle.headStyle(
                              textSize: 14,
                              fontW: FontWeight.w500,
                              color: cTextDarkGrey),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: DeviceConfig.screenWidth! * 0.52,
                  height: DeviceConfig.screenHeight! * 0.06,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        direction: Axis.vertical,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: 126,
                              height: 3,
                              decoration: BoxDecoration(color: cPrimaryColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "0:00",
                              style: Tstyle.headStyle(
                                  textSize: 10, fontW: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: cPrimaryGreen),
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Top3TitleGradient extends StatelessWidget {
  final String title;
  const Top3TitleGradient({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth!,
      height: DeviceConfig.screenHeight! * 0.07,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff9358F7),
          Color(0xff7B78F2),
          Color(0xff6197EE),
          Color(0xff45B5E9),
          Color(0xff10D7E2),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 4,
          ),
          Text(
            "En İyi $title",
            style: Tstyle.headStyle(textSize: 16, color: cWhite),
          ),
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppBarBack(),
          ),
        ],
      ),
    );
  }
}
