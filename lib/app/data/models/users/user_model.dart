import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @HiveType(typeId: 0, adapterName: 'UserModelAdapter')
  const factory UserModel({
    @HiveField(0) String? id,
    @HiveField(1) String? deviceId,
    @HiveField(2) String? eMail,
    @HiveField(3) String? userTag,
    @HiveField(4) String? name,
    @HiveField(5) String? surName,
    @HiveField(6) String? title,
    @HiveField(7) String? about,
    @HiveField(8) int? level,
    @HiveField(9) List<String>? followingIDs,
    @HiveField(10) List<String>? followerIDs,
    @HiveField(11) List<String>? postShared,
    @HiveField(12) String? dayWords,
    @HiveField(13) bool? privateAcc,
    @HiveField(14) String? profilePhoto,
    @HiveField(15) DateTime? registerDate,
    @HiveField(16) List<PostModel>? posts,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
