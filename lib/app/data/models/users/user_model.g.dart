// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<_$UserModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$UserModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserModelImpl(
      id: fields[0] as String?,
      deviceId: fields[1] as String?,
      eMail: fields[2] as String?,
      userTag: fields[3] as String?,
      name: fields[4] as String?,
      surName: fields[5] as String?,
      title: fields[6] as String?,
      about: fields[7] as String?,
      level: fields[8] as int?,
      followingIDs: (fields[9] as List?)?.cast<String>(),
      followerIDs: (fields[10] as List?)?.cast<String>(),
      postShared: (fields[11] as List?)?.cast<String>(),
      dayWords: fields[12] as String?,
      privateAcc: fields[13] as bool?,
      profilePhoto: fields[14] as String?,
      registerDate: fields[15] as DateTime?,
      posts: (fields[16] as List?)?.cast<PostModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$UserModelImpl obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.deviceId)
      ..writeByte(2)
      ..write(obj.eMail)
      ..writeByte(3)
      ..write(obj.userTag)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.surName)
      ..writeByte(6)
      ..write(obj.title)
      ..writeByte(7)
      ..write(obj.about)
      ..writeByte(8)
      ..write(obj.level)
      ..writeByte(12)
      ..write(obj.dayWords)
      ..writeByte(13)
      ..write(obj.privateAcc)
      ..writeByte(14)
      ..write(obj.profilePhoto)
      ..writeByte(15)
      ..write(obj.registerDate)
      ..writeByte(9)
      ..write(obj.followingIDs)
      ..writeByte(10)
      ..write(obj.followerIDs)
      ..writeByte(11)
      ..write(obj.postShared)
      ..writeByte(16)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      deviceId: json['deviceId'] as String?,
      eMail: json['eMail'] as String?,
      userTag: json['userTag'] as String?,
      name: json['name'] as String?,
      surName: json['surName'] as String?,
      title: json['title'] as String?,
      about: json['about'] as String?,
      level: (json['level'] as num?)?.toInt(),
      followingIDs: (json['followingIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followerIDs: (json['followerIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      postShared: (json['postShared'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dayWords: json['dayWords'] as String?,
      privateAcc: json['privateAcc'] as bool?,
      profilePhoto: json['profilePhoto'] as String?,
      registerDate: json['registerDate'] == null
          ? null
          : DateTime.parse(json['registerDate'] as String),
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'eMail': instance.eMail,
      'userTag': instance.userTag,
      'name': instance.name,
      'surName': instance.surName,
      'title': instance.title,
      'about': instance.about,
      'level': instance.level,
      'followingIDs': instance.followingIDs,
      'followerIDs': instance.followerIDs,
      'postShared': instance.postShared,
      'dayWords': instance.dayWords,
      'privateAcc': instance.privateAcc,
      'profilePhoto': instance.profilePhoto,
      'registerDate': instance.registerDate?.toIso8601String(),
      'posts': instance.posts,
    };
