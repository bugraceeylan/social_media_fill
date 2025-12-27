import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/story/view/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryShareView extends StatelessWidget {
  const StoryShareView({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Story Paylaş",
              style: Tstyle.headStyle(textSize: 16, color: cWhite),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Column(
        children: [
          AspectRatio(aspectRatio: 181 / 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigation.push(page: CameraView()),
                child: Container(
                  width: DeviceConfig.screenWidth! * 0.28,
                  height: DeviceConfig.screenHeight! * 0.17,
                  decoration: BoxDecoration(
                    color: cTextGrey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Color.fromRGBO(251, 251, 251, 0.5),
                        ),
                      ),
                      Text(
                        "Kamera",
                        style: Tstyle.headStyle(
                          textSize: 14,
                          color: Color.fromRGBO(251, 251, 251, 0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Container(
                width: DeviceConfig.screenWidth! * 0.28,
                height: DeviceConfig.screenHeight! * 0.17,
                decoration: BoxDecoration(
                  color: cTextGrey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    Center(child: SvgPicture.asset("assets/story/gallery.svg")),
                    Text(
                      "Galeri",
                      style: Tstyle.headStyle(
                        textSize: 14,
                        color: Color.fromRGBO(251, 251, 251, 0.5),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
