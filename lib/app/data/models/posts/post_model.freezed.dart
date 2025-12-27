// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  String get postID => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get postImage => throw _privateConstructorUsedError;
  int get postPoints => throw _privateConstructorUsedError;
  int get postLike => throw _privateConstructorUsedError;
  List<CommentModel> get comments => throw _privateConstructorUsedError;
  String get postAbout => throw _privateConstructorUsedError;
  String get postShareTime => throw _privateConstructorUsedError;
  String get effectName => throw _privateConstructorUsedError;
  List<String>? get texts => throw _privateConstructorUsedError;
  String? get musicName => throw _privateConstructorUsedError;
  List<String>? get likedBy => throw _privateConstructorUsedError;

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {String postID,
      String userID,
      String userName,
      String postImage,
      int postPoints,
      int postLike,
      List<CommentModel> comments,
      String postAbout,
      String postShareTime,
      String effectName,
      List<String>? texts,
      String? musicName,
      List<String>? likedBy});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? userID = null,
    Object? userName = null,
    Object? postImage = null,
    Object? postPoints = null,
    Object? postLike = null,
    Object? comments = null,
    Object? postAbout = null,
    Object? postShareTime = null,
    Object? effectName = null,
    Object? texts = freezed,
    Object? musicName = freezed,
    Object? likedBy = freezed,
  }) {
    return _then(_value.copyWith(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: null == postImage
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
      postPoints: null == postPoints
          ? _value.postPoints
          : postPoints // ignore: cast_nullable_to_non_nullable
              as int,
      postLike: null == postLike
          ? _value.postLike
          : postLike // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      postAbout: null == postAbout
          ? _value.postAbout
          : postAbout // ignore: cast_nullable_to_non_nullable
              as String,
      postShareTime: null == postShareTime
          ? _value.postShareTime
          : postShareTime // ignore: cast_nullable_to_non_nullable
              as String,
      effectName: null == effectName
          ? _value.effectName
          : effectName // ignore: cast_nullable_to_non_nullable
              as String,
      texts: freezed == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      musicName: freezed == musicName
          ? _value.musicName
          : musicName // ignore: cast_nullable_to_non_nullable
              as String?,
      likedBy: freezed == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostModelImplCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$$PostModelImplCopyWith(
          _$PostModelImpl value, $Res Function(_$PostModelImpl) then) =
      __$$PostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postID,
      String userID,
      String userName,
      String postImage,
      int postPoints,
      int postLike,
      List<CommentModel> comments,
      String postAbout,
      String postShareTime,
      String effectName,
      List<String>? texts,
      String? musicName,
      List<String>? likedBy});
}

