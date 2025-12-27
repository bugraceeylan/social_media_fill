import 'package:fill_store_bb/app/components/AppBar/story_appbar.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoryTimerSet extends StatefulWidget {
  const StoryTimerSet({
    super.key,
  });

  @override
  State<StoryTimerSet> createState() => _StoryTimerSetState();
}

class _StoryTimerSetState extends State<StoryTimerSet> {
  int selectedDay = 15;
  String selectedMonth = "01";
  int selectedYear = 2025;
  int selectedLeft = 21;
  int selectedRight = 30;

  void showPicker(BuildContext context, String type) {
    int tempLeft = selectedLeft;
    int tempRight = selectedRight;
    int tempDay = selectedDay;
    String tempMonth = selectedMonth;
    int tempYear = selectedYear;

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text("Vazgeç"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    child: const Text("Kabul et"),
                    onPressed: () {
                      setState(() {
                        if (type == "time") {
                          selectedLeft = tempLeft;
                          selectedRight = tempRight;
                        } else if (type == "date") {
                          selectedDay = tempDay;
                          selectedMonth = tempMonth;
                          selectedYear = tempYear;
                        }
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: type == "time"
                  ? Row(
                      children: [
                        Expanded(
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 40,
                            scrollController: FixedExtentScrollController(
                                initialItem: tempLeft - 21),
                            onSelectedItemChanged: (index) {
                              tempLeft = index + 21;
                            },
                            children: List.generate(
                              24,
                              (index) => Center(
                                child: Text(
                                  (index + 21).toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Right Picker (minutes)
                        Expanded(
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 40,
                            scrollController: FixedExtentScrollController(
                                initialItem: tempRight - 1),
                            onSelectedItemChanged: (index) {
                              tempRight = index + 1;
                            },
                            children: List.generate(
                              59,
                              (index) => Center(
                                child: Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        // Date Picker (Day, Month, Year)
                        Expanded(
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 40,
                            scrollController: FixedExtentScrollController(
                                initialItem: tempDay - 1),
                            onSelectedItemChanged: (index) {
                              tempDay = index + 1;
                            },
                            children: List.generate(
                              31,
                              (index) => Center(
                                child: Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 40,
                            scrollController: FixedExtentScrollController(
                                initialItem: int.parse(tempMonth) - 1),
                            onSelectedItemChanged: (index) {
                              tempMonth =
                                  (index + 1).toString().padLeft(2, '0');
                            },
                            children: List.generate(
                              12,
                              (index) => Center(
                                child: Text(
                                  (index + 1).toString().padLeft(2, '0'),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 40,
                            scrollController: FixedExtentScrollController(
                                initialItem: tempYear - 2025),
                            onSelectedItemChanged: (index) {
                              tempYear = 2025;
                            },
                            children: List.generate(
                              10,
                              (index) => Center(
                                child: Text(
                                  (2025).toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff231F1F),
      appBar: StoryAppbarView(title: "Zamanlayıcı"),
      body: Column(
        children: [
          AspectRatio(aspectRatio: 181 / 22),
          Text(
            textAlign: TextAlign.center,
            "Story paylaşılacağı\nzamanı seçin",
            style: Tstyle.headStyle(textSize: 24, color: cWhite),
          ),
          AspectRatio(aspectRatio: 181 / 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => showPicker(context, "date"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$selectedDay",
                        style: Tstyle.headStyle(textSize: 24, color: cWhite),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.white,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
              // Month Picker Button
              ElevatedButton(
                onPressed: () => showPicker(context, "date"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Container(
                  width: 70,
                  height: 50,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedMonth,
                        style: Tstyle.headStyle(textSize: 24, color: cWhite),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.white,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
              // Year Picker Button
              ElevatedButton(
                onPressed: () => showPicker(context, "date"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Container(
                  width: 60,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "$selectedYear",
                    style: Tstyle.headStyle(textSize: 24, color: cWhite),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => showPicker(context, "time"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$selectedLeft:$selectedRight",
                    style: Tstyle.headStyle(textSize: 24, color: cWhite),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.white,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
          AspectRatio(aspectRatio: 181 / 32),
          Text(
            textAlign: TextAlign.center,
            "Seçili zaman geldiğinde\npaylaşımın otomatik olarak\npaylaşılacaktır",
            style: Tstyle.headStyle(textSize: 14, color: cTextGrey),
          ),
          AspectRatio(aspectRatio: 181 / 50),
          Container(
            width: DeviceConfig.screenWidth!,
            height: DeviceConfig.screenHeight! * 0.15,
            color: const Color(0xff231F1F),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigation.ofPop();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: DeviceConfig.screenWidth! * 0.1,
                  height: DeviceConfig.screenHeight! * 0.01,
                  decoration:
                      BoxDecoration(color: cTextGrey, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    "assets/profil/tick.svg",
                    width: 5,
                    height: 5,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
