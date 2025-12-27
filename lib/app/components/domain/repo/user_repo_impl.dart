import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/domain/local/local_data_source.dart';
import 'package:fill_store_bb/app/components/domain/remote/remote_data_source.dart';
import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/core/result/data_result.dart';
import 'package:fill_store_bb/app/core/result/result.dart';
import 'package:fill_store_bb/app/core/result/success_data_result.dart';
import 'package:fill_store_bb/app/core/result/success_result.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasourceImpl _remoteDatasourceImpl =
      UserRemoteDatasourceImpl();
  final UserLocalDatasourceImpl _localDatasourceImpl =
      UserLocalDatasourceImpl();

  @override
  Future<Result> create(UserModel userModel) async {
    try {
      String message = "";
      await _remoteDatasourceImpl.create(userModel).timeout(
            const Duration(seconds: 7),
            onTimeout: () => message = "timeout",
          );
      await _localDatasourceImpl.create(userModel);
      return SuccessResult(message: message);
    } catch (e) {
      return ErrorResult(message: "User $e");
    }
  }

  @override
  Stream<DataResult<List<PostModel>>> getAllPosts() {
    return _remoteDatasourceImpl.getAllPosts().map((posts) {
      return SuccessDataResult(data: posts);
    }).handleError((e) {
      return ErrorDataResult(message: e.toString());
    });
  }

  @override
  Future<DataResult<List<PostModel>>> getPostsByUserId(String userId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .where('userID', isEqualTo: userId)
          .get();

      final posts =
          snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList();

      return SuccessDataResult(data: posts);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  @override
  Future<DataResult<UserModel>> getUserById(String userID) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(userID)
          .get();
      if (doc.exists) {
        return SuccessDataResult(data: UserModel.fromJson(doc.data()!));
      } else {
        return ErrorDataResult(message: "Kullanıcı bulunamadı.");
      }
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  @override
  Future<DataResult<UserModel>> getByDeviceId(String deviceId) async {
    try {
      var userModel =
          await _remoteDatasourceImpl.getByDeviceId(deviceId).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw TimeoutException("timeout");
        },
      );
      return SuccessDataResult(data: userModel);
    } catch (e) {
      if (e is TimeoutException) {
        return ErrorDataResult(message: " ${e.message}");
      }
      return ErrorDataResult(message: "Usere $e");
    }
  }

  @override
  Future<DataResult<bool>> hasUser(String deviceId) async {
    try {
      var result = await _remoteDatasourceImpl.hasUser(deviceId);
      return SuccessDataResult(data: result);
    } catch (e) {
      return ErrorDataResult(message: "User $e");
    }
  }

  @override
  Future<Result> update(UserModel userModel) async {
    try {
      await _remoteDatasourceImpl.update(userModel);
      await _localDatasourceImpl.update(userModel);
      return SuccessResult();
    } catch (e) {
      return ErrorResult(message: "User $e");
    }
  }

  @override
  Future<DataResult<String>> uploadPicToStorage(File imageFile) async {
    try {
      var result = await _remoteDatasourceImpl.uploadPicToStorage(imageFile);
      return SuccessDataResult(data: result);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  @override
  Future<DataResult<UserModel>> currentUser() async {
    try {
      var currentUserId = _localDatasourceImpl.currentUserId();
      var currentUser = await _remoteDatasourceImpl.currentUser(currentUserId);
      return SuccessDataResult(data: currentUser);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  @override
  Future<Result> localUpdate(UserModel userModel) async {
    try {
      await _localDatasourceImpl.update(userModel);
      return SuccessResult();
    } catch (e) {
      return ErrorResult(message: "User updateCoin $e");
    }
  }
}
