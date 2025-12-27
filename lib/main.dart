import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/core/device_config/device_config.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/sign_in/view/sign_in_view.dart';
import 'package:fill_store_bb/app/screen/splash/view/splash_view.dart';
import 'package:fill_store_bb/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  setupGetIT();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation.navigationKey,
      theme: openTheme(),
      home: const SplashView(),
    );
  }

  ThemeData openTheme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: appColor,
        scrolledUnderElevation: 0,
      ),
      highlightColor: appColor,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: appColor,
      fontFamily: "Montserrat",
    );
  }
}
