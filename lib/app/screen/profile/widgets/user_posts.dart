import 'dart:io';

import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserPosts extends StatelessWidget {
  final VoidCallback onPressed;
  final int postLenght;
  final List<XFile> postList;
  const UserPosts({
    super.key,
    required this.onPressed,
    required this.postLenght,
    required this.postList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: DeviceConfig.screenWidth!,
        height: DeviceConfig.screenHeight! * 0.11,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onPressed,
              child: Container(
                width: DeviceConfig.screenWidth! * 0.14,
                height: DeviceConfig.screenHeight! * 0.11,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffA1FF8B),
                      Color(0xff3F93FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: postLenght,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Container(
                      width: DeviceConfig.screenWidth! * 0.14,
                      height: DeviceConfig.screenHeight! * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        image: DecorationImage(
                          image: FileImage(
                            File(postList[index].path),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
