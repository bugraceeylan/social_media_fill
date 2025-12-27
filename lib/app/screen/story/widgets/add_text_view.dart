import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_text_list.dart';
import 'package:fill_store_bb/app/screen/story/viewmodel/story_viewmodel.dart';
import 'package:flutter/material.dart';

class VideoAddText extends StatelessWidget {
  final String selectedPostPhoto;
  VideoAddText({super.key, required this.selectedPostPhoto});

  final viewModel = getIt.get<StoryViewModel>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        AspectRatio(aspectRatio: 181 / 11),
        TextListed(),
        AspectRatio(aspectRatio: 181 / 11),
      ],
    );
  }
}