import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:flutter/material.dart';

class CommentSend extends StatelessWidget {
  const CommentSend({
    super.key,
    required this.commentsController,
    required this.onSend,
    required this.userName,
  });

  final TextEditingController commentsController;
  final void Function(String comment) onSend;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceConfig.screenWidth!,
      height: DeviceConfig.screenHeight! * 0.1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: DeviceConfig.screenWidth! * 0.8,
            child: TextField(
              controller: commentsController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                  hintText: "$userName için yorum yap",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: const Icon(
                Icons.send_rounded,
                color: cTextGrey,
              ),
              onPressed: () {
                onSend(commentsController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
