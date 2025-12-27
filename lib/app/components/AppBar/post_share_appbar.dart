import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostShareAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback onBack;

  const PostShareAppbar({super.key, required this.title, this.actions, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap:onBack,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffC8C5C5)),
                  child: Icon(
                    Icons.arrow_back,
                    color: cWhite,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Color(0xff231F1F),
          title: Text("Post Paylaş",
              style: Tstyle.headStyle(textSize: 16, color: cWhite)),
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PkTimeing extends StatelessWidget {
  const PkTimeing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 80,
        height: 21,
        decoration: BoxDecoration(
            color: cWhite, borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/appbar/appbar_const.svg"),
            SizedBox(
              width: 4,
            ),
            Text(
              "1s 45dk",
              style: Tstyle.headStyle(textSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
