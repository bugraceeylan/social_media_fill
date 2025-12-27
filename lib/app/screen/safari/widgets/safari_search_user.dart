import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/s_search_history_item.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/search_user_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SafariSearchUser extends StatelessWidget {
  const SafariSearchUser({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = getIt.get<MainViewModel>();

    return Observer(
        builder: (context) => mainViewModel.selectedIndex == 1
            ? Scaffold(
                appBar: const ConstAppBar(title: "Kullanıcı Ara"),
                body: Column(
                  children: [
                    const AspectRatio(aspectRatio: 181 / 11),
                    const SearchUser(),
                    const AspectRatio(aspectRatio: 181 / 11),
                    const HistorySearchContanier(
                      imageUrl: '',
                      name: 'aslı.tuga',
                    ),
                    const HistorySearchContanier(
                      imageUrl: '',
                      name: 'aslı.tuga',
                    ),
                    const HistorySearchContanier(
                      imageUrl: '',
                      name: 'aslı.tuga',
                    ),
                    const AspectRatio(aspectRatio: 181 / 4),
                    Text(
                      "Arama geçmişini temizle",
                      style: Tstyle.headStyle(textSize: 14, color: cTextGrey),
                    )
                  ],
                ),
                bottomNavigationBar:
                    BottomNavBarWidget(viewModel: mainViewModel),
              )
            : const MainView());
  }
}
