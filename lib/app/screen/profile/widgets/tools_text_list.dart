import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TextListed extends StatelessWidget {
  const TextListed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ProfileViewModel>();

    return Observer(builder: (_) {
      return SizedBox(
        width: DeviceConfig.screenWidth,
        height: DeviceConfig.screenHeight! * 0.07,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.fontStyles.length,
          itemBuilder: (context, index) {
            return Observer(
              builder: (context) => GestureDetector(
                onTap: () {
                  viewModel.setSelectedTextStyle(viewModel.fontStyles[index]);
                  viewModel.addText();
                },
                child: Container(
                  width: DeviceConfig.screenWidth! * 0.15,
                  height: DeviceConfig.screenHeight! * 0.07,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(251, 251, 251, 0.5),
                    ),
                  ),
                  child: Center(
                      child: Text("Aa", style: viewModel.fontStyles[index])),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class TextItem {
  String text;
  TextStyle textStyle;
  double dx;
  double dy;
  double scale;
  double angle;
  Key key; 

  TextItem({
    required this.text,
    required this.textStyle,
    this.dx = 0,
    this.dy = 0,
    this.scale = 1.0,
    this.angle = 0.0,
    required this.key, 
  });
}
