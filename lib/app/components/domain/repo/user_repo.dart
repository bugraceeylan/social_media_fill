import 'dart:io';

import 'package:fill_store_bb/app/core/result/data_result.dart';
import 'package:fill_store_bb/app/core/result/result.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';

abstract class UserRepository {
  Future<Result> create(UserModel userModel);
  Future<Result> update(UserModel userModel);
  Future<Result> localUpdate(UserModel userModel);
  Future<DataResult<UserModel>> getByDeviceId(String deviceId);
  Future<DataResult<bool>> hasUser(String deviceId);
  Future<DataResult<String>> uploadPicToStorage(File imageFile);
  Stream<DataResult<List<PostModel>>> getAllPosts();
  Future<DataResult<UserModel>> currentUser();

  getUserById(String userID) {}

  getPostsByUserId(String s) {}

}
