import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/assets_text.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/pk/widgets/top_daytext.dart';
import 'package:fill_store_bb/app/screen/pk/widgets/top_music.dart';
import 'package:fill_store_bb/app/screen/pk/widgets/top_story.dart';
import 'package:fill_store_bb/app/screen/pk/widgets/top_video.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_user_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PkView extends StatelessWidget {
  const PkView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: DeviceConfig.screenWidth!,
            height: DeviceConfig.screenHeight! * 0.32,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff9358F7),
              Color(0xff7B78F2),
              Color(0xff6197EE),
              Color(0xff45B5E9),
              Color(0xff10D7E2),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
            child: const TopPKViews(),
          ),
          const AspectRatio(aspectRatio: 181 / 11),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BestTopContanier(
              type: 'post',
              pkNumber: 1,
              userName: 'ahucetin90',
              userPostPoint: 100,
              userPhoto: '',
              pkLike: '500',
              postContent: 'assets/profil/post.jpg',
            ),
          ),
          const BestTopContanier(
            type: 'post',
            pkNumber: 2,
            userName: 'ahucetin90',
            userPostPoint: 100,
            userPhoto: '',
            pkLike: '500',
            postContent: 'assets/profil/post.jpg',
          ),
          const AspectRatio(aspectRatio: 181 / 100),
        ],
      ),
    );
  }
}

class BestTopContanier extends StatelessWidget {
  final String type;
  final int pkNumber;
  final String userName;
  final int userPostPoint;
  final String userPhoto;
  final String pkLike;
  final String postContent;
  const BestTopContanier({
    super.key,
    required this.type,
    required this.pkNumber,
    required this.userName,
    required this.userPostPoint,
    required this.userPhoto,
    required this.pkLike,
    required this.postContent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: DeviceConfig.screenWidth! * 0.95,
        height: DeviceConfig.screenHeight! * 0.525,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cTextGrey.withOpacity(0.1),
        ),
        child: Wrap(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SvgPicture.asset(
                    "assets/pk_numbers/$pkNumber.svg",
                  ),
                ),
                UserPostHeader(
                  userName: userName,
                  userInt: userPostPoint,
                  userPhoto: userPhoto,
                  goUserStory: () {},
                  screenHeight: DeviceConfig.screenHeight! * 0.055,
                  backGroundOn: false,
                  avatarPadding: 0,
                  stepWidth: 0.113,
                  goUserProfile: () {},
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SvgPicture.asset(
                            postLiked,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          pkLike,
                          style: Tstyle.subStyle(
                              textSize: 14,
                              color: cBlack,
                              fontW: FontWeight.w600),
                        )
                      ],
                    ))
                  ])),
                )
              ],
            ),
            Container(
              width: DeviceConfig.screenWidth! * 0.95,
              height: DeviceConfig.screenHeight! * 0.44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        postContent,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}

class TopPKViews extends StatelessWidget {
  const TopPKViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            "En İyiler",
            style: Tstyle.headStyle(
                textSize: 16, fontW: FontWeight.w700, color: cWhite),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hikaye",
              style: Tstyle.headStyle(
                  textSize: 13, fontW: FontWeight.w500, color: cWhite),
            ),
            Text(
              "Video",
              style: Tstyle.headStyle(
                  textSize: 13, fontW: FontWeight.w500, color: cWhite),
            ),
            Text(
              "Müzik",
              style: Tstyle.headStyle(
                  textSize: 13, fontW: FontWeight.w500, color: cWhite),
            )
          ],
        ),
        const AspectRatio(aspectRatio: 181 / 2),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Top3Contanier(
              content: 'test',
              userName: 'fatih.altintaş23',
              likeCount: 306,
              page: TopStory(),
            ),
            Top3Contanier(
              content: 'test',
              userName: 'fatih.altintaş12',
              likeCount: 306,
              page: TopVideo(),
            ),
            Top3Contanier(
              content: 'test',
              userName: 'fatih.altintaş2',
              likeCount: 306,
              page: TopMusic(),
            ),
          ],
        ),
        const AspectRatio(aspectRatio: 181 / 4),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigation.push(page: TopDaytext());
            },
            child: Container(
              width: DeviceConfig.screenWidth! * 0.80,
              height: DeviceConfig.screenHeight! * 0.042,
              decoration: BoxDecoration(
                color: Colors.grey.shade100.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "# biruygulamayarat",
                    style:
                        Tstyle.headStyle(textSize: 14, fontW: FontWeight.w700),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/profil/post_inc.svg",
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "306" + "k",
                    style: Tstyle.headStyle(
                        textSize: 14, fontW: FontWeight.w700, color: cTextGrey),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Top3Contanier extends StatelessWidget {
  final String content;
  final String userName;
  final int likeCount;
  final Widget page;
  const Top3Contanier({
    super.key,
    required this.content,
    required this.userName,
    required this.likeCount,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(page: page);
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: DeviceConfig.screenWidth! * 0.19,
                height: DeviceConfig.screenHeight! * 0.083,
                decoration: BoxDecoration(
                  color: cBlack,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                top: -13,
                left: -11,
                child: SvgPicture.asset(
                  "assets/pk/top3.svg",
                  width: 34,
                  height: 30,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Text(
            userName,
            style: Tstyle.headStyle(
              textSize: 12,
              color: cWhite,
              fontW: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/profil/post_inc.svg",
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                likeCount.toString() + "k",
                style: Tstyle.headStyle(
                    textSize: 14, fontW: FontWeight.w700, color: cWhite),
              )
            ],
          ),
        ],
      ),
    );
  }
}
