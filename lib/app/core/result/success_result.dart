
import 'package:fill_store_bb/app/core/result/result.dart';

class SuccessResult extends Result {
  SuccessResult({String? message}) : super(true, message ?? "Success");
}
