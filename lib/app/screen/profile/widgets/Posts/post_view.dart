import 'package:fill_store_bb/app/components/AppBar/post_share_appbar.dart';
import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/Posts/post_share.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_edit_tools.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_share_edit_page.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_timer_set.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/selected_post_photo.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_add_text.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_effect.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_music_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PostView extends StatelessWidget {
  final String selectedPostPhoto;
  const PostView({super.key, required this.selectedPostPhoto});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ProfileViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xff231F1F),
      appBar: PostShareAppbar(
        title: "Post Paylaş",
        onBack: () {
          if (viewModel.selectedIndex == 0) {
            Navigation.ofPop();
          } else {
            viewModel.selectedIndex = 0;
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(aspectRatio: 181 / 11),
            PostEditTools(
              onToolTap: (index) {
                viewModel.setSelectedIndex(index);
              },
            ),
            AspectRatio(aspectRatio: 181 / 11),
            SelectedPostPhoto(
              postPhoto: selectedPostPhoto,
              photoKey: viewModel.photoKey,
              deletButtonKey: viewModel.deleteButtonKey,
            ),
            Observer(
              builder: (_) {
                switch (viewModel.selectedIndex) {
                  case 1:
                    return EffectsList(
                      selectedPostPhotoEffect: selectedPostPhoto,
                    );
                  case 2:
                    return ToolsAddText(
                      selectedPostPhoto: selectedPostPhoto,
                    );
                  case 3:
                    return const ToolsMusicList();

                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => viewModel.selectedIndex != 0
            ? TypeToolsButton(
                onPressed: () async {
                  if (viewModel.selectedIndex == 1) {
                    await viewModel.applyEffect(
                        viewModel.effectMatrices[viewModel.selectedEffectKey]!);
                    viewModel.selectedIndex = 0;
                  } else if (viewModel.selectedIndex == 2) {
                    viewModel.selectedIndex = 0;
                  } else if (viewModel.selectedIndex == 3) {
                    viewModel.selectedIndex = 0;
                  } else if (viewModel.selectedIndex == 4) {
                    viewModel.selectedIndex = 0;
                  }
                },
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: KeyButton(
                  title: "Devam et",
                  onPressed: () {
                    Navigation.push(
                        page: PostShare(selectedPostPhoto: selectedPostPhoto));
                  },
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
