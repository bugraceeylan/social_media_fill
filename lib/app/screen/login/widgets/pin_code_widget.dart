import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
    required this.viewModel,
    required this.defaultPinTheme,
  });

  final LoginViewModel viewModel;
  final PinTheme defaultPinTheme;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          length: 5,
          controller: viewModel.pinController,
          focusNode: viewModel.focusNode,
          // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          // listenForMultipleSmsOnAndroid: true,
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) => const SizedBox(width: 9),
          validator: (value) {
            if (value!.isEmpty || value.length < 5) {
              return viewModel.pinCodeError = "Kod Eksik";
            }
            return null;
          },
          onCompleted: (p) {},
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onChanged: (value) {
            debugPrint('onChanged: $value');
          },
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 24,
                height: 1,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: cPrimaryGreen, width: 1),
                color: cWhite),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: cPrimaryGreen, width: 1),
                color: Color(0xffE3E3E3)),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
