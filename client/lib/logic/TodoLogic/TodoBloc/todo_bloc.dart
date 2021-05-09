import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/config/TokensErrorMessages.dart';
import 'package:client/data/Models/todo.dart';
import 'package:client/data/repository/todoRepository.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  TodoBloc({this.todoRepository}) : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is GetTodos) {
      yield TodoLoading();
      await Future.delayed(Duration(seconds: 3));
      try {
        TodoOnGetModel dataRaw =
            await todoRepository.todoDataRawGetAll(event.token);
        print(dataRaw.data);
        print(dataRaw.message);
        //if all ok
        if (dataRaw.success == false || dataRaw.data == null) {
          if (checkErrorMessageWhenTokenUsed(dataRaw.message) == 1) {
            print(dataRaw.message);
            yield TodoUserHaveToVerifyError(message: dataRaw.message);
          } else if (checkErrorMessageWhenTokenUsed(dataRaw.message) == 2) {
            print(dataRaw.message);
            yield TodoUserTokenExpiredError(message: dataRaw.message);
            await Future.delayed(Duration(seconds: 3));
            yield TodoExpiredTokenLoadingScreen();
            await Future.delayed(Duration(seconds: 3));
            yield TodoExpiredTokenRelogin();
          } else {
            print(dataRaw.message);
            yield TodoServerProblemError(message: dataRaw.message);
          }
        } else if (dataRaw.data.length == 0) {
          print("yielded not found todo");
          yield NotodoFound();
        } else {
          yield LoadedTodo(todos: dataRaw.data);
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
