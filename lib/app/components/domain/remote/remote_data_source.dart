import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/domain/datasources/user_data_source.dart';
import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UserRemoteDatasourceImpl implements UserDatasource {
  final CollectionReference<Map<String, dynamic>> _ref =
      FirebaseFirestore.instance.collection("users");

  final Reference _storage = FirebaseStorage.instance.ref();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future create(UserModel userModel) async {
    await _ref.doc(userModel.id).set(userModel.toJson());
    if (userBox.isEmpty) {
      await userBox.put(userModel.id, userModel);
    }
  }

  Stream<List<PostModel>> getAllPosts() {
    return FirebaseFirestore.instance
        .collection('posts')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => PostModel.fromJson(doc.data()))
          .toList();
    });
  }

  @override
  Future<UserModel> getByDeviceId(String deviceId) async {
    var querySnapshot = await _ref.where('deviceId', isEqualTo: deviceId).get();
    var list =
        querySnapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
    return list.first;
  }

  @override
  Future update(UserModel userModel) async {
    await _ref.doc(userModel.id).set(userModel.toJson());
  }

  @override
  Future<bool> hasUser(String deviceId) async {
    var querySnapshot = await _ref.where('deviceId', isEqualTo: deviceId).get();
    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<String> uploadPicToStorage(File imageFile) async {
    String refId = const Uuid().v4();
    UploadTask uploadManager =
        _storage.child("user/photo_$refId.jpg").putFile(imageFile);
    TaskSnapshot snapshot = await uploadManager;
    var photoUrl = await snapshot.ref.getDownloadURL();
    return photoUrl;
  }

  @override
  Future<UserModel> currentUser(String id) async {
    var documentSnapshot = await _ref.doc(id).get();
    return UserModel.fromJson(documentSnapshot.data()!);
  }

  @override
  String currentUserId() {
    // TODO: implement currentUserId
    throw UnimplementedError();
  }
}
