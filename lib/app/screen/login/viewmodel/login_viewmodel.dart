import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/components/service/register_service.dart';
import 'package:fill_store_bb/app/core/device_config/device_config.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/screen/login/widgets/pin_code_page.dart';
import 'package:fill_store_bb/app/screen/login/widgets/sucsesss_sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'login_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  _LoginViewModelBase() {
    progress = 0.2;

    nameController.addListener(updateProgress);
    surNameController.addListener(updateProgress);
    eMailController.addListener(updateProgress);
    pinController.addListener(updateProgress);
    userTagController.addListener(updateProgress);
    passwordController.addListener(validate);
  }
  @observable
  TextEditingController eMailController = TextEditingController();
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController surNameController = TextEditingController();
  @observable
  TextEditingController userTagController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  AnimationController? animationController;
  Animation<double>? animation;
  @observable
  double targetProgress = 0.0;
  @observable
  bool isChecked = true;
  @observable
  GlobalKey formKey = GlobalKey<FormState>();
  @observable
  double progress = 0.2;
  @observable
  String loginError = "";
  @observable
  String pinCodeError = "";
  @observable
  String userNameError = "";
  @observable
  String firebaseMailError = "";
  @observable
  FocusNode focusNode = FocusNode();
  @observable
  XFile? selectedPhotos;
  @observable
  TextEditingController pinController = TextEditingController();
  @observable
  ImagePicker picker = ImagePicker();
  @observable
  bool isLoad = false;
  @observable
  bool isPasswordValid = false;

  @observable
  bool isMinLengthMet = false;
  @observable
  bool isUppercaseMet = false;
  @observable
  bool isLowercaseMet = false;
  @observable
  bool isNumericMet = false;
  @observable
  bool isSpecialCharMet = false;
  @observable
  VoidCallback? onSuccess;
  @observable
  VoidCallback? onFail;
  @action
  Future<void> pickPhotos() async {
    final XFile? pickedFile = await picker.pickImage(
      // pickImage kullanıyoruz
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      selectedPhotos = pickedFile;

      progress = (progress + 0.6).clamp(0.2, 1.0);
    }
  }

  @action
  void validate() {
    final value = passwordController.text;
    isMinLengthMet = value.length >= 8;
    isUppercaseMet = value.contains(RegExp(r'[A-Z]'));
    isLowercaseMet = value.contains(RegExp(r'[a-z]'));
    isNumericMet = value.replaceAll(RegExp(r'[^0-9]'), '').length >= 3;
    isSpecialCharMet = value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    isPasswordValid = isMinLengthMet &&
        isUppercaseMet &&
        isLowercaseMet &&
        isNumericMet &&
        isSpecialCharMet;

    if (isPasswordValid) {
      if (onSuccess != null) onSuccess!();
    } else {
      if (onFail != null) onFail!();
    }
  }

  @action
  Future<void> completedSignUp() async {
    try {
      if (selectedPhotos == null) {
        userNameError = "Kullanıcı Profil Fotoğrafı Hata!";
        return;
      }

      if (userTagController.text.isEmpty) {
        userNameError = "Hatalı Kullanıcı Adı";
        return;
      }

      if (userTagController.text.length < 3) {
        userNameError = "Kısa Kullanıcı Adı";
        return;
      }

      isLoad = true;
      progress = 0;

      for (double i = 0; i <= 1; i += 0.1) {
        await Future.delayed(const Duration(milliseconds: 300)); 
        progress = i;
      }
      progress = 1.0;
      await registerUser();
      Navigation.push(
          page: SucsessPage(
        userName: userTagController.text,
      ));
      isLoad = false;
      print("Go");
    } catch (e) {
      userNameError = "Hata!";
      print(e);
    }
  }

  @action
  void updateProgress() {
    double totalLength = nameController.text.length +
        surNameController.text.length +
        eMailController.text.length / 5 +
        pinController.text.length / 2 +
        userTagController.text.length;

    double maxLength = 50;
    double calculatedProgress = totalLength / maxLength;
    progress = (0.2 + calculatedProgress).clamp(0.2, 1.0);

    print('Total length: $totalLength');
    print('Progress: $progress');
  }

  @action
  Future<void> loginControl() async {
    try {
      if (nameController.text.length < 2 || nameController.text.isEmpty) {
        loginError = "Hatalı Kullanıcı İsmi!";
        return;
      }

      if (surNameController.text.length < 2 || surNameController.text.isEmpty) {
        loginError = "Hatalı Geçersiz Soy İsim!";
        return;
      }

      if (eMailController.text.length > 50) {
        loginError = "Hatalı Geçersiz Mail!";
        return;
      }

      if (isChecked == false) {
        loginError = "Sözleşmeler Onaylanmamış!";
        return;
      }
      validate();
      if (!isPasswordValid) {
        loginError = "Şifre kriterlerini sağlamıyor!";
        return;
      }

      Navigation.push(page: const PinCodeVerify());
      loginError = "";
    } catch (e) {
      loginError = "Hata $e";
    }
  }

  @action
  void toggleCheckbox() {
    isChecked = !isChecked;
  }

  @action
  Future<bool> registerUser() async {
    bool success = false;
    await RegisterService().registerUser(
      userTag: userTagController.text,
      name: nameController.text,
      surname: surNameController.text,
      email: eMailController.text,
      password: passwordController.text,
      profilePhotoUrl: selectedPhotos!.path,
      onError: (err) {
        firebaseMailError = err;
        success = false;
      },
      onSuccess: () {
        success = true;
      },
    );
    return success;
  }
}
