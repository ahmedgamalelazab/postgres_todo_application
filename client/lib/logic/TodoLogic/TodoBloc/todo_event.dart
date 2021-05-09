part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

//user access his screen we will fire a get todos

class GetTodos extends TodoEvent {
  final String token;

  GetTodos({this.token});
}
