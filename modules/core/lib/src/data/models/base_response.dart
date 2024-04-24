import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(
  constructor: '_',
  createToJson: false,
  genericArgumentFactories: true,
)
class BaseResponse<T> {
  final String? code;
  final String? message;
  final T? data;

  BaseResponse._(this.code, this.message, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, fromJsonT);
}