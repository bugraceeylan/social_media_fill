import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_text_list.dart';
import 'package:flutter/material.dart';

class ToolsAddText extends StatelessWidget {
  final String selectedPostPhoto;
  ToolsAddText({super.key, required this.selectedPostPhoto});

  final viewModel = getIt.get<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        AspectRatio(aspectRatio: 181 / 11),
        TextListed(),
        AspectRatio(aspectRatio: 181 / 11),
        ColorList(viewModel: getIt.get<ProfileViewModel>()),
      ],
    );
  }
}

class ColorList extends StatelessWidget {
  const ColorList({
    super.key,
    required this.viewModel,
  });

  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.7),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: viewModel.colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
