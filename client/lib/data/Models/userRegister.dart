class UserRegisterationProcessModel {
  bool success;
  User user;
  String token;
  String errorMessage;

  UserRegisterationProcessModel({this.success, this.user, this.errorMessage});

  UserRegisterationProcessModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    errorMessage = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['message'] = this.errorMessage;
    data['token'] = this.token;
    return data;
  }
}

class User {
  String userId;
  String userName;
  String userEmail;
  bool isVerified;

  User({this.userId, this.userName, this.userEmail, this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['is_verified'] = this.isVerified;
    return data;
  }
}
