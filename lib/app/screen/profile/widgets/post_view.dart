import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_background_fake.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_bottom.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_set.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_user_header.dart';
import 'package:flutter/material.dart';

class UserPostContanier extends StatelessWidget {
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
  final VoidCallback isPostLiked;
  final bool isPostLike;

  const UserPostContanier({
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
    required this.isPostLiked,
    required this.isPostLike,
  });

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(
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
                    goUserStory: () {},
                    screenHeight: DeviceConfig.screenHeight! * 0.07, goUserProfile: () {  },
                  ),
                  const Spacer(),
                  PostDetailsButton(
                    showPostOpt: showPostOpt,
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
