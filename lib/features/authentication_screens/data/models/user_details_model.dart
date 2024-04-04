class UserDetailsModel {
  Data? data;
  int? iD;
  Caps? caps;
  String? capKey;
  List<String>? roles;
  Null filter;

  UserDetailsModel(
      {this.data, this.iD, this.caps, this.capKey, this.roles, this.filter});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    iD = json['ID'];
    caps = json['caps'] != null ? new Caps.fromJson(json['caps']) : null;
    capKey = json['cap_key'];
    roles = json['roles'].cast<String>();
    filter = json['filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['ID'] = this.iD;
    if (this.caps != null) {
      data['caps'] = this.caps!.toJson();
    }
    data['cap_key'] = this.capKey;
    data['roles'] = this.roles;
    data['filter'] = this.filter;
    return data;
  }
}

class Data {
  String? iD;
  String? userLogin;
  String? userNicename;
  String? userEmail;
  String? userUrl;
  String? userRegistered;
  String? userStatus;
  String? displayName;

  Data(
      {this.iD,
        this.userLogin,
        this.userNicename,
        this.userEmail,
        this.userUrl,
        this.userRegistered,
        this.userStatus,
        this.displayName});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userLogin = json['user_login'];
    userNicename = json['user_nicename'];
    userEmail = json['user_email'];
    userUrl = json['user_url'];
    userRegistered = json['user_registered'];
    userStatus = json['user_status'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['user_login'] = this.userLogin;
    data['user_nicename'] = this.userNicename;
    data['user_email'] = this.userEmail;
    data['user_url'] = this.userUrl;
    data['user_registered'] = this.userRegistered;
    data['user_status'] = this.userStatus;
    data['display_name'] = this.displayName;
    return data;
  }
}

class Caps {
  bool? subscriber;

  Caps({this.subscriber});

  Caps.fromJson(Map<String, dynamic> json) {
    subscriber = json['subscriber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscriber'] = this.subscriber;
    return data;
  }
}
