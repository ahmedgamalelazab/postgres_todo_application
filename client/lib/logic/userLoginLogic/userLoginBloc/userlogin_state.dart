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

class LoadingScreenOffersPartOne extends UserloginState {}

class LoadingScreenOffersPartTwo extends UserloginState {}

class FailLoadData extends UserloginState {
  final String message;

  FailLoadData(this.message);
}

class RedirectUserToLogin extends UserloginState {}

class UserLogoutLoadingScreen extends UserloginState {}

class UserLogoutState extends UserloginState {}
