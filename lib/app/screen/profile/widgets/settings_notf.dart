import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/settings_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsNotf extends StatelessWidget {
  const SettingsNotf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppbar(title: "Bildirim Ayarları"),
      body: Wrap(
        children: [
          AspectRatio(aspectRatio: 181 / 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Bildirimlere İzin Ver",
                  style: Tstyle.headStyle(
                    textSize: 13,
                    color: cTextBlack,
                  ),
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: true,
                  activeColor: CupertinoColors.systemGreen,
                  onChanged: (bool value) {},
                )
              ],
            ),
          ),
          AspectRatio(aspectRatio: 181 / 2),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          SNotfWidget(
            type: 'Beğenmeler',
          ),
          AspectRatio(aspectRatio: 181 / 2),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          SNotfWidget(
            type: 'Etiketlendiğin Gönderiler',
          ),
          AspectRatio(aspectRatio: 181 / 2),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          SNotfWidget(
            type: 'Yorumlar',
          ),
          AspectRatio(aspectRatio: 181 / 2),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 15,
            color: cWhite,
          ),
          SNotfWidget(
            type: 'Mesajlar',
          ),
        ],
      ),
    );
  }
}

class SNotfWidget extends StatelessWidget {
  final String type;
  const SNotfWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    List<String> options = ["Herkesten", "Takiptekiler", "Kapalı"];
    String selectedOption = "Herkesten"; // Varsayılan değer
    void showCupertinoPicker(BuildContext context) {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    CupertinoButton(
                      child: Text(
                        "Vazgeç",
                        style:
                            Tstyle.headStyle(textSize: 13, color: Colors.red),
                      ),
                      onPressed: () {
                        Navigation.ofPop();
                      },
                    ),
                    Spacer(),
                    CupertinoButton(
                        child: Text(
                          "Kabul et",
                          style:
                              Tstyle.headStyle(textSize: 13, color: cTextGrey),
                        ),
                        onPressed: () {
                          Navigation.ofPop();
                        })
                  ],
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 40, // Yükseklik
                  scrollController: FixedExtentScrollController(
                    initialItem: options.indexOf(selectedOption),
                  ),
                  onSelectedItemChanged: (int index) {
                    selectedOption = options[index];
                  },
                  children: options.map((String option) {
                    return Center(
                        child: Text(option, style: TextStyle(fontSize: 18)));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type,
            style: Tstyle.headStyle(
              textSize: 13,
              color: cTextBlack,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () => showCupertinoPicker(context),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: IntrinsicWidth(
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Herkesten",
                      style: Tstyle.headStyle(
                          textSize: 14,
                          color: cTextGrey,
                          fontW: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: cTextBlack,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
