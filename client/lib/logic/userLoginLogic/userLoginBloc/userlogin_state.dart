part of 'userlogin_bloc.dart';

@immutable
abstract class UserloginState {}

class UserloginInitial extends UserloginState {}

class LoadingScreen extends UserloginState {}

class UserDataLoadedSuccessfully extends UserloginState {
  //state will handle the user data raw after login process complete
  final UserLoginProcessModel dataRaw;

  UserDataLoadedSuccessfully({this.dataRaw});
}

class LoadingInstruction extends UserloginState {}
