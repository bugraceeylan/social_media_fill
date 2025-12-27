// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get deviceId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get eMail => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get userTag => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get surName => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get about => throw _privateConstructorUsedError;
  @HiveField(8)
  int? get level => throw _privateConstructorUsedError;
  @HiveField(9)
  List<String>? get followingIDs => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String>? get followerIDs => throw _privateConstructorUsedError;
  @HiveField(11)
  List<String>? get postShared => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get dayWords => throw _privateConstructorUsedError;
  @HiveField(13)
  bool? get privateAcc => throw _privateConstructorUsedError;
  @HiveField(14)
  String? get profilePhoto => throw _privateConstructorUsedError;
  @HiveField(15)
  DateTime? get registerDate => throw _privateConstructorUsedError;
  @HiveField(16)
  List<PostModel>? get posts => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
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
      @HiveField(16) List<PostModel>? posts});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? deviceId = freezed,
    Object? eMail = freezed,
    Object? userTag = freezed,
    Object? name = freezed,
    Object? surName = freezed,
    Object? title = freezed,
    Object? about = freezed,
    Object? level = freezed,
    Object? followingIDs = freezed,
    Object? followerIDs = freezed,
    Object? postShared = freezed,
    Object? dayWords = freezed,
    Object? privateAcc = freezed,
    Object? profilePhoto = freezed,
    Object? registerDate = freezed,
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      eMail: freezed == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as String?,
      userTag: freezed == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surName: freezed == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      followingIDs: freezed == followingIDs
          ? _value.followingIDs
          : followingIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followerIDs: freezed == followerIDs
          ? _value.followerIDs
          : followerIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      postShared: freezed == postShared
          ? _value.postShared
          : postShared // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dayWords: freezed == dayWords
          ? _value.dayWords
          : dayWords // ignore: cast_nullable_to_non_nullable
              as String?,
      privateAcc: freezed == privateAcc
          ? _value.privateAcc
          : privateAcc // ignore: cast_nullable_to_non_nullable
              as bool?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
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
      @HiveField(16) List<PostModel>? posts});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? deviceId = freezed,
    Object? eMail = freezed,
    Object? userTag = freezed,
    Object? name = freezed,
    Object? surName = freezed,
    Object? title = freezed,
    Object? about = freezed,
    Object? level = freezed,
    Object? followingIDs = freezed,
    Object? followerIDs = freezed,
    Object? postShared = freezed,
    Object? dayWords = freezed,
    Object? privateAcc = freezed,
    Object? profilePhoto = freezed,
    Object? registerDate = freezed,
    Object? posts = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      eMail: freezed == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as String?,
      userTag: freezed == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surName: freezed == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      followingIDs: freezed == followingIDs
          ? _value._followingIDs
          : followingIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followerIDs: freezed == followerIDs
          ? _value._followerIDs
          : followerIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      postShared: freezed == postShared
          ? _value._postShared
          : postShared // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dayWords: freezed == dayWords
          ? _value.dayWords
          : dayWords // ignore: cast_nullable_to_non_nullable
              as String?,
      privateAcc: freezed == privateAcc
          ? _value.privateAcc
          : privateAcc // ignore: cast_nullable_to_non_nullable
              as bool?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'UserModelAdapter')
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.deviceId,
      @HiveField(2) this.eMail,
      @HiveField(3) this.userTag,
      @HiveField(4) this.name,
      @HiveField(5) this.surName,
      @HiveField(6) this.title,
      @HiveField(7) this.about,
      @HiveField(8) this.level,
      @HiveField(9) final List<String>? followingIDs,
      @HiveField(10) final List<String>? followerIDs,
      @HiveField(11) final List<String>? postShared,
      @HiveField(12) this.dayWords,
      @HiveField(13) this.privateAcc,
      @HiveField(14) this.profilePhoto,
      @HiveField(15) this.registerDate,
      @HiveField(16) final List<PostModel>? posts})
      : _followingIDs = followingIDs,
        _followerIDs = followerIDs,
        _postShared = postShared,
        _posts = posts;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? deviceId;
  @override
  @HiveField(2)
  final String? eMail;
  @override
  @HiveField(3)
  final String? userTag;
  @override
  @HiveField(4)
  final String? name;
  @override
  @HiveField(5)
  final String? surName;
  @override
  @HiveField(6)
  final String? title;
  @override
  @HiveField(7)
  final String? about;
  @override
  @HiveField(8)
  final int? level;
  final List<String>? _followingIDs;
  @override
  @HiveField(9)
  List<String>? get followingIDs {
    final value = _followingIDs;
    if (value == null) return null;
    if (_followingIDs is EqualUnmodifiableListView) return _followingIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _followerIDs;
  @override
  @HiveField(10)
  List<String>? get followerIDs {
    final value = _followerIDs;
    if (value == null) return null;
    if (_followerIDs is EqualUnmodifiableListView) return _followerIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _postShared;
  @override
  @HiveField(11)
  List<String>? get postShared {
    final value = _postShared;
    if (value == null) return null;
    if (_postShared is EqualUnmodifiableListView) return _postShared;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(12)
  final String? dayWords;
  @override
  @HiveField(13)
  final bool? privateAcc;
  @override
  @HiveField(14)
  final String? profilePhoto;
  @override
  @HiveField(15)
  final DateTime? registerDate;
  final List<PostModel>? _posts;
  @override
  @HiveField(16)
  List<PostModel>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, deviceId: $deviceId, eMail: $eMail, userTag: $userTag, name: $name, surName: $surName, title: $title, about: $about, level: $level, followingIDs: $followingIDs, followerIDs: $followerIDs, postShared: $postShared, dayWords: $dayWords, privateAcc: $privateAcc, profilePhoto: $profilePhoto, registerDate: $registerDate, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.eMail, eMail) || other.eMail == eMail) &&
            (identical(other.userTag, userTag) || other.userTag == userTag) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surName, surName) || other.surName == surName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality()
                .equals(other._followingIDs, _followingIDs) &&
            const DeepCollectionEquality()
                .equals(other._followerIDs, _followerIDs) &&
            const DeepCollectionEquality()
                .equals(other._postShared, _postShared) &&
            (identical(other.dayWords, dayWords) ||
                other.dayWords == dayWords) &&
            (identical(other.privateAcc, privateAcc) ||
                other.privateAcc == privateAcc) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      deviceId,
      eMail,
      userTag,
      name,
      surName,
      title,
      about,
      level,
      const DeepCollectionEquality().hash(_followingIDs),
      const DeepCollectionEquality().hash(_followerIDs),
      const DeepCollectionEquality().hash(_postShared),
      dayWords,
      privateAcc,
      profilePhoto,
      registerDate,
      const DeepCollectionEquality().hash(_posts));

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@HiveField(0) final String? id,
      @HiveField(1) final String? deviceId,
      @HiveField(2) final String? eMail,
      @HiveField(3) final String? userTag,
      @HiveField(4) final String? name,
      @HiveField(5) final String? surName,
      @HiveField(6) final String? title,
      @HiveField(7) final String? about,
      @HiveField(8) final int? level,
      @HiveField(9) final List<String>? followingIDs,
      @HiveField(10) final List<String>? followerIDs,
      @HiveField(11) final List<String>? postShared,
      @HiveField(12) final String? dayWords,
      @HiveField(13) final bool? privateAcc,
      @HiveField(14) final String? profilePhoto,
      @HiveField(15) final DateTime? registerDate,
      @HiveField(16) final List<PostModel>? posts}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get deviceId;
  @override
  @HiveField(2)
  String? get eMail;
  @override
  @HiveField(3)
  String? get userTag;
  @override
  @HiveField(4)
  String? get name;
  @override
  @HiveField(5)
  String? get surName;
  @override
  @HiveField(6)
  String? get title;
  @override
  @HiveField(7)
  String? get about;
  @override
  @HiveField(8)
  int? get level;
  @override
  @HiveField(9)
  List<String>? get followingIDs;
  @override
  @HiveField(10)
  List<String>? get followerIDs;
  @override
  @HiveField(11)
  List<String>? get postShared;
  @override
  @HiveField(12)
  String? get dayWords;
  @override
  @HiveField(13)
  bool? get privateAcc;
  @override
  @HiveField(14)
  String? get profilePhoto;
  @override
  @HiveField(15)
  DateTime? get registerDate;
  @override
  @HiveField(16)
  List<PostModel>? get posts;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
