class DeleteAccountModel {
  String? message;

  DeleteAccountModel({this.message});

  DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (message != null) {
      data['message'] = this.message;
    }
    return data;
  }
}
