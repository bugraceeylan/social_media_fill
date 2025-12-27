import 'package:fill_store_bb/app/components/AppBar/PK_appbar.dart';
import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/pk/widgets/top_music.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class TopDaytext extends StatelessWidget {
  const TopDaytext({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = getIt.get<MainViewModel>();

    return Observer(
        builder: (context) => mainViewModel.selectedIndex == 0
            ? Scaffold(
                appBar: PKViewAppBar(title: ""),
                body: Column(
                  children: [
                    Top3TitleGradient(
                      title: 'Akımlar',
                    ),
                    AspectRatio(aspectRatio: 181 / 8),
                    BestDayTextContanier(
                      contentText: 'Burak Bulut - Kehribar',
                      pkNumber: '1',
                      contentCount: '306',
                    ),
                    BestDayTextContanier(
                      contentText: 'MT07',
                      pkNumber: '2',
                      contentCount: '306',
                    ),
                    BestDayTextContanier(
                      contentText: 'ISTIFA',
                      pkNumber: '3',
                      contentCount: '306',
                    ),
                    BestDayTextContanier(
                      contentText: '1320244',
                      pkNumber: '4',
                      contentCount: '306',
                    ),
                    BestDayTextContanier(
                      contentText: 'BJK VS GS',
                      pkNumber: '5',
                      contentCount: '306',
                    )
                  ],
                ),
                bottomNavigationBar:
                    BottomNavBarWidget(viewModel: mainViewModel),
              )
            : MainView());
  }
}

class BestDayTextContanier extends StatelessWidget {
  final String contentText;
  final String pkNumber;
  final String contentCount;
  const BestDayTextContanier({
    super.key,
    required this.contentText,
    required this.pkNumber,
    required this.contentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: DeviceConfig.screenWidth! * 0.89,
        height: DeviceConfig.screenHeight! * 0.045,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: SvgPicture.asset(
                height: 32,
                "assets/pk_numbers/$pkNumber.svg",
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "# $contentText",
              style: Tstyle.headStyle(textSize: 14, fontW: FontWeight.w700),
            ),
            Spacer(),
            SvgPicture.asset(
              "assets/profil/post_inc.svg",
              fit: BoxFit.fill,
            ),
            Text(
              contentCount + "k",
              style: Tstyle.headStyle(
                  textSize: 14, fontW: FontWeight.w700, color: cTextGrey),
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    );
  }
}
