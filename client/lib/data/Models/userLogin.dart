class UserLoginProcessModel {
  bool success;
  String userName;
  String userEmail;
  String accessToken;
  String errorMessage;

  UserLoginProcessModel(
      {this.success,
      this.userName,
      this.userEmail,
      this.accessToken,
      this.errorMessage});

  UserLoginProcessModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    userName = json['userName'] ?? "NoName";
    userEmail = json['userEmail'] ?? "NoEmail";
    accessToken = json['accessToken'] ?? "NoAccessToken";
    errorMessage = json["message"] ?? "NoError";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['accessToken'] = this.accessToken;
    data['message'] = this.errorMessage;
    return data;
  }
}
