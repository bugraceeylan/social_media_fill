import 'package:fill_store_bb/app/core/result/data_result.dart';

class SuccessDataResult<T> extends DataResult<T> {
  SuccessDataResult({String? message, required T data})
      : super(true, message ?? "Success", data);
}
