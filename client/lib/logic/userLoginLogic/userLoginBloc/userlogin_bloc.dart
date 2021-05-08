import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/data/Models/userLogin.dart';
import 'package:client/data/repository/userLoginRepository.dart';
import 'package:meta/meta.dart';

part 'userlogin_event.dart';
part 'userlogin_state.dart';

//the root of all other process starting from calling repositoty to use the models to fetch the data
class UserloginBloc extends Bloc<UserloginEvent, UserloginState> {
  final LoginRepository loginRepository;
  UserloginBloc({this.loginRepository}) : super(UserloginInitial());

  @override
  Stream<UserloginState> mapEventToState(
    UserloginEvent event,
  ) async* {
    //dispatching
    if (event is LoginUserToServiceEvent) {
      //loading screen for 3 seconds first
      yield LoadingScreen();
      await Future.delayed(Duration(seconds: 3));
      yield LoadingInstruction();
      await Future.delayed(Duration(seconds: 3));
      try {
        UserLoginProcessModel dataRaw =
            await loginRepository.getUserDataRawAfterLogin(event.userForm);
        print(dataRaw.accessToken);
        print(dataRaw.success);
        yield UserDataLoadedSuccessfully(dataRaw: dataRaw);
        await Future.delayed(Duration(seconds: 2));
        //if all of
      } catch (error) {
        print(error);
      }
    }
  }
}
