import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/widgets/no_network_screen.dart';
import 'package:fill_store_bb/app/screen/splash/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _viewModel = getIt.get<SplashViewModel>();

  @override
  void initState() {
    _viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      DeviceConfig().init(context);

      return _viewModel.noNetwork
          ? NoNetworkScreen(
              onPressed: () async {
                await _viewModel.init();
              },
            )
          : Scaffold(
              body: Center(
                child: Image.asset(
                  "assets/sign_up/user.png",
                  color: cPrimaryColor,
                  height: 240,
                ),
              ),
            );
    });
  }
}
