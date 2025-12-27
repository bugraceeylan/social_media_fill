// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      userImage: json['userImage'] as String,
      userName: json['userName'] as String,
      comment: json['comment'] as String,
      commentLikeCount: (json['commentLikeCount'] as num).toInt(),
      commentLike: json['commentLike'] as bool,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'userImage': instance.userImage,
      'userName': instance.userName,
      'comment': instance.comment,
      'commentLikeCount': instance.commentLikeCount,
      'commentLike': instance.commentLike,
      'timestamp': instance.timestamp,
    };
