import 'package:fill_store_bb/app/components/AppBar/PK_appbar.dart';
import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/pk/view/pk_view.dart';
import 'package:fill_store_bb/app/screen/pk/widgets/top_music.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TopStory extends StatelessWidget {
  const TopStory({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = getIt.get<MainViewModel>();

    return Observer(
        builder: (context) => mainViewModel.selectedIndex == 0
            ? Scaffold(
                appBar: PKViewAppBar(title: ""),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Top3TitleGradient(
                        title: 'Hikayeler',
                      ),
                      const BestTopContanier(
                        type: 'post',
                        pkNumber: 1,
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        userPhoto: '',
                        pkLike: '500',
                        postContent: 'assets/profil/post.jpg',
                      ),
                      const BestTopContanier(
                        type: 'post',
                        pkNumber: 2,
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        userPhoto: '',
                        pkLike: '500',
                        postContent: 'assets/profil/post.jpg',
                      ),
                      const BestTopContanier(
                        type: 'post',
                        pkNumber: 3,
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        userPhoto: '',
                        pkLike: '500',
                        postContent: 'assets/profil/post.jpg',
                      ),
                      const BestTopContanier(
                        type: 'post',
                        pkNumber: 4,
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        userPhoto: '',
                        pkLike: '500',
                        postContent: 'assets/profil/post.jpg',
                      ),
                      const BestTopContanier(
                        type: 'post',
                        pkNumber: 5,
                        userName: 'ahucetin90',
                        userPostPoint: 100,
                        userPhoto: '',
                        pkLike: '500',
                        postContent: 'assets/profil/post.jpg',
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar:
                    BottomNavBarWidget(viewModel: mainViewModel),
              )
            : MainView());
  }
}
