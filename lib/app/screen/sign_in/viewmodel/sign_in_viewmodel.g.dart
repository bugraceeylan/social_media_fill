// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  late final _$loginControllerAtom =
      Atom(name: '_SignInViewModelBase.loginController', context: context);

  @override
  TextEditingController get loginController {
    _$loginControllerAtom.reportRead();
    return super.loginController;
  }

  @override
  set loginController(TextEditingController value) {
    _$loginControllerAtom.reportWrite(value, super.loginController, () {
      super.loginController = value;
    });
  }

  late final _$passControllerAtom =
      Atom(name: '_SignInViewModelBase.passController', context: context);

  @override
  TextEditingController get passController {
    _$passControllerAtom.reportRead();
    return super.passController;
  }

  @override
  set passController(TextEditingController value) {
    _$passControllerAtom.reportWrite(value, super.passController, () {
      super.passController = value;
    });
  }

  late final _$loginErrorAtom =
      Atom(name: '_SignInViewModelBase.loginError', context: context);

  @override
  String get loginError {
    _$loginErrorAtom.reportRead();
    return super.loginError;
  }

  @override
  set loginError(String value) {
    _$loginErrorAtom.reportWrite(value, super.loginError, () {
      super.loginError = value;
    });
  }

  late final _$loginControlAsyncAction =
      AsyncAction('_SignInViewModelBase.loginControl', context: context);

  @override
  Future<void> loginControl() {
    return _$loginControlAsyncAction.run(() => super.loginControl());
  }

  @override
  String toString() {
    return '''
loginController: ${loginController},
passController: ${passController},
loginError: ${loginError}
    ''';
  }
}
