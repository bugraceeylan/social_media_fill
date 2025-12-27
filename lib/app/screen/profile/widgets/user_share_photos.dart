

import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class UserSharePhotos extends StatelessWidget {
  const UserSharePhotos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceConfig.screenHeight! * 0.46,
      width: DeviceConfig.screenWidth!,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 181 / 180,
        ),
        itemCount: 42,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/profil/test.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
