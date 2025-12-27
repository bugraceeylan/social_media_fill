import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMessageReq extends StatelessWidget {
  final String senderPhoto;
  final String senderName;
  final String senderLastMessage;
  final String senderTime;
  const SendMessageReq(
      {super.key,
      required this.senderPhoto,
      required this.senderName,
      required this.senderLastMessage,
      required this.senderTime});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SafariViewModel>();

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Container(
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
                              style: Tstyle.headStyle(
                                  textSize: 12, color: cTextBlack),
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
                            fontW: FontWeight.w400,
                            textSize: 14,
                            color: cTextGrey),
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        AspectRatio(aspectRatio: 181 / 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: DeviceConfig.screenWidth! * 0.2,
              height: DeviceConfig.screenHeight! * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cWhite,
              ),
              child: Text(
                "Yoksay",
                style: Tstyle.headStyle(textSize: 12, color: cBlack),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              alignment: Alignment.center,
              width: DeviceConfig.screenWidth! * 0.2,
              height: DeviceConfig.screenHeight! * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: Text(
                "Engelle",
                style: Tstyle.headStyle(textSize: 12, color: cWhite),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              alignment: Alignment.center,
              width: DeviceConfig.screenWidth! * 0.2,
              height: DeviceConfig.screenHeight! * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cTextGrey,
              ),
              child: Text(
                "Sil",
                style: Tstyle.headStyle(textSize: 12, color: cWhite),
              ),
            ),
          ],
        )
      ],
    );
  }
}
