import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/expandable_text_widget.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_body_tools.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_comment_details.dart';
import 'package:flutter/material.dart';

class PostBottom extends StatelessWidget {
  const PostBottom({
    super.key,
    required this.postLikeCount,
    required this.postUserName,
    required this.postShareTime,
    required this.postCommentCount,
    required this.postAbout,
    required this.commentOnShow, required this.isPostLike, required this.isPostLiked,
  });

  final String postLikeCount;
  final String postUserName;
  final String postShareTime;
  final String postCommentCount;
  final String postAbout;
  final VoidCallback commentOnShow;
  final bool isPostLike;
  final VoidCallback isPostLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth! * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: cWhite,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        PostTools(
          postLikeCount: postLikeCount,
          commentOnShow: commentOnShow,
          isPostLike: isPostLike,
          isPostLiked: isPostLiked,
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(postUserName,
                  style: Tstyle.subStyle(
                    textSize: 14,
                    fontW: FontWeight.w600,
                    color: cTextBlack,
                  )),
              const SizedBox(
                width: 4,
              ),
              Text(postShareTime,
                  style: Tstyle.subStyle(
                      textSize: 13, fontW: FontWeight.w600, color: cTextGrey)),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: double.infinity),
          child: ExpandableTextWidget(
            fullText: postAbout,
            maxTextLength: 77,
          ),
        ),
        Center(child: PostCommentDetails(postCommentCount: postCommentCount)),
      ]),
    );
  }
}
