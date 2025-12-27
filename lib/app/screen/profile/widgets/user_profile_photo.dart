

import 'dart:io';

import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';

class UserProfilePhoto extends StatelessWidget {
  final VoidCallback onPressed;
  final String? images;
  const UserProfilePhoto({
    super.key,
    required this.viewModel,
    required this.onPressed,
    required this.images,
  });

  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.topLeft,
        width: DeviceConfig.screenWidth! * 0.28,
        height: DeviceConfig.screenHeight! * 0.1,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cBlack,
          image: DecorationImage(
            image: images == null
                ? const AssetImage("assets/sign_up/user.png")
                : FileImage(
                    File(images!),
                  ),
          ),
        ),
      ),
    );
  }
}