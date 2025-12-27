import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:fill_store_bb/app/screen/login/widgets/kvk_screen.dart';
import 'package:flutter/material.dart';

class EmailNotificationCheck extends StatelessWidget {
  const EmailNotificationCheck({
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
              text:
                  'Uygulamamızla İlgili En Son Haberlerden\nHaberdar Olmak İster Misiniz?\nGüncellemeler veÖzel İçerikler onaylayın! ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
