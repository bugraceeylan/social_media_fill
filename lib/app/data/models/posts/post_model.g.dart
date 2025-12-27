// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      postID: json['postID'] as String,
      userID: json['userID'] as String,
      userName: json['userName'] as String,
      postImage: json['postImage'] as String,
      postPoints: (json['postPoints'] as num).toInt(),
      postLike: (json['postLike'] as num).toInt(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      postAbout: json['postAbout'] as String,
      postShareTime: json['postShareTime'] as String,
      effectName: json['effectName'] as String,
      texts:
          (json['texts'] as List<dynamic>?)?.map((e) => e as String).toList(),
      musicName: json['musicName'] as String?,
      likedBy:
          (json['likedBy'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'postID': instance.postID,
      'userID': instance.userID,
      'userName': instance.userName,
      'postImage': instance.postImage,
      'postPoints': instance.postPoints,
      'postLike': instance.postLike,
      'comments': instance.comments,
      'postAbout': instance.postAbout,
      'postShareTime': instance.postShareTime,
      'effectName': instance.effectName,
      'texts': instance.texts,
      'musicName': instance.musicName,
      'likedBy': instance.likedBy,
    };
