import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required MainViewModel viewModel,
  }) : _viewModel = viewModel;

  final MainViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BottomNavigationBar(
        items: _viewModel.navBarItems,
        iconSize: 25,
        backgroundColor: Colors.white,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        currentIndex: _viewModel.selectedIndex,
        selectedItemColor: cPrimaryGreen, // düzelt 1
        unselectedItemColor: cUnSelectedColor,
        onTap: _viewModel.onItemTapped,
        unselectedFontSize: 13,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      );
    });
  }
}
