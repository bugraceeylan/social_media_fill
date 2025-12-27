import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostEditTools extends StatelessWidget {
  final Function(int) onToolTap;

  const PostEditTools({super.key, required this.onToolTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onToolTap(1),
          child: WrappedTools(
            index: 1,
            toolsAssets: 'assets/profil/post_effect.svg',
            toolsType: "Efektler",
          ),
        ),
        SizedBox(width: 30),
        GestureDetector(
          onTap: () => onToolTap(2),
          child: WrappedTools(
            index: 2,
            toolsAssets: 'assets/profil/post_text.svg',
            toolsType: "Metin Ekle",
          ),
        ),
        SizedBox(width: 30),
        GestureDetector(
          onTap: () => onToolTap(3),
          child: WrappedTools(
            index: 3,
            toolsAssets: 'assets/profil/post_music.svg',
            toolsType: "Müzik",
          ),
        ),
        SizedBox(width: 30),
        GestureDetector(
          onTap: () => onToolTap(4),
          child: WrappedTools(
            index: 4,
            toolsAssets: 'assets/profil/post_timer.svg',
            toolsType: "Zamanlayıcı",
          ),
        ),
      ],
    );
  }
}

class WrappedTools extends StatelessWidget {
  final int index;
  final String toolsAssets;
  final String toolsType;
  const WrappedTools({
    super.key,
    required this.index,
    required this.toolsAssets,
    required this.toolsType,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SvgPicture.asset(toolsAssets),
        Text(
          toolsType,
          style: Tstyle.headStyle(textSize: 12, color: cTextGrey),
        ),
      ],
    );
  }
}
