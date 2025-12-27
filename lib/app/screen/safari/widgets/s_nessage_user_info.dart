
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.name,
    required this.status,
  });

  final String name;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 24,
        ),
        const CircleAvatar(),
        const SizedBox(
          width: 8,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: name,
                style: Tstyle.headStyle(textSize: 14, fontW: FontWeight.w600),
              ),
              TextSpan(
                text: status ? "\nÇevirmiçi" : "Çevrimdışı",
                style: Tstyle.headStyle(
                    textSize: 12, fontW: FontWeight.w600, color: cPrimaryGreen),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
