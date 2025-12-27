import 'package:fill_store_bb/app/core/result/data_result.dart';

part 'error_result.dart';
part 'error_data_result.dart';

abstract class Result {
  bool success;
  String? message;

  Result(this.success, this.message);
}
