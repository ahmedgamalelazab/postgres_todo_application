part of 'registeruserbloc_bloc.dart';

@immutable
abstract class RegisteruserblocEvent {}

class RegisterUserEvenet extends RegisteruserblocEvent {
  //in this Case this user when he triggers the event this event should send
  //some info about the form that he already filled it with data
  final Map<String, dynamic> formBody;

  RegisterUserEvenet({this.formBody});
}
