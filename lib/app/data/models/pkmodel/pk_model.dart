import 'package:fill_store_bb/app/data/models/users/user_model.dart';

class PKModel {
  final String content;
  final UserModel user;
  final int likeCount;
  final int pkStatus;

  PKModel(
      {required this.content,
      required this.user,
      required this.likeCount,
      required this.pkStatus});
}
