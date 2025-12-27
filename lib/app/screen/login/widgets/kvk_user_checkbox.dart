import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:fill_store_bb/app/screen/login/widgets/kvk_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class KvkCheckRow extends StatelessWidget {
  const KvkCheckRow({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: const WidgetStatePropertyAll(cWhite),
          checkColor: cPrimaryGreen,
          activeColor: cPrimaryGreen,
          value: viewModel.isChecked,
          onChanged: (value) {
            viewModel.toggleCheckbox();
          },
          side: const BorderSide(width: 1, color: cWhite),
        ),
        GestureDetector(
          onTap: () => Navigation.push(page: const KvkScreen()),
          child: const Text.rich(
            TextSpan(
              text: 'Kullanıcı Sözleşmesini ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: 've ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: 'Gizlilik Politikasını',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
                TextSpan(
                  text: '\nokudum,onaylıyorum',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
