import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/assets_text.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/safari/view/story_view.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_post_contanier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SafariView extends StatelessWidget {
  const SafariView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SafariViewModel>();

    return SingleChildScrollView(
      child: Observer(builder: (_) {
        return Column(
          children: [
            const SizedBox(height: 16),
            viewModel.widgetOptions[viewModel.selectedIndex],
          ],
        );
      }),
    );
  }
}

class DiscoverAndFriendsView extends StatelessWidget {
  const DiscoverAndFriendsView({
    super.key,
    required this.viewModel,
  });

  final SafariViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => viewModel.onItemTapped(0),
          child: Text(
            "Keşfet",
            style: Tstyle.headStyle(
              textSize: 16,
              color: viewModel.selectedIndex == 0 ? cTextBlack : cTextGrey,
            ),
          ),
        ),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () => viewModel.onItemTapped(1),
          child: Text(
            "Arkadaşlar",
            style: Tstyle.headStyle(
              textSize: 16,
              color: viewModel.selectedIndex == 1 ? cTextBlack : cTextGrey,
            ),
          ),
        ),
      ],
    );
  }
}