/// @nodoc
class __$$PostModelImplCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$PostModelImpl>
    implements _$$PostModelImplCopyWith<$Res> {
  __$$PostModelImplCopyWithImpl(
      _$PostModelImpl _value, $Res Function(_$PostModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? userID = null,
    Object? userName = null,
    Object? postImage = null,
    Object? postPoints = null,
    Object? postLike = null,
    Object? comments = null,
    Object? postAbout = null,
    Object? postShareTime = null,
    Object? effectName = null,
    Object? texts = freezed,
    Object? musicName = freezed,
    Object? likedBy = freezed,
  }) {
    return _then(_$PostModelImpl(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: null == postImage
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
      postPoints: null == postPoints
          ? _value.postPoints
          : postPoints // ignore: cast_nullable_to_non_nullable
              as int,
      postLike: null == postLike
          ? _value.postLike
          : postLike // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      postAbout: null == postAbout
          ? _value.postAbout
          : postAbout // ignore: cast_nullable_to_non_nullable
              as String,
      postShareTime: null == postShareTime
          ? _value.postShareTime
          : postShareTime // ignore: cast_nullable_to_non_nullable
              as String,
      effectName: null == effectName
          ? _value.effectName
          : effectName // ignore: cast_nullable_to_non_nullable
              as String,
      texts: freezed == texts
          ? _value._texts
          : texts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      musicName: freezed == musicName
          ? _value.musicName
          : musicName // ignore: cast_nullable_to_non_nullable
              as String?,
      likedBy: freezed == likedBy
          ? _value._likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostModelImpl implements _PostModel {
  const _$PostModelImpl(
      {required this.postID,
      required this.userID,
      required this.userName,
      required this.postImage,
      required this.postPoints,
      required this.postLike,
      required final List<CommentModel> comments,
      required this.postAbout,
      required this.postShareTime,
      required this.effectName,
      required final List<String>? texts,
      required this.musicName,
      required final List<String>? likedBy})
      : _comments = comments,
        _texts = texts,
        _likedBy = likedBy;

  factory _$PostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostModelImplFromJson(json);

  @override
  final String postID;
  @override
  final String userID;
  @override
  final String userName;
  @override
  final String postImage;
  @override
  final int postPoints;
  @override
  final int postLike;
  final List<CommentModel> _comments;
  @override
  List<CommentModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final String postAbout;
  @override
  final String postShareTime;
  @override
  final String effectName;
  final List<String>? _texts;
  @override
  List<String>? get texts {
    final value = _texts;
    if (value == null) return null;
    if (_texts is EqualUnmodifiableListView) return _texts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? musicName;
  final List<String>? _likedBy;
  @override
  List<String>? get likedBy {
    final value = _likedBy;
    if (value == null) return null;
    if (_likedBy is EqualUnmodifiableListView) return _likedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PostModel(postID: $postID, userID: $userID, userName: $userName, postImage: $postImage, postPoints: $postPoints, postLike: $postLike, comments: $comments, postAbout: $postAbout, postShareTime: $postShareTime, effectName: $effectName, texts: $texts, musicName: $musicName, likedBy: $likedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostModelImpl &&
            (identical(other.postID, postID) || other.postID == postID) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.postImage, postImage) ||
                other.postImage == postImage) &&
            (identical(other.postPoints, postPoints) ||
                other.postPoints == postPoints) &&
            (identical(other.postLike, postLike) ||
                other.postLike == postLike) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.postAbout, postAbout) ||
                other.postAbout == postAbout) &&
            (identical(other.postShareTime, postShareTime) ||
                other.postShareTime == postShareTime) &&
            (identical(other.effectName, effectName) ||
                other.effectName == effectName) &&
            const DeepCollectionEquality().equals(other._texts, _texts) &&
            (identical(other.musicName, musicName) ||
                other.musicName == musicName) &&
            const DeepCollectionEquality().equals(other._likedBy, _likedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postID,
      userID,
      userName,
      postImage,
      postPoints,
      postLike,
      const DeepCollectionEquality().hash(_comments),
      postAbout,
      postShareTime,
      effectName,
      const DeepCollectionEquality().hash(_texts),
      musicName,
      const DeepCollectionEquality().hash(_likedBy));

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      __$$PostModelImplCopyWithImpl<_$PostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostModelImplToJson(
      this,
    );
  }
}

abstract class _PostModel implements PostModel {
  const factory _PostModel(
      {required final String postID,
      required final String userID,
      required final String userName,
      required final String postImage,
      required final int postPoints,
      required final int postLike,
      required final List<CommentModel> comments,
      required final String postAbout,
      required final String postShareTime,
      required final String effectName,
      required final List<String>? texts,
      required final String? musicName,
      required final List<String>? likedBy}) = _$PostModelImpl;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$PostModelImpl.fromJson;

  @override
  String get postID;
  @override
  String get userID;
  @override
  String get userName;
  @override
  String get postImage;
  @override
  int get postPoints;
  @override
  int get postLike;
  @override
  List<CommentModel> get comments;
  @override
  String get postAbout;
  @override
  String get postShareTime;
  @override
  String get effectName;
  @override
  List<String>? get texts;
  @override
  String? get musicName;
  @override
  List<String>? get likedBy;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
