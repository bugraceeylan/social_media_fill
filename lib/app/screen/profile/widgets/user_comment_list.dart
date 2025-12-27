import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserCommentList extends StatelessWidget {
  final String userPhoto;
  final String userName;
  final String userComment;
  final String commentLike;

  const UserCommentList({
    super.key,
    required this.userPhoto,
    required this.userName,
    required this.userComment,
    required this.commentLike,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userPhoto),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: userName,
                          style: Tstyle.headStyle(textSize: 14)),
                      TextSpan(
                        text: "\n$userComment",
                        style: Tstyle.headStyle(
                            textSize: 13, fontW: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(
              flex: 3,
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SvgPicture.asset("assets/profil/heart_fill.svg"),
                  ),
                  TextSpan(
                    text: commentLike,
                    style: const TextStyle(
                        color: cBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Proxima"),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "yanıtla",
                    style: TextStyle(
                        color: cTextGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Proxima"),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 8,
                    ),
                  ),
                  WidgetSpan(
                    child: SvgPicture.asset(
                      "assets/profil/heart.svg",
                      width: 17,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
