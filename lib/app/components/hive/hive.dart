import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<UserModel> userBox;
late Box settingsBox; 

Future<void> hiveInit() async {
  await Hive.initFlutter();
  hiveRegisterAdapter();
  await hiveBox();
  await settingsHiveBox();
}

Future<void> hiveBox() async {
  userBox = await Hive.openBox<UserModel>('users');
}

Future<void> settingsHiveBox() async {
  settingsBox = await Hive.openBox('settings');
}

void hiveRegisterAdapter() {
  Hive.registerAdapter<UserModel>(UserModelAdapter());
}
