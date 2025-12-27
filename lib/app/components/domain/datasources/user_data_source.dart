import 'package:fill_store_bb/app/data/models/users/user_model.dart';

abstract class UserDatasource {
  Future create(UserModel userModel);
  Future update(UserModel userModel);
  Future<UserModel> getByDeviceId(String deviceId);
  Future<bool> hasUser(String deviceId);
  Future<UserModel> currentUser(String id);
  String currentUserId();
}
