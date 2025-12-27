import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:fill_store_bb/app/screen/login/widgets/back_to_page.dart';
import 'package:fill_store_bb/app/screen/login/widgets/head_text.dart';
import 'package:fill_store_bb/app/screen/login/widgets/loading_preview.dart';
import 'package:fill_store_bb/app/screen/login/widgets/photo_user_page.dart';
import 'package:fill_store_bb/app/screen/login/widgets/pin_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinput/pinput.dart';

class PinCodeVerify extends StatelessWidget {
  const PinCodeVerify({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<LoginViewModel>();

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        fontFamily: "Montserrat",
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffCACACA),
      ),
    );

    return Scaffold(
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => Column(
            children: [
              const AspectRatio(aspectRatio: 181 / 21),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    child: HeadText(
                      about:
                          "Lütfen e-mailinize gelen 5 haneli\naktivasyon kodunu giriniz",
                      type: "Kayıt Ol",
                    ),
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
              Observer(
                builder: (context) {
                  return Visibility(
                    visible: viewModel.loginError.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        viewModel.loginError,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
              const AspectRatio(aspectRatio: 181 / 21),
              PinCode(viewModel: viewModel, defaultPinTheme: defaultPinTheme),
              const AspectRatio(aspectRatio: 181 / 11),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restore_outlined),
                  Text(
                    "90sn",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
              const AspectRatio(aspectRatio: 181 / 50),
              KeyButton(
                title: "Kodu Onayla",
                onPressed: () {
                  Navigation.push(page: const PPUser());
                },
              ),
              const AspectRatio(aspectRatio: 181 / 11),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Yeniden Gönder",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14, color: cBlack),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
