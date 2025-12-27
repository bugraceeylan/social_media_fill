import 'package:fill_store_bb/app/constant/assets_text.dart';
import 'package:fill_store_bb/app/screen/safari/view/safari_view.dart';
import 'package:fill_store_bb/app/screen/safari/view/story_view.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_post_contanier.dart';
import 'package:flutter/material.dart';

class SafariFriendsView extends StatelessWidget {
  const SafariFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: 181 / 11),
        DiscoverAndFriendsView(viewModel: viewModel),
        const AspectRatio(aspectRatio: 181 / 11),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafariPostContanier(
            postLikeCount: '631',
            postUserName: 'ahucetin90',
            postShareTime: '1s önce',
            postCommentCount: '156',
            postUserCount: 102,
            postAbout: loremParis,
            postContent: "assets/profil/post.jpg",
            postUserPhoto: "", // Kullanıcı profil fotoğrafı
            commentOnShow: () => viewModel.commentPopUp(context, "",""),
            showPostOpt: () => viewModel.showPostOpt(context),
            goUserStory: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      StoryView(
                    imageUrl: "assets/profil/post.jpg",
                    userName: 'ahucetin903',
                    userInt: 103,
                    userPhoto: '',
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            isPostLiked: () {
              print(viewModel.isPostLike);

              viewModel.isPostLike = true;
              print(viewModel.isPostLike);
            },
            isPostLike: viewModel.isPostLike, goUserProfile: () {  },
          ),
        ),
      ],
    );
  }
}
