import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/components/service/login_service.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

abstract class _SignInViewModelBase with Store {
  @observable
  TextEditingController loginController = TextEditingController();
  @observable
  TextEditingController passController = TextEditingController();
  @observable
  String loginError = "";
  @action
  Future<void> loginControl() async {
    try {
      await LoginService().loginUser(
        emailOrUsername: loginController.text.trim(),
        password: passController.text,
        onError: (message) {
          loginError = message;
        },
        onSuccess: () {
          Navigation.pushAndRemoveAll(page: const MainView());
        },
      );
    } catch (e) {
      print(e);
      loginError = "Hata!";
      return;
    }
  }
}
