import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/components/service/login_service.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/sign_in/viewmodel/sign_in_viewmodel.dart';
import 'package:fill_store_bb/app/screen/sign_in/widgets/acc_login.dart';
import 'package:fill_store_bb/app/screen/sign_in/widgets/forget_pass.dart';
import 'package:fill_store_bb/app/screen/sign_in/widgets/go_register.dart';
import 'package:fill_store_bb/app/screen/sign_in/widgets/line_page.dart';
import 'package:fill_store_bb/app/screen/sign_in/widgets/pass_contanier.dart';
import 'package:fill_store_bb/app/screen/sign_in/widgets/sign_up_contanier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SignInViewModel>();

    DeviceConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigation.push(page: const MainView());
            },
            child: const Row(
              children: [],
            ),
          )
        ],
      ),
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          return Column(
            children: [
              Text(
                "logo",
                style: Tstyle.headStyle(textSize: 24),
              ),
              Visibility(
                visible: viewModel.loginError.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    viewModel.loginError,
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const AspectRatio(aspectRatio: 181 / 25),
              SignUpContanier(
                hintText: "Kullanıcı Adı veya E-posta adresi",
                controller: viewModel.loginController,
              ),
              const AspectRatio(aspectRatio: 181 / 4),
              PasswordContainer(
                  controller: viewModel.passController, label: "Şifre"),
              const AspectRatio(aspectRatio: 181 / 7),
              const ForgetPass(),
              const AspectRatio(aspectRatio: 181 / 25),
              KeyButton(
                onPressed: () => viewModel.loginControl(),
                title: "Giriş Yap",
              ),
              const AspectRatio(aspectRatio: 181 / 7),
              const GoSignUp(),
              const AspectRatio(aspectRatio: 181 / 7),
              const LinePage(),
              const AspectRatio(aspectRatio: 181 / 15),
              const AccLogin(
                type: 'Gmail',
              ),
              const AspectRatio(aspectRatio: 181 / 7),
              const AccLogin(
                type: 'Apple',
              )
            ],
          );
        }),
      ),
    );
  }
}
