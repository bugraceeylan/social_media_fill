import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/AppBar/post_share_appbar.dart';
import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/selected_post_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PostShare extends StatelessWidget {
  final String selectedPostPhoto;
  const PostShare({super.key, required this.selectedPostPhoto});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ProfileViewModel>();

    final GlobalKey newPhotoKey = GlobalKey();
    final GlobalKey newDeleteButtonKey = GlobalKey();

    return Scaffold(
      appBar: PostShareAppbar(
        title: "Post Paylaş",
        onBack: () {
          Navigation.ofPop();
        },
      ),
      resizeToAvoidBottomInset: true, // 🔥 Klavye açıldığında ekran kayar
      backgroundColor: const Color(0xff231F1F),
      body: Observer(
        builder: (_) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  20, // 🔥 Klavyeye göre padding ver
            ),
            child: Column(
              children: [
                AspectRatio(aspectRatio: 181 / 11),
                SelectedPostPhoto(
                  postPhoto: selectedPostPhoto,
                  photoKey: newPhotoKey,
                  deletButtonKey: newDeleteButtonKey,
                ),
                AspectRatio(aspectRatio: 181 / 3),
                Container(
                  width: DeviceConfig.screenWidth!,
                  height: DeviceConfig.screenHeight! * 0.2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: cTextGrey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: viewModel.selectedPostAbout,
                      maxLines: null,
                      style: Tstyle.headStyle(textSize: 14, color: cWhite),
                      decoration: const InputDecoration(
                        hintText: "Bir açıklama giriniz...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: KeyButton(
          title: "Postu Paylaş",
          onPressed: () async {
            try {
              final viewModel = getIt.get<ProfileViewModel>();

              final newPost = PostModel(
                postID: FirebaseFirestore.instance.collection('posts').doc().id,
                userID: viewModel.userModel.id!,
                userName: viewModel.userModel.userTag ?? '',
                postImage: selectedPostPhoto,
                postPoints: 0,
                postLike: 0,
                comments: [],
                postAbout: viewModel.selectedPostAbout.text,
                postShareTime: DateTime.now().toIso8601String(),
                effectName: viewModel.selectedEffect.toString(),
                texts: [],
                musicName: viewModel.selectedMusicName, likedBy: [],
              );

              await FirebaseFirestore.instance
                  .collection('posts')
                  .doc(newPost.postID)
                  .set(newPost.toJson());

              print("Post başarıyla kaydedildi!");

              Navigation.pushAndRemoveAll(page: const MainView());
            } catch (e) {
              print("Post paylaşım hatası: $e");
            }
          }),
    );
  }
}
