import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/core/result/data_result.dart';
import 'package:fill_store_bb/app/core/result/result.dart';
import 'package:fill_store_bb/app/core/result/success_data_result.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_go_profile.dart';
import 'package:fill_store_bb/app/screen/safari/view/story_view.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_post_contanier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SafariDiscoverView extends StatelessWidget {
  const SafariDiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SafariViewModel>();
    final userRepository = getIt.get<UserRepository>();

    return StreamBuilder<DataResult<List<PostModel>>>(
      stream: userRepository.getAllPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data is ErrorDataResult) {
          return const Center(child: Text("Hiç gönderi bulunamadı."));
        }

        final posts = snapshot.data!.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SafariPostContanier(
                postLikeCount: post.postLike.toString(),
                postUserName: post.userName,
                postShareTime: viewModel.calculateTimeAgo(post.postShareTime),
                postCommentCount: post.comments.length.toString(),
                postUserCount: post.postPoints,
                postAbout: post.postAbout,
                postContent:
                    "https://images.pexels.com/photos/1212600/pexels-photo-1212600.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                postUserPhoto: "",
                commentOnShow: () =>
                    viewModel.commentPopUp(context, post.postID, post.userName),
                showPostOpt: () => viewModel.showPostOpt(context),
                goUserStory: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          StoryView(
                        imageUrl: post.postImage,
                        userName: post.userName,
                        userInt: post.postPoints,
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
                isPostLiked: () async {
                  await viewModel.togglePostLike(post);
                },
                isPostLike: viewModel.postLikeStates[post.postID] ??
                    post.likedBy?.contains(viewModel.userModel.id) ??
                    false,
                goUserProfile: () async {
                  final userResult =
                      await userRepository.getUserById(post.userID);
                  if (userResult is SuccessDataResult<UserModel>) {
                    final user = userResult.data!;
                    Navigation.push(
                      page: Observer(builder: (_) {
                        return UserGoProfile(
                          userID: user.id!,
                          userProfile: user.profilePhoto ?? '',
                          userName: user.name.toString(),
                          userSurname: user.surName.toString(),
                          userTag: user.userTag.toString(),
                          userTitle: user.title ?? '',
                          userAbout: user.about ?? '',
                          userFollower: user.followerIDs!.length.toString(),
                          userFollow: user.followingIDs!.length.toString(),
                          userSharePostCount:
                              user.postShared!.length.toString(),
                          isFollow: false,
                        );
                      }),
                    );
                  } else {
                    // hata durumu
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Kullanıcı bilgisi alınamadı")),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
