import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:flutter/material.dart';

class UserMessageBox extends StatelessWidget {
  final String senderPhoto;
  final String senderName;
  final String senderLastMessage;
  final String senderTime;
  final VoidCallback onPressed;
  const UserMessageBox({
    super.key,
    required this.senderPhoto,
    required this.senderName,
    required this.senderLastMessage,
    required this.senderTime, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SafariViewModel>();

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: DeviceConfig.screenWidth! * 0.90,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
            ),
            SizedBox(width: 4),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Row(
                        children: [
                          Text(
                            senderName,
                            style:
                                Tstyle.headStyle(textSize: 12, color: cTextBlack),
                          ),
                          Spacer(),
                          Text(
                            senderTime,
                            style: Tstyle.headStyle(
                                textSize: 12,
                                color: cTextBlack,
                                fontW: FontWeight.w500),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                    TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: viewModel.formatText(senderLastMessage),
                      style: Tstyle.headStyle(
                          fontW: FontWeight.w400, textSize: 14, color: cTextGrey),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
