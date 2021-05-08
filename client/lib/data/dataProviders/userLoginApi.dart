import 'dart:convert';

import 'package:client/data/Models/userLogin.dart';
import 'package:http/http.dart' as http;

abstract class UserLoginApi {
  Future<UserLoginProcessModel> userLoginRequest(Map<String, dynamic> formBody);
}

class Login extends UserLoginApi {
  @override
  Future<UserLoginProcessModel> userLoginRequest(
      Map<String, dynamic> formBody) async {
    final loginUri = Uri.parse("http://localhost:5000/app/api/todo/login");
    try {
      final loginRequestResponse = await http.post(
        loginUri,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "userEmail": formBody["userEmail"],
          "userPassword": formBody["userPassword"],
        }),
      );
      if (loginRequestResponse.statusCode == 201) {
        final responseConvertor =
            json.decode(loginRequestResponse.body) as Map<String, dynamic>;
        return UserLoginProcessModel.fromJson(
            responseConvertor); //u can call it json parser
      } else {
        //error maybe server fail or invalid userName or password
        final responseConvertor =
            json.decode(loginRequestResponse.body) as Map<String, dynamic>;
        return UserLoginProcessModel.fromJson(responseConvertor);
      }
    } catch (error) {
      print(error);
    }
    return UserLoginProcessModel(
        accessToken: "NoToken",
        errorMessage: "No Response",
        success: false,
        userEmail: "NouserEmail",
        userName: "NouserName");
  }
}
