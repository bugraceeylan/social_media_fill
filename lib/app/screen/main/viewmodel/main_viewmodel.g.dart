// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewModel on _MainViewModelBase, Store {
  late final _$userModelAtom =
      Atom(name: '_MainViewModelBase.userModel', context: context);

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_MainViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$isSelectedCategoryAtom =
      Atom(name: '_MainViewModelBase.isSelectedCategory', context: context);

  @override
  bool get isSelectedCategory {
    _$isSelectedCategoryAtom.reportRead();
    return super.isSelectedCategory;
  }

  @override
  set isSelectedCategory(bool value) {
    _$isSelectedCategoryAtom.reportWrite(value, super.isSelectedCategory, () {
      super.isSelectedCategory = value;
    });
  }

  late final _$widgetOptionsAtom =
      Atom(name: '_MainViewModelBase.widgetOptions', context: context);

  @override
  List<Widget> get widgetOptions {
    _$widgetOptionsAtom.reportRead();
    return super.widgetOptions;
  }

  @override
  set widgetOptions(List<Widget> value) {
    _$widgetOptionsAtom.reportWrite(value, super.widgetOptions, () {
      super.widgetOptions = value;
    });
  }

  late final _$navBarItemsAtom =
      Atom(name: '_MainViewModelBase.navBarItems', context: context);

  @override
  List<BottomNavigationBarItem> get navBarItems {
    _$navBarItemsAtom.reportRead();
    return super.navBarItems;
  }

  @override
  set navBarItems(List<BottomNavigationBarItem> value) {
    _$navBarItemsAtom.reportWrite(value, super.navBarItems, () {
      super.navBarItems = value;
    });
  }

  late final _$networkControlAtom =
      Atom(name: '_MainViewModelBase.networkControl', context: context);

  @override
  INetworkControl get networkControl {
    _$networkControlAtom.reportRead();
    return super.networkControl;
  }

  @override
  set networkControl(INetworkControl value) {
    _$networkControlAtom.reportWrite(value, super.networkControl, () {
      super.networkControl = value;
    });
  }

  late final _$networkResultAtom =
      Atom(name: '_MainViewModelBase.networkResult', context: context);

  @override
  NetworkResult get networkResult {
    _$networkResultAtom.reportRead();
    return super.networkResult;
  }

  @override
  set networkResult(NetworkResult value) {
    _$networkResultAtom.reportWrite(value, super.networkResult, () {
      super.networkResult = value;
    });
  }

  late final _$fetchFirstResultAsyncAction =
      AsyncAction('_MainViewModelBase.fetchFirstResult', context: context);

  @override
  Future<dynamic> fetchFirstResult() {
    return _$fetchFirstResultAsyncAction.run(() => super.fetchFirstResult());
  }

  late final _$currentUserAsyncAction =
      AsyncAction('_MainViewModelBase.currentUser', context: context);

  @override
  Future<void> currentUser() {
    return _$currentUserAsyncAction.run(() => super.currentUser());
  }

  late final _$_MainViewModelBaseActionController =
      ActionController(name: '_MainViewModelBase', context: context);

  @override
  void onItemTapped(int index) {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(bool value) {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void init() {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.init');
    try {
      return super.init();
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateView(NetworkResult result) {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase._updateView');
    try {
      return super._updateView(result);
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
selectedIndex: ${selectedIndex},
isSelectedCategory: ${isSelectedCategory},
widgetOptions: ${widgetOptions},
navBarItems: ${navBarItems},
networkControl: ${networkControl},
networkResult: ${networkResult}
    ''';
  }
}
