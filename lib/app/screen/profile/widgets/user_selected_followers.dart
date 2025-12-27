import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/core/result/success_data_result.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_followers_contanier.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_go_profile.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserSelectedFollowers extends StatefulWidget {
  final String title;
  final String userID;

  const UserSelectedFollowers(
      {super.key, required this.title, required this.userID});

  @override
  State<UserSelectedFollowers> createState() => _UserSelectedFollowersState();
}

class _UserSelectedFollowersState extends State<UserSelectedFollowers> {
  final mainViewModel = getIt.get<MainViewModel>();
  final userRepository = getIt.get<UserRepository>();
  List<UserModel> followers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFollowers();
  }

  Future<void> fetchFollowers() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userID)
        .get();
    final List<dynamic> followerIDs = userDoc.data()?['followerIDs'] ?? [];

    List<UserModel> fetchedUsers = [];

    for (String id in followerIDs) {
      final result = await userRepository.getUserById(id);
      if (result is SuccessDataResult<UserModel>) {
        fetchedUsers.add(result.data!);
      }
    }

    setState(() {
      followers = fetchedUsers;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => mainViewModel.selectedIndex == 1 ||
              mainViewModel.selectedIndex == 2
          ? Scaffold(
              appBar: ConstAppBar(title: widget.title),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const AspectRatio(aspectRatio: 181 / 11),
                    const ProfileSearch(),
                    const AspectRatio(aspectRatio: 181 / 11),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : followers.isEmpty
                            ? const Center(child: Text("Hiç takipçi yok."))
                            : SizedBox(
                                width: DeviceConfig.screenWidth! * 0.9,
                                height: DeviceConfig.screenHeight!,
                                child: ListView.builder(
                                  itemCount: followers.length,
                                  itemBuilder: (context, index) {
                                    final user = followers[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigation.push(
                                            page: UserGoProfile(
                                              userID: user.id!,
                                              userProfile:
                                                  user.profilePhoto ?? '',
                                              userName: user.name ?? '',
                                              userSurname: user.surName ?? '',
                                              userTag: user.userTag ?? '',
                                              userTitle: user.title ?? '',
                                              userAbout: user.about ?? '',
                                              isFollow:
                                                  false, // Gerekirse kontrol et
                                              userFollower: user
                                                      .followerIDs?.length
                                                      .toString() ??
                                                  '0',
                                              userFollow: user
                                                      .followingIDs?.length
                                                      .toString() ??
                                                  '0',
                                              userSharePostCount: user
                                                      .postShared?.length
                                                      .toString() ??
                                                  '0',
                                            ),
                                          );
                                        },
                                        child: FollowersUserContanier(
                                          userName: user.userTag ?? '',
                                          userImage: user.profilePhoto ??
                                              'assets/sign_up/user.png',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavBarWidget(viewModel: mainViewModel),
            )
          : const MainView(),
    );
  }
}
