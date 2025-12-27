import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomFlutterPwValidator extends StatefulWidget {
  final TextEditingController controller;
  final int minLength;
  final int uppercaseCharCount;
  final int lowercaseCharCount;
  final int numericCharCount;
  final int specialCharCount;
  final double width;
  final double height;
  final VoidCallback? onSuccess;
  final VoidCallback? onFail;

  const CustomFlutterPwValidator({
    Key? key,
    required this.controller,
    this.minLength = 8,
    this.uppercaseCharCount = 1,
    this.lowercaseCharCount = 1,
    this.numericCharCount = 3,
    this.specialCharCount = 1,
    this.width = 400,
    this.height = 200,
    this.onSuccess,
    this.onFail,
  }) : super(key: key);

  @override
  _CustomFlutterPwValidatorState createState() =>
      _CustomFlutterPwValidatorState();
}

class _CustomFlutterPwValidatorState extends State<CustomFlutterPwValidator> {
  var viewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          Row(
            children: [
              Icon(
                size: 10,
                viewModel.isSpecialCharMet ? Icons.circle : Icons.circle,
                color: viewModel.isSpecialCharMet ? Colors.green : Colors.grey,
              ),
              SizedBox(width: 2),
              Text(
                "Bir özel karakter",
                style: TextStyle(
                  color:
                      viewModel.isSpecialCharMet ? Colors.green : Colors.grey,
                  fontWeight: viewModel.isSpecialCharMet
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                size: 10,
                viewModel.isMinLengthMet ? Icons.circle : Icons.circle,
                color: viewModel.isMinLengthMet ? Colors.green : Colors.grey,
              ),
              SizedBox(width: 2),
              Text(
                "En az ${widget.minLength} karakter",
                style: TextStyle(
                  color: viewModel.isMinLengthMet ? Colors.green : Colors.grey,
                  fontWeight: viewModel.isMinLengthMet
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                size: 10,
                viewModel.isMinLengthMet ? Icons.circle : Icons.circle,
                color: viewModel.isUppercaseMet ? Colors.green : Colors.grey,
              ),
              SizedBox(width: 2),
              Text(
                "Bir büyük harf",
                style: TextStyle(
                  color: viewModel.isUppercaseMet ? Colors.green : Colors.grey,
                  fontWeight: viewModel.isUppercaseMet
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                size: 10,
                viewModel.isMinLengthMet ? Icons.circle : Icons.circle,
                color: viewModel.isLowercaseMet ? Colors.green : Colors.grey,
              ),
              SizedBox(width: 2),
              Text(
                "Bir küçük harf",
                style: TextStyle(
                  color: viewModel.isLowercaseMet ? Colors.green : Colors.grey,
                  fontWeight: viewModel.isLowercaseMet
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                size: 10,
                viewModel.isMinLengthMet ? Icons.circle : Icons.circle,
                color: viewModel.isNumericMet ? Colors.green : Colors.grey,
              ),
              SizedBox(width: 2),
              Text(
                "Üç Rakam",
                style: TextStyle(
                  color: viewModel.isNumericMet ? Colors.green : Colors.grey,
                  fontWeight: viewModel.isNumericMet
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
