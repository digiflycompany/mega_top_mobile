
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorResponse {
  final String? message;
  final String? status;

  ApiErrorResponse({
    required this.message,
    this.status,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) => _$ApiErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);
}