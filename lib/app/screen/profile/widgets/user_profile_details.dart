import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class UserProfileDetails extends StatelessWidget {
  final String head;
  final String body;
  final Widget typeGo;
  const UserProfileDetails(
      {super.key,
      required this.head,
      required this.body,
      required this.typeGo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.push(page: typeGo),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(text: head, style: Tstyle.headStyle(textSize: 12)),
            TextSpan(
              text: "\n$body",
              style: Tstyle.headStyle(textSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
