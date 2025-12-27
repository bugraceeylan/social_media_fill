// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  late final _$obbAtom =
      Atom(name: '_SplashViewModelBase.obb', context: context);

  @override
  String get obb {
    _$obbAtom.reportRead();
    return super.obb;
  }

  @override
  set obb(String value) {
    _$obbAtom.reportWrite(value, super.obb, () {
      super.obb = value;
    });
  }

  late final _$noNetworkAtom =
      Atom(name: '_SplashViewModelBase.noNetwork', context: context);

  @override
  bool get noNetwork {
    _$noNetworkAtom.reportRead();
    return super.noNetwork;
  }

  @override
  set noNetwork(bool value) {
    _$noNetworkAtom.reportWrite(value, super.noNetwork, () {
      super.noNetwork = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_SplashViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$initializationAsyncAction =
      AsyncAction('_SplashViewModelBase.initialization', context: context);

  @override
  Future<dynamic> initialization() {
    return _$initializationAsyncAction.run(() => super.initialization());
  }

  late final _$checkUserStatusAsyncAction =
      AsyncAction('_SplashViewModelBase.checkUserStatus', context: context);

  @override
  Future<void> checkUserStatus() {
    return _$checkUserStatusAsyncAction.run(() => super.checkUserStatus());
  }

  @override
  String toString() {
    return '''
obb: ${obb},
noNetwork: ${noNetwork}
    ''';
  }
}
