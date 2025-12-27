import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/view/profile_settings.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_share_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const ProfileViewAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        PkTimeing(),
        Spacer(
          flex: 6,
        ),
        GestureDetector(
          onTap: () {
            Navigation.push(page: PostSharePage());
          },
          child: Container(
            width: 29,
            height: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: cPrimaryGreen),
            child: Icon(
              Icons.add,
              color: cWhite,
              size: 15,
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        GestureDetector(
            onTap: () => Navigation.push(page: ProfileSettings()),
            child: SvgPicture.asset("assets/profil/SettingsButton.svg")),
        Spacer()
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
