
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: DeviceConfig.screenWidth! * 0.88,
        height: DeviceConfig.screenHeight! * 0.046,
        decoration: BoxDecoration(
          color: Color(0xffE1E1E1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                "Aramak istediğiniz kişi",
                style: Tstyle.headStyle(
                    textSize: 14,
                    color: cTextGrey,
                    fontW: FontWeight.w500),
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: cTextGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
