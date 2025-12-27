import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/screen/login/view/login_view.dart';
import 'package:flutter/material.dart';

class GoSignUp extends StatelessWidget {
  const GoSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.push(page: const LoginView()),
      child: const Text.rich(
        TextSpan(
          text: 'Hesabınız yok mu ?',
          style: TextStyle(
            color: cTextGrey,
          ),
          children: [
            TextSpan(
              text: ' Kayıt Olun!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
