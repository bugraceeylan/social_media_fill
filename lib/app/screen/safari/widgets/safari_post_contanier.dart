import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_background_fake.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_bottom.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_user_header.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SafariPostContanier extends StatelessWidget {
  final String postLikeCount;
  final String postUserName;
  final String postShareTime;
  final String postCommentCount;
  final int postUserCount;
  final String postAbout;
  final String postContent;
  final String postUserPhoto;
  final VoidCallback commentOnShow;
  final VoidCallback showPostOpt;
  final VoidCallback goUserStory;
  final VoidCallback isPostLiked;
  final bool isPostLike;
  final VoidCallback goUserProfile;

  const SafariPostContanier({
    super.key,
    required this.postLikeCount,
    required this.postUserName,
    required this.postShareTime,
    required this.postCommentCount,
    required this.postUserCount,
    required this.postAbout,
    required this.postContent,
    required this.postUserPhoto,
    required this.commentOnShow,
    required this.showPostOpt,
    required this.goUserStory,
    required this.isPostLiked,
    required this.isPostLike,
    required this.goUserProfile,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SafariViewModel>();

    return Wrap(
      children: [
        Stack(
          children: [
            const BackGroundFake(),
            Container(
              width: DeviceConfig.screenWidth! * 1,
              height: DeviceConfig.screenHeight! * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    postContent,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserPostHeader(
                    userName: postUserName,
                    userPhoto: postUserPhoto,
                    userInt: postUserCount,
                    goUserStory: goUserStory,
                    screenHeight: DeviceConfig.screenHeight! * 0.07,
                    goUserProfile: goUserProfile,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Observer(
                      // Observer ekliyoruz
                      builder: (_) => GestureDetector(
                        onTap: () => viewModel.toggleFollowRequest(),
                        child: Container(
                          alignment: Alignment.center,
                          width: viewModel.isFollowRequestSent
                              ? DeviceConfig.screenWidth! * 0.31
                              : DeviceConfig.screenWidth! * 0.27,
                          height: DeviceConfig.screenHeight! * 0.046,
                          decoration: BoxDecoration(
                            color: viewModel.isFollowRequestSent
                                ? cWhite
                                : cPrimaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            viewModel.isFollowRequestSent
                                ? "İstek Gönderildi"
                                : "Takip et",
                            style:
                                Tstyle.headStyle(textSize: 13, color: cBlack),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        PostBottom(
          postLikeCount: postLikeCount,
          postUserName: postUserName,
          postShareTime: postShareTime,
          postCommentCount: postCommentCount,
          postAbout: postAbout,
          commentOnShow: commentOnShow,
          isPostLike: isPostLike,
          isPostLiked: isPostLiked,
        ),
      ],
    );
  }
}
