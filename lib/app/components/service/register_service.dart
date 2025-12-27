import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/domain/datasources/user_data_source.dart';
import 'package:fill_store_bb/app/components/domain/local/local_data_source.dart';
import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:fill_store_bb/app/core/device_config/device_config.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class RegisterService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Reference storage = FirebaseStorage.instance.ref();
  final _userRepository = getIt.get<UserRepository>();

  Future<void> registerUser({
    required String name,
    required String surname,
    required String email,
    required String password,
    required String profilePhotoUrl,
    required String userTag,
    required void Function(String error) onError,
    required VoidCallback onSuccess,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final userID = userCredential.user!.uid;
      var deviceId = await DeviceInfoService().getDeviceId();

      UserModel newUser = UserModel(
        name: name,
        surName: surname,
        eMail: email,
        id: userID,
        deviceId: deviceId,
        userTag: userTag,
        title: '',
        about: '',
        level: 1,
        followerIDs: [],
        followingIDs: [],
        postShared: [],
        dayWords: '',
        posts: [],
        privateAcc: false,
        profilePhoto: "",
        registerDate: DateTime.now(),
      );

      await firestore.collection('users').doc(userID).set(newUser.toJson());
      await _userRepository.create(newUser);
      await settingsBox.put('current_user_id', userID);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        onError("Bu Email Zaten Kayıtlı");
      } else if (e.code == 'weak-password') {
        onError("Şifre çok zayıf.");
      } else if (e.code == 'invalid-email') {
        onError("Geçersiz email adresi.");
      } else {
        onError('Bir hata oluştu: ${e.message}');
      }
    } catch (e) {
      onError("Beklenmedik hata: $e");
    }
  }
}
