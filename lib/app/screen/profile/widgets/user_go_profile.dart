import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/core/result/data_result.dart';
import 'package:fill_store_bb/app/core/result/result.dart';
import 'package:fill_store_bb/app/core/result/success_data_result.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/shadow_line.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_about.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_details.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_photo.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_sec_following.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_selected_followers.dart';
import 'package:fill_store_bb/app/screen/safari/view/story_view.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_post_contanier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class UserGoProfile extends StatefulWidget {
  final String userProfile;
  final String userName;
  final String userSurname;
  final String userTag;
  final String userTitle;
  final String userAbout;
  final bool isFollow;
  final String userFollower;
  final String userFollow;
  final String userSharePostCount;
  final String userID;

  const UserGoProfile({
    super.key,
    required this.userProfile,
    required this.userName,
    required this.userTag,
    required this.userTitle,
    required this.userAbout,
    required this.isFollow,
    required this.userFollower,
    required this.userFollow,
    required this.userSharePostCount,
    required this.userSurname,
    required this.userID,
  });

  @override
  _UserGoProfileState createState() => _UserGoProfileState();
}

class _UserGoProfileState extends State<UserGoProfile> {
  final viewModel = getIt.get<ProfileViewModel>();
  final userRepository = getIt.get<UserRepository>();
  final sviewModel = getIt.get<SafariViewModel>();
  final mainViewModel = getIt.get<MainViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.checkUserFollowStatus(widget.userID);
    viewModel.fetchUserPosts(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => mainViewModel.selectedIndex == 1 ||
                mainViewModel.selectedIndex == 2
            ? Scaffold(
                appBar: ConstAppBar(
                    title: "${widget.userName} ${widget.userSurname}"),
                body: RefreshIndicator(
                  onRefresh: () => viewModel.fetchUserPosts(widget.userID),
                  child: SingleChildScrollView(
                    child: Observer(
                      builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const AspectRatio(aspectRatio: 181 / 11),
                            Row(
                              children: [
                                UserProfilePhoto(
                                  viewModel: viewModel,
                                  onPressed: () {},
                                  images: null,
                                ),
                                UserAboutProfile(
                                  name: widget.userName,
                                  surname: widget.userSurname,
                                  userAbout: widget.userAbout,
                                  userName: widget.userTag,
                                  userTitle: widget.userTitle,
                                ),
                                widget.userID == viewModel.userModel.id
                                    ? const SizedBox() // Kendi profiliyse boş kutu döner
                                    : GestureDetector(
                                        onTap: () async {
                                          viewModel.toggleFollow(widget.userID);
                                          await viewModel.checkUserFollowStatus(
                                              widget.userID);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: DeviceConfig.screenWidth! *
                                              (viewModel.isFollowing
                                                  ? 0.27
                                                  : 0.2),
                                          height: DeviceConfig.screenHeight! *
                                              0.036,
                                          decoration: BoxDecoration(
                                            color: viewModel.isFollowing
                                                ? Colors.transparent
                                                : cPrimaryGreen,
                                            border: viewModel.isFollowing
                                                ? Border.all(
                                                    width: 1, color: cTextGrey)
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            viewModel.isPrivate
                                                ? (viewModel.isRequestSent
                                                    ? "İstek Gönderildi"
                                                    : "Takip et")
                                                : (viewModel.isFollowing
                                                    ? "Takiptesin"
                                                    : "Takip et"),
                                            style: Tstyle.headStyle(
                                              textSize: 13,
                                              color: (viewModel.isPrivate &&
                                                          viewModel
                                                              .isRequestSent) ||
                                                      (!viewModel.isPrivate &&
                                                          viewModel.isFollowing)
                                                  ? cTextGrey
                                                  : cWhite,
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                            const AspectRatio(aspectRatio: 181 / 11),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                UserProfileDetails(
                                  head: "Takip Edilen",
                                  body: viewModel.userFollowingCount.toString(),
                                  typeGo: UserSelectedFollowing(
                                    title: 'Takip',
                                    userID: widget.userID,
                                  ),
                                ),
                                Observer(builder: (_) {
                                  return UserProfileDetails(
                                    head: "Takipçi",
                                    body:
                                        viewModel.userFollowerCount.toString(),
                                    typeGo: UserSelectedFollowers(
                                      title: 'Takipçi',
                                      userID: widget.userID,
                                    ),
                                  );
                                }),
                                UserProfileDetails(
                                  head: "Paylaşım",
                                  body: widget.userSharePostCount,
                                  typeGo: SizedBox(),
                                ),
                              ],
                            ),
                            AspectRatio(aspectRatio: 181 / 11),
                            const PageShadowLine(),
                            AspectRatio(aspectRatio: 181 / 11),
                            Observer(builder: (_) {
                              final posts = viewModel.userPosts;
                              return posts.isEmpty
                                  ? const Text("Henüz gönderi yok.")
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: posts.length,
                                      itemBuilder: (context, index) {
                                        final post = posts[index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: SafariPostContanier(
                                            postLikeCount:
                                                post.postLike.toString(),
                                            postUserName: post.userName,
                                            postShareTime:
                                                sviewModel.calculateTimeAgo(
                                                    post.postShareTime),
                                            postCommentCount:
                                                post.comments.length.toString(),
                                            postUserCount: post.postPoints,
                                            postAbout: post.postAbout,
                                            postContent:
                                                "https://images.pexels.com/photos/1212600/pexels-photo-1212600.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                            postUserPhoto: "",
                                            commentOnShow: () =>
                                                sviewModel.commentPopUp(context,
                                                    post.postID, post.userName),
                                            showPostOpt: () =>
                                                sviewModel.showPostOpt(context),
                                            goUserStory: () {},
                                            isPostLiked: () async {
                                              await sviewModel
                                                  .togglePostLike(post);
                                            },
                                            isPostLike: sviewModel
                                                        .postLikeStates[
                                                    post.postID] ??
                                                post.likedBy?.contains(
                                                    viewModel.userModel.id) ??
                                                false,
                                            goUserProfile: () async {},
                                          ),
                                        );
                                      },
                                    );
                            })
                          ],
                        );
                      },
                    ),
                  ),
                ),
                bottomNavigationBar:
                    BottomNavBarWidget(viewModel: mainViewModel),
              )
            : const MainView());
  }
}
