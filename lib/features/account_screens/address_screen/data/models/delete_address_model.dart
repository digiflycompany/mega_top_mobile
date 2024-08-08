class DeleteAddressModel {
  final bool success;
  final String message;
  final String errorCode;
  final Data data;

  DeleteAddressModel({
    required this.success,
    required this.message,
    required this.errorCode,
    required this.data,
  });

  factory DeleteAddressModel.fromJson(Map<String, dynamic> json) {
    return DeleteAddressModel(
      success: json['success'],
      message: json['message'] ?? '',
      errorCode: json['errorCode'] ?? '',
      data: json['data'] != null ? Data.fromJson(json['data']) : Data.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'errorCode': errorCode,
      'data': data.toJson(),
    };
  }
}

class Data {
  final bool acknowledged;
  final int deletedCount;

  Data({
    required this.acknowledged,
    required this.deletedCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      acknowledged: json['acknowledged'],
      deletedCount: json['deletedCount'],
    );
  }

  factory Data.empty() {
    return Data(
      acknowledged: false,
      deletedCount: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'acknowledged': acknowledged,
      'deletedCount': deletedCount,
    };
  }
}
