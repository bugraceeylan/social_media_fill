import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(
          flex: 19,
        ),
        Text(
          "Şifremi Unuttum!",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Spacer()
      ],
    );
  }
}