import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:fill_store_bb/app/screen/login/widgets/back_to_page.dart';
import 'package:fill_store_bb/app/screen/login/widgets/email_kvk.dart';
import 'package:fill_store_bb/app/screen/login/widgets/head_text.dart';
import 'package:fill_store_bb/app/screen/login/widgets/kvk_user_checkbox.dart';
import 'package:fill_store_bb/app/screen/login/widgets/loading_preview.dart';
import 'package:fill_store_bb/app/screen/login/widgets/login_contanier.dart';
import 'package:fill_store_bb/app/screen/login/widgets/pass_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<LoginViewModel>();
    DeviceConfig().init(context);

    return Scaffold(
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                const AspectRatio(aspectRatio: 181 / 21),
                Row(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: HeadText(
                        about: "Lütfen kişisel bilgilerinizi giriniz",
                        type: "Kayıt Ol",
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    BackToLogin(
                      onPressed: () {
                        Navigation.ofPop();
                      },
                    ),
                  ],
                ),
                LoadingPreview(
                  viewModel: viewModel,
                ),
                const AspectRatio(aspectRatio: 181 / 11),
                Visibility(
                  visible: viewModel.loginError!.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      viewModel.loginError ?? "",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 11),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      LoginContanier(
                        hintText: "İsim",
                        controller: viewModel.nameController,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      LoginContanier(
                        hintText: "Soyisim",
                        controller: viewModel.surNameController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                LoginContanier(
                  hintText: "E-posta adresiniz",
                  controller: viewModel.eMailController,
                  isEmail: true,
                  width: DeviceConfig.screenWidth! * 0.9,
                ),
                const AspectRatio(aspectRatio: 181 / 4),
                LoginContanier(
                  hintText: "Şifrenizi belirleyiniz",
                  controller: viewModel.passwordController,
                  isEmail: true,
                  width: DeviceConfig.screenWidth! * 0.9,
                ),
                const AspectRatio(aspectRatio: 181 / 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomFlutterPwValidator(
                    controller: viewModel.passwordController,
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 11),
                KvkCheckRow(viewModel: viewModel),
                EmailNotificationCheck(viewModel: viewModel),
                const AspectRatio(aspectRatio: 181 / 11),
                KeyButton(
                  title: "Devam Et",
                  onPressed: () async {
                    await viewModel.loginControl();
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
