import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/screen/login/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoadingPreview extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoadingPreview({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: viewModel.progress),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Container(
              width: DeviceConfig.screenWidth! * 0.9,
              height: DeviceConfig.screenHeight! * 0.020,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: cWhite),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * value,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF327037).withOpacity(0.9),
                        const Color(0xff5FD669),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
