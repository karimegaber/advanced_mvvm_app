import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';

// ( with _$LoginObject ) means this class is defined as ( Freezed ).
@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}
