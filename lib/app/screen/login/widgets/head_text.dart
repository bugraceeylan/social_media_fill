import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  final String type;
  final String about;
  const HeadText({
    super.key,
    required this.type,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: type,
            style: Tstyle.headStyle(textSize: 24),
          ),
          const TextSpan(
            text: "\ns", // Satır boşluğu
            style: TextStyle(fontSize: 8), // Boşluk genişliği (isteğe bağlı)
          ),
          TextSpan(
            text: "\n$about",
            style: Tstyle.subStyle(
              textSize: 20,
              color: Color.fromRGBO(35, 31, 31, 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
