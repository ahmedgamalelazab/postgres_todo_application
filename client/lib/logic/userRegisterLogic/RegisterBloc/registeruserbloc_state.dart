part of 'registeruserbloc_bloc.dart';

@immutable
abstract class RegisteruserblocState {}

class RegisteruserblocInitial extends RegisteruserblocState {}

class LoadingScreen extends RegisteruserblocState {}

class LoadingVerifyHints extends RegisteruserblocState {}

class LoadedUserInfo extends RegisteruserblocState {
  final UserRegisterationProcessModel dataRaw;

  LoadedUserInfo(this.dataRaw);
}

class LoadedUserFailed extends RegisteruserblocState {
  final String errorMessage;

  LoadedUserFailed({this.errorMessage});
}

class LoadRegisterScreenAgain extends RegisteruserblocState {}
