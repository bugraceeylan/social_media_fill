import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_edit_tools.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_timer_set.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/selected_post_photo.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_add_text.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_effect.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_music_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PostShareEditPage extends StatefulWidget {
  final String selectedPostPhoto;
  const PostShareEditPage({super.key, required this.selectedPostPhoto});

  @override
  State<PostShareEditPage> createState() => _PostShareEditPageState();
}

class _PostShareEditPageState extends State<PostShareEditPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ProfileViewModel>();

    return Scaffold(
      backgroundColor: Color(0xff231F1F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              GestureDetector(
                onTap: () {
                  if (viewModel.selectedIndex == 0) {
                    Navigation.ofPop();
                  } else {
                    viewModel.selectedIndex = 0;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffC8C5C5)),
                    child: Icon(
                      Icons.arrow_back,
                      color: cWhite,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
            backgroundColor: Color(0xff231F1F),
            title: Text("Post Paylaş",
                style: Tstyle.headStyle(textSize: 16, color: cWhite)),
            centerTitle: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(aspectRatio: 181 / 11),
              Observer(
                builder: (_) => viewModel.selectedIndex != 0
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PostEditTools(
                          onToolTap: (index) {
                            viewModel.setSelectedIndex(index);
                          },
                        ),
                      ),
              ),
              AspectRatio(aspectRatio: 181 / 22),
              viewModel.selectedIndex == 4
                  ? PostTimerSet()
                  : SelectedPostPhoto(
                      postPhoto: widget.selectedPostPhoto,
                      photoKey: viewModel.photoKey,
                      deletButtonKey: viewModel.deleteButtonKey,
                    ),
              Observer(
                builder: (_) => viewModel.selectedIndex == 1
                    ? EffectsList(
                        selectedPostPhotoEffect: widget.selectedPostPhoto)
                    : viewModel.selectedIndex == 2
                        ? ToolsAddText(
                            selectedPostPhoto: widget.selectedPostPhoto)
                        : viewModel.selectedIndex == 3
                            ? ToolsMusicList()
                            : SizedBox(),
              ),
            ],
          );
        }),
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
                child: KeyButton(title: "Devam et"),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TypeToolsButton extends StatelessWidget {
  final VoidCallback onPressed;
  const TypeToolsButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: DeviceConfig.screenWidth! * 0.7,
        height: DeviceConfig.screenHeight! * 0.1,
        decoration: BoxDecoration(color: cTextGrey, shape: BoxShape.circle),
        child: SvgPicture.asset(
          "assets/profil/tick.svg",
          width: 5,
          height: 5,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}

class TypeToolsWrap extends StatelessWidget {
  const TypeToolsWrap({
    super.key,
    required this.widget,
    required this.listType,
  });

  final PostShareEditPage widget;
  final Widget listType;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        listType,
      ],
    );
  }
}
