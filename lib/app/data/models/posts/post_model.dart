import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fill_store_bb/app/data/models/comment/comment_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required String postID,
    required String userID,
    required String userName,
    required String postImage,
    required int postPoints,
    required int postLike,
    required List<CommentModel> comments,
    required String postAbout,
    required String postShareTime,
    required String effectName,
    required List<String>? texts,
    required String? musicName,
    required List<String>? likedBy,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
