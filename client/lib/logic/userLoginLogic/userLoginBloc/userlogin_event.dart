part of 'userlogin_bloc.dart';

@immutable
abstract class UserloginEvent {}

class LoginUserToServiceEvent extends UserloginEvent {
  //payload with aaction to send the data to the server
  final Map<String, dynamic> userForm;

  LoginUserToServiceEvent({this.userForm});
}
