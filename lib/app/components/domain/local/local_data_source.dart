import 'dart:io';

import 'package:fill_store_bb/app/components/domain/datasources/user_data_source.dart';
import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';

class UserLocalDatasourceImpl implements UserDatasource {
  @override
  Future<void> create(UserModel userModel) async {
    if (!userBox.containsKey(userModel.id)) {
      await userBox.put(userModel.id, userModel);
    }
  }

  @override
  Future<void> update(UserModel userModel) async {
    await userBox.put(userModel.id, userModel);
  }

  @override
  Future<UserModel> currentUser(String id) async {
    return userBox.get(id)!;
  }

  @override
  String currentUserId() {
    final userId = settingsBox.get('current_user_id');
    if (userId == null) {
      throw Exception("Aktif kullanıcı bulunamadı (settingsBox boş).");
    }
    return userId;
  }

  @override
  Future<UserModel> getByDeviceId(String deviceId) async {
    return userBox.values.firstWhere((element) => element.deviceId == deviceId);
  }

  @override
  Future<bool> hasUser(String deviceId) async {
    return userBox.values.any((element) => element.deviceId == deviceId);
  }

  @override
  Future<String> uploadPicToStorage(File imageFile) {
    throw UnimplementedError();
  }
}
