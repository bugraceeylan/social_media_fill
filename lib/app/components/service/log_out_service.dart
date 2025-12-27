import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/screen/sign_in/view/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> logoutUser() async {
  await FirebaseAuth.instance.signOut();
  await userBox.clear();
  await userBox.close();
  await Hive.deleteBoxFromDisk('users');
  await settingsBox.delete('current_user_id');

  Navigation.pushAndRemoveAll(page: const SignInView());
}
