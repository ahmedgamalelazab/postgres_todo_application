part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class NotodoFound extends TodoState {}

class LoadedTodo extends TodoState {
  final List<Data> todos;

  LoadedTodo({this.todos});
}

class TodoUserHaveToVerifyError extends TodoState {
  final String message;

  TodoUserHaveToVerifyError({this.message});
}

class TodoUserTokenExpiredError extends TodoState {
  final String message;

  TodoUserTokenExpiredError({this.message});
}

class TodoExpiredTokenLoadingScreen extends TodoState {}

class TodoExpiredTokenRelogin extends TodoState {}

class TodoServerProblemError extends TodoState {
  final String message;

  TodoServerProblemError({this.message});
}

class LoadingTodosFail extends TodoState {
  final String message;

  LoadingTodosFail({this.message});
}
