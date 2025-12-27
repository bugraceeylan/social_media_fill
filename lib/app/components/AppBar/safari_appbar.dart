import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_share_page.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_message_view.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_notf_view.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/safari_search_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SafariAppbarView extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const SafariAppbarView({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SafariViewModel>();

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
          actions: [
            const PkTimeing(),
            const Spacer(
              flex: 6,
            ),
            GestureDetector(
              onTap: () {
                Navigation.push(page: const PostSharePage());
              },
              child: Container(
                width: 35,
                height: 29,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cPrimaryGreen),
                child: const Icon(
                  Icons.add,
                  color: cWhite,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: cTextGrey,
                size: 28,
              ),
              onPressed: () {
                Navigation.push(page: const SafariSearchUser());
              },
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
              width: 18,
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
