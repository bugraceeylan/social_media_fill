import 'package:fill_store_bb/app/constant/color.dart';
import 'package:flutter/material.dart';

class LinePage extends StatelessWidget {
  const LinePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 1,
          width: 20,
        ),
        Expanded(
          child: Divider(
            height: 1,
            color: cTextGrey,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "ya da",
          style: TextStyle(color: cTextGrey, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Divider(
            height: 1,
            color: cTextGrey,
          ),
        ),
        SizedBox(
          height: 1,
          width: 20,
        )
      ],
    );
  }
}
