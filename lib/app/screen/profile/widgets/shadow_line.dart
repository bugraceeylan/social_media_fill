import 'package:fill_store_bb/app/constant/color.dart';
import 'package:flutter/material.dart';

class PageShadowLine extends StatelessWidget {
  const PageShadowLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: appColor,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}