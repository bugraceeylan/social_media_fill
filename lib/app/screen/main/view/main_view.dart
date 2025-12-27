import 'package:fill_store_bb/app/components/AppBar/PK_appbar.dart';
import 'package:fill_store_bb/app/components/AppBar/profile_appbar.dart';
import 'package:fill_store_bb/app/components/AppBar/safari_appbar.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/core/network/no_network.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/main/widgets/no_network_screen.dart';
import 'package:fill_store_bb/app/screen/splash/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final viewModel = getIt.get<MainViewModel>();

  @override
  void dispose() {
    viewModel.networkControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SplashViewModel _viewModel = getIt.get<SplashViewModel>();

    return PopScope(
      canPop: false,
      child: Observer(
          builder: (context) => Scaffold(
                backgroundColor: appColor,
                appBar: viewModel.selectedIndex == 0
                    ? const PKViewAppBar(title: "")
                    : viewModel.selectedIndex == 1
                        ? const SafariAppbarView(title: "title")
                        : viewModel.selectedIndex == 2
                            ? const ProfileViewAppBar(title: "title")
                            : const ProfileViewAppBar(title: ""),
                resizeToAvoidBottomInset: false,
                body: viewModel.networkResult == NetworkResult.off
                    ? NoNetworkScreen(onPressed: () {
                        _viewModel.init();
                      })
                    : Center(
                        child: viewModel.widgetOptions
                            .elementAt(viewModel.selectedIndex),
                      ),
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      height: 1,
                      color: Colors.grey.shade100,
                    ),
                    BottomNavBarWidget(viewModel: viewModel),
                  ],
                ),
              )),
    );
  }
}
