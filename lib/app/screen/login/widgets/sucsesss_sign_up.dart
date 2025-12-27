import 'package:fill_store_bb/app/components/key_button/key_button.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/sign_in/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class SucsessPage extends StatelessWidget {
  final String userName;
  const SucsessPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kayıt",
                style: TextStyle(
                    color: cBlack, fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text(
                " Başarılı!",
                style: TextStyle(
                    color: cPrimaryGreen,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const AspectRatio(aspectRatio: 181 / 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hoşgeldin,",
                style: TextStyle(
                    color: cBlack, fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                "$userName,",
                style: const TextStyle(
                    color: cBlack, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const AspectRatio(aspectRatio: 181 / 11),
          const Text(
            textAlign: TextAlign.center,
            "Topluluğumuza katıldığın için çok\nmutluyuz! Artık yeni bağlantılar kurabilir,\nilham verici içerikleri keşfedebilir ve\nkendi hikayeni paylaşabilirsin. Hadi,\nbirlikte harika anılar oluşturalım!",
            style: TextStyle(
                color: cTextGrey, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          KeyButton(
            title: "Hemen Başla",
            onPressed: () {
              Navigation.pushAndRemoveAll(page: const MainView());
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
