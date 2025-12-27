import 'dart:io';
import 'dart:ui';

import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class StoryView extends StatefulWidget {
  final String imageUrl;
  final String userName;
  final int userInt;
  final String userPhoto;

  const StoryView(
      {super.key,
      required this.imageUrl,
      required this.userName,
      required this.userInt,
      required this.userPhoto});

  @override
  State<StoryView> createState() => _StoryViewState();
}

final viewModel = getIt.get<SafariViewModel>();

class _StoryViewState extends State<StoryView> {
  @override
  void initState() {
    viewModel.startProgress();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff231F1F),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              GestureDetector(
                onDoubleTap: viewModel.doubleTap,
                onTap: () => Navigator.pop(context),
                onLongPress: () => viewModel.pauseProgress(),
                onLongPressUp: () => viewModel.resumeProgress(),
                child: Center(
                  child: ClipRect(
                    child: Hero(
                      tag: "story_${widget.imageUrl.hashCode}", // benzersiz tag
                      // veya postID gibi benzersiz
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: DeviceConfig.screenWidth!,
                            height: DeviceConfig.screenHeight! * 0.88,
                            color: cBlack,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(30),
                            //   image: DecorationImage(
                            //     fit: BoxFit.fill,
                            //     image: AssetImage("assets/profil/test.jpg"),
                            //   ),
                            // ),
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                AspectRatio(aspectRatio: 181 / 24),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Row(
                                    children: [
                                      PostUserHandler(
                                          userPhoto: widget.userPhoto,
                                          userName: widget.userName,
                                          userInt: widget.userInt),
                                      Spacer(),
                                      CancelButton()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                              child: Opacity(
                            opacity: viewModel.isStorylikeAnimated ? 1 : 0,
                            child: HeartStory(
                              duration: Duration(milliseconds: 700),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 100,
                              ),
                              isAnimate: viewModel.isStorylikeAnimated,
                              onEnd: viewModel.onEnd,
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: DeviceConfig.screenWidth! * 0.02,
                              height: DeviceConfig.screenHeight! * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: DeviceConfig.screenHeight! *
                                        0.2 *
                                        viewModel.progress,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AspectRatio(aspectRatio: 181 / 8),
              Container(
                width: DeviceConfig.screenWidth! * 0.89,
                height: DeviceConfig.screenHeight! * 0.066,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 1,
                      color: cTextGrey,
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Mesajını yaz..",
                        style: Tstyle.headStyle(
                            textSize: 14,
                            fontW: FontWeight.w600,
                            color: cTextGrey),
                      ),
                      Spacer(),
                      HeartStory(
                        isAnimate: viewModel.isStorylike,
                        onEnd: () {},
                        alwaysAnimate: true,
                        child: IconButton(
                          color: viewModel.isStorylike ? Colors.red : null,
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HeartStory extends StatefulWidget {
  final Widget child;
  final bool isAnimate;
  final bool alwaysAnimate;
  final Duration duration;
  final VoidCallback onEnd;

  const HeartStory(
      {super.key,
      required this.child,
      required this.isAnimate,
      this.duration = const Duration(milliseconds: 250),
      required this.onEnd,
      this.alwaysAnimate = false});

  @override
  State<HeartStory> createState() => _HeartStoryState();
}

class _HeartStoryState extends State<HeartStory>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    super.initState();
    final halfDuration = widget.duration.inMilliseconds ~/ 2;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: halfDuration),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant HeartStory oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimate != oldWidget.isAnimate) {
      doAnimation();
    }
  }

  Future doAnimation() async {
    if (widget.isAnimate || widget.alwaysAnimate) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(Duration(milliseconds: 400));
      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: scale,
        child: widget.child,
      );
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigation.ofPop();
        },
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cTransparent, // Şeffaf renk
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50), // Yuvarlak şekil için
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 17, sigmaY: 4), // Arka planı bulanıklaştırmak için
              child: Container(
                child: SvgPicture.asset(
                  "assets/safari/cancel.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PostUserHandler extends StatelessWidget {
  const PostUserHandler({
    super.key,
    required this.userPhoto,
    required this.userName,
    required this.userInt,
  });

  final String userPhoto;
  final String userName;
  final int userInt;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: DeviceConfig.screenWidth! * 0.11,
      child: Container(
        height: DeviceConfig.screenHeight! * 0.07,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: cPrimaryColor, width: 1),
                    ),
                    child: CircleAvatar(
                      backgroundImage: userPhoto.isEmpty
                          ? const AssetImage("assets/sign_up/user.png")
                              as ImageProvider
                          : FileImage(File(userPhoto)),
                    ),
                  ),
                  const SizedBox(width: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userName,
                                style: Tstyle.headStyle(
                                  textSize: 14,
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/profil/post_inc.svg",
                                    width: 20,
                                    theme: const SvgTheme(currentColor: cBlack),
                                  ),
                                  Text(
                                    userInt.toString(),
                                    style: Tstyle.headStyle(
                                      textSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
