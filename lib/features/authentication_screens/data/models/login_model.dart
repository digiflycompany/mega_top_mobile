class UserModel {
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;
  String? fullName;
  String? email;
  int? userId;

  UserModel(
      {this.token,
        this.userEmail,
        this.userNicename,
        this.userDisplayName,
        this.fullName,
        this.email,
        this.userId});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
    fullName = json['full_name'];
    email = json['email'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_email'] = this.userEmail;
    data['user_nicename'] = this.userNicename;
    data['user_display_name'] = this.userDisplayName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['user_id'] = this.userId;
    return data;
  }
}
