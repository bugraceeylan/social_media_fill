import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/data/models/comment/comment_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/comment_send.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_comment_list.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CommentSheet extends StatelessWidget {
  final String postID;
  final String userName;
  const CommentSheet({super.key, required this.postID, required this.userName});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SafariViewModel>();
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ShowModalAppbar(title: 'Yorumlar'),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .doc(postID)
                .collection('comments')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              final comments = snapshot.data!.docs
                  .map((e) =>
                      CommentModel.fromJson(e.data() as Map<String, dynamic>))
                  .toList();

              return SizedBox(
                height: DeviceConfig.screenHeight! * 0.3,
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final c = comments[index];
                    return UserCommentList(
                      userPhoto: c.userImage,
                      userName: c.userName,
                      userComment: c.comment,
                      commentLike: c.commentLikeCount.toString(),
                    );
                  },
                ),
              );
            },
          ),
          CommentSend(
            userName: userName,
            commentsController: controller,
            onSend: (String text) async {
              if (text.trim().isNotEmpty) {
                await viewModel.addCommentToPost(
                  postID: postID,
                  commentText: text,
                );
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
