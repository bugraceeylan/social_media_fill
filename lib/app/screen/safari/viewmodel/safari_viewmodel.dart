import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/data/models/comment/comment_model.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/comment_sheet.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_discover_view.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_friends_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
part 'safari_viewmodel.g.dart';

class SafariViewModel = _SafariViewModelBase with _$SafariViewModel;

abstract class _SafariViewModelBase with Store {
  @observable
  bool isPostLike = false;
  @observable
  bool isFollowRequestSent = false;

  @observable
  double progress = 0.0;
  @observable
  Timer? _timer;
  @observable
  bool _isPaused = false;
  @observable
  bool isStorylike = false;
  @observable
  bool isStorylikeAnimated = false;
  @observable
  int selectedIndex = 0;
  @observable
  bool isFollowed = false;
  @observable
  TextEditingController messageController = TextEditingController();
  @observable
  double containerHeight = DeviceConfig.screenHeight! * 0.04;
  @observable
  double maxHeight = DeviceConfig.screenHeight! * 0.1;
  @observable
  List<String> messages = [];
  @observable
  UserModel userModel = userBox.values.first;
  @observable
  ObservableMap<String, bool> postLikeStates = ObservableMap<String, bool>();

  @action
  void updateHeight() {
    final textSpan = TextSpan(
      text: messageController.text,
      style: const TextStyle(fontSize: 16),
    );
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 5,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: DeviceConfig.screenWidth! * 0.75);

    containerHeight = textPainter.size.height + 20;
    if (containerHeight > maxHeight) containerHeight = maxHeight;
  }

  @action
  String calculateTimeAgo(String postShareTime) {
    final postTime = DateTime.tryParse(postShareTime);
    if (postTime == null) return "";

    final now = DateTime.now();
    final difference = now.difference(postTime);

    if (difference.inMinutes < 1) return 'Az önce';
    if (difference.inMinutes < 60) return '${difference.inMinutes}dk önce';
    if (difference.inHours < 24) return '${difference.inHours}sa önce';
    return '${difference.inDays}g önce';
  }

  @action
  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add(messageController.text.trim());
      messageController.clear();
      containerHeight = DeviceConfig.screenHeight! * 0.04;
    }
  }

  @action
  String formatText(String text) {
    if (text.length > 60) {
      text = text.substring(0, 60) + "...";
    }

    List<String> words = text.split(" ");
    String firstLine = "";
    String secondLine = "";
    for (String word in words) {
      if ((firstLine.length + word.length) <= 30) {
        firstLine += (firstLine.isEmpty ? "" : " ") + word;
      } else {
        secondLine += (secondLine.isEmpty ? "" : " ") + word;
      }
    }

    return "$firstLine\n$secondLine";
  }

  @action
  void userFollowed() {
    isFollowed = !isFollowed;
  }

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
    print(selectedIndex);
  }

  @action
  Future<void> toggleLike(PostModel post, String currentUserID) async {
    final ref = FirebaseFirestore.instance.collection('posts').doc(post.postID);

    final likedBy = post.likedBy ?? []; // NULL güvenliği

    final isLiked = likedBy.contains(currentUserID);
    final updatedLikes = isLiked
        ? likedBy.where((id) => id != currentUserID).toList()
        : [...likedBy, currentUserID];

    await ref.update({
      'likedUserIDs': updatedLikes,
      'postLike': FieldValue.increment(isLiked ? -1 : 1),
    });
  }

  @action
  Future<void> togglePostLike(PostModel post) async {
    final currentUserID = userModel.id!;
    final ref = FirebaseFirestore.instance.collection('posts').doc(post.postID);

    final snapshot = await ref.get();
    final data = snapshot.data();
    if (data == null) return;

    final List likedBy = data['likedUserIDs'] ?? [];
    final isLiked = likedBy.contains(currentUserID);

    final updatedLikes = isLiked
        ? likedBy.where((id) => id != currentUserID).toList()
        : [...likedBy, currentUserID];

    await ref.update({
      'likedUserIDs': updatedLikes,
      'postLike': FieldValue.increment(isLiked ? -1 : 1),
    });

    postLikeStates[post.postID] = !isLiked;
  }

  @action
  Future<void> addCommentToPost({
    required String postID,
    required String commentText,
  }) async {
    final comment = CommentModel(
      userImage: userModel.profilePhoto ?? '',
      userName: userModel.userTag ?? '',
      comment: commentText,
      commentLikeCount: 0,
      commentLike: false,
      timestamp: DateTime.now().toIso8601String(),
    );

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postID)
        .collection('comments')
        .add(comment.toJson());
  }

  @observable
  List<Widget> widgetOptions = <Widget>[
    const SafariDiscoverView(),
    const SafariFriendsView(),
  ];
  @action
  void doubleTap() {
    isStorylike = true;
    isStorylikeAnimated = true;
  }

  @action
  void onEnd() {
    isStorylikeAnimated = false;
  }

  @action
  void startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!_isPaused) {
        if (progress < 1.0) {
          progress += 0.005;
        } else {
          _timer?.cancel();
        }
      }
    });
  }

  @action
  void pauseProgress() {
    _isPaused = true;
  }

  @action
  void resumeProgress() {
    _isPaused = false;
  }

  @action
  void dispose() {
    _timer?.cancel();
    progress = 0.0;
    _isPaused = false;
    onEnd();
  }

  @action
  void commentPopUp(BuildContext context, String postID, String userName) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: cWhite,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CommentSheet(
          postID: postID,
          userName: userName,
        );
      },
    );
  }

  @action
  void toggleFollowRequest() {
    isFollowRequestSent = !isFollowRequestSent;
  }

  @action
  void showPostOpt(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: cWhite,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Gönderi Detayları",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 25),
                ElevatedButton(
                  style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: cBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffE2E1E1))),
                  onPressed: () {
                    Navigator.pop(context); // BottomSheet'i kapatır.
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/profil/trash.svg"),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Bu gönderiyi sil",
                          style: TextStyle(
                            color: cBlack,
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 8),
                ElevatedButton(
                  style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: cBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffE2E1E1))),
                  onPressed: () {
                    Navigator.pop(context); // BottomSheet'i kapatır.
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          color: cBlack,
                          "assets/svg_assets/edit.svg",
                          theme: const SvgTheme(
                            currentColor: cBlack,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Bu gönderiyi düzenle",
                          style: TextStyle(
                            color: cBlack,
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 25),
              ],
            ),
          ),
        );
      },
    );
  }
}
