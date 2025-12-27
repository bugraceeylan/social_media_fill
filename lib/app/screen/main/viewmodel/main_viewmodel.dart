import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/core/network/no_network.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/pk/view/pk_view.dart';
import 'package:fill_store_bb/app/screen/profile/view/profile_view.dart';
import 'package:fill_store_bb/app/screen/safari/view/safari_view.dart';
import 'package:fill_store_bb/nav_bar_icons_icons.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'main_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  // final IHomeRepository iHomeRepository;

  _MainViewModelBase() {
    init();
  }
  @observable
  UserModel userModel = const UserModel();
  final userRepository = getIt.get<UserRepository>();
  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
    print(selectedIndex);
  }

  @observable
  bool isSelectedCategory = false;

  @action
  void setSelectedCategory(bool value) {
    isSelectedCategory = value;
  }

  @observable
  List<Widget> widgetOptions = <Widget>[
    const PkView(),
    const SafariView(),
    const ProfileView(),
  ];

  @observable
  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Icon(NavBarIcons.turnuva),
      ),
      label: "Turnuva",
    ),
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Icon(NavBarIcons.safari),
      ),
      label: "Safari",
    ),
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Icon(NavBarIcons.profil),
      ),
      label: "Profil",
    ),
  ];

  @observable
  // UserModel userModel = UserModel();

  @observable
  INetworkControl networkControl = NetworkControl();

  @observable
  NetworkResult networkResult = NetworkResult.off;

  @action
  void init() {
    print("test");
    networkControl = NetworkControl();
    fetchFirstResult();
    networkControl.handleNetworkChange((result) {
      _updateView(result);
    });
    currentUser();
  }

  @action
  Future fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var result = await networkControl.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  @action
  void _updateView(NetworkResult result) {
    networkResult = result;
  }

  @action
  Future<void> currentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await userRepository.currentUser();
    print(data.data);
    userModel = data.data!;
    print("fasaaa");
  }
}
