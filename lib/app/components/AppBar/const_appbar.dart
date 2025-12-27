import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConstAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget widget;
  final bool isMessageChat;
  final Widget userContent;

  const ConstAppBar({
    super.key,
    required this.title,
    this.widget = const SizedBox(),
    this.isMessageChat = false,
    this.userContent = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(isMessageChat ? 80 : kToolbarHeight),
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
          bottom: isMessageChat
              ? PreferredSize(preferredSize: preferredSize, child: userContent)
              : PreferredSize(
                  preferredSize: preferredSize, child: const SizedBox()),
          actions: [
            const PkTimeing(),
            const Spacer(
              flex: 2,
            ),
            Text(
              title,
              style: Tstyle.headStyle(textSize: 16),
            ),
            const Spacer(
              flex: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: widget,
            ),
            const AppBarBack(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(isMessageChat ? 100 : kToolbarHeight);
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
            const SizedBox(
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

class AppBarBack extends StatelessWidget {
  const AppBarBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.ofPop();
      },
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffC8C5C5)),
        child: const Icon(
          Icons.arrow_back,
          color: cWhite,
          size: 24,
        ),
      ),
    );
  }
}
