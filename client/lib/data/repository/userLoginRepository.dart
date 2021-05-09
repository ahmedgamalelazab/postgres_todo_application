//login repository

import 'package:client/data/Models/userLogin.dart';
import 'package:client/data/dataProviders/userLoginApi.dart';

class LoginRepository {
  final UserLoginApi userLoginApi;

  LoginRepository({this.userLoginApi});

  Future<UserLoginProcessModel> getUserDataRawAfterLogin(
      Map<String, dynamic> formBody) async {
    try {
      UserLoginProcessModel dataRaw =
          await userLoginApi.userLoginRequest(formBody);
      return dataRaw;
    } catch (error) {
      print(error);
    }
    return UserLoginProcessModel(
        accessToken: null,
        errorMessage: "Connectivity Lost .. check your connection",
        success: false,
        userEmail: "NouserEmail",
        userName: "NouserName");
  }
}
