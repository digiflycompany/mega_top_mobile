class ResetPasswordModel {
  final bool success;
  final String? message;
  final String? token;

  ResetPasswordModel({
    required this.success,
    this.message,
    this.token,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      success: json['success'],
      message: json['message'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
    };
  }
}
