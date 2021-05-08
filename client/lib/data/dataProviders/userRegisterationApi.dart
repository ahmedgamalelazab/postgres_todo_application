import 'dart:convert';

import 'package:client/data/Models/userRegister.dart';
import 'package:http/http.dart' as http;

abstract class UserRegisterApi {
  //post request to backend server , will need data , payload
  Future<UserRegisterationProcessModel> registerUser(Map<String, dynamic> body);
}

class Register extends UserRegisterApi {
  @override
  Future<UserRegisterationProcessModel> registerUser(
      Map<String, dynamic> formBody) async {
    print(formBody);
    final registerUri =
        Uri.parse("http://localhost:5000/app/api/todo/register");
    try {
      final response = await http.post(
        registerUri,
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "userName": formBody["userName"],
            "userEmail": formBody["userEmail"],
            "userPassword": formBody["userPassword"],
          },
        ),
      );
      if (response.statusCode == 201) {
        final responseConvertor =
            json.decode(response.body) as Map<String, dynamic>;
        print(responseConvertor);
        return UserRegisterationProcessModel.fromJson(responseConvertor);
      } else {
        final responseConvertor =
            json.decode(response.body) as Map<String, dynamic>;
        print(responseConvertor);
        return UserRegisterationProcessModel.fromJson(responseConvertor);
      }
    } catch (error) {
      print(error);
    }
    return UserRegisterationProcessModel(
        success: false,
        user: User(
            isVerified: false,
            userEmail: "No response",
            userId: "NoResponse",
            userName: "NoResponse"));
  }
}
