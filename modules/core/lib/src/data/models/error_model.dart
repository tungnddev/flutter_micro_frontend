class ErrorModel {
  final String? code;
  final String? message;

  ErrorModel(this.code, this.message);

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        json['code'] is String ? json['code'] : "SOMETHING WENT WRONG",
        json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };
}
