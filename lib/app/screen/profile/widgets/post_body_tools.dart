import 'package:fill_store_bb/app/constant/assets_text.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostTools extends StatefulWidget {
  final VoidCallback commentOnShow;
  final bool isPostLike;
  final VoidCallback isPostLiked;
  const PostTools({
    super.key,
    required this.postLikeCount,
    required this.commentOnShow,
    required this.isPostLike,
    required this.isPostLiked,
  });

  final String postLikeCount;

  @override
  _PostToolsState createState() => _PostToolsState();
}

class _PostToolsState extends State<PostTools> {
  late bool isPostLiked;

  @override
  void initState() {
    super.initState();
    // Başlangıçta gelen isPostLike değerini al
    isPostLiked = widget.isPostLike;
  }

  void toggleLike() {
    setState(() {
      isPostLiked = !isPostLiked; // Her tıklamada durumu değiştir
    });
    widget.isPostLiked(); // Dışarıya bildirim gönder
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: toggleLike, // Tıklandığında durumu değiştir
          child: SvgPicture.asset(
            isPostLiked
                ? "assets/profil/heart_fill.svg" // Tıklanınca dolu kalp
                : "assets/profil/heart.svg", // Normalde boş kalp
            width: 25,
            theme: const SvgTheme(currentColor: cBlack),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: widget.commentOnShow,
          child: SvgPicture.asset(
            postComment,
            width: 25,
            theme: const SvgTheme(currentColor: cBlack),
          ),
        ),
        const Spacer(
          flex: 8,
        ),
        SvgPicture.asset(postPoint),
        const Spacer(
          flex: 7,
        ),
        SvgPicture.asset(
          postLiked,
          width: 25,
          theme: const SvgTheme(currentColor: cBlack),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          widget.postLikeCount,
          style: Tstyle.subStyle(
              textSize: 14, color: cBlack, fontW: FontWeight.w600),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
