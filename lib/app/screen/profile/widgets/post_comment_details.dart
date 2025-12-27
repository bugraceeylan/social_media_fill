
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';

class PostCommentDetails extends StatelessWidget {
  const PostCommentDetails({
    super.key,
    required this.postCommentCount,
  });

  final String postCommentCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: DeviceConfig.screenWidth! * 0.78,
        height: DeviceConfig.screenHeight! * 0.050,
        decoration: BoxDecoration(
            color: const Color(
              0xffE5E5E5,
            ),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text("$postCommentCount yorumu gör",
              style: Tstyle.subStyle(
                  textSize: 15, fontW: FontWeight.w600)),
        ),
      ),
    );
  }
}
