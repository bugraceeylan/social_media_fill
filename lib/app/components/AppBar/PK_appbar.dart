import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_message_view.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_notf_view.dart';
import 'package:fill_store_bb/app/screen/story/view/story_share_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PKViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const PKViewAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        const PkTimeing(),
        const Spacer(
          flex: 6,
        ),
        GestureDetector(
          onTap: () {
            Navigation.push(page: const StoryShareView());
          },
          child: Container(
            width: 35,
            height: 29,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: cPrimaryGreen),
            child: const Icon(
              Icons.add,
              color: cWhite,
              size: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: cTextGrey,
            size: 28,
          ),
          onPressed: () {
            Navigation.push(page: const SafariNotfView());
          },
        ),
        const SizedBox(
          width: 6,
        ),
        GestureDetector(
          onTap: () {
            Navigation.push(page: const SafariMessageView());
          },
          child: SvgPicture.asset(
            "assets/safari/safari_message.svg",
            width: 24,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const Spacer()
      ],
      backgroundColor: appColor,
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
