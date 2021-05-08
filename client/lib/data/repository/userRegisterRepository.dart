import 'package:client/data/Models/userRegister.dart';
import 'package:client/data/dataProviders/userRegisterationApi.dart';

class UserRegisterationProcessRepository {
  final UserRegisterApi userApi;

  UserRegisterationProcessRepository({this.userApi});

  Future<UserRegisterationProcessModel> getRegisterRawData(
      Map<String, dynamic> formBody) async {
    try {
      UserRegisterationProcessModel dataRaw;
      dataRaw = await userApi.registerUser(formBody);
      return dataRaw;
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
