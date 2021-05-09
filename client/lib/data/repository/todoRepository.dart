import 'package:client/data/Models/todo.dart';

import '../dataProviders/todoApi.dart';

class TodoRepository {
  //api ..
  final TodoApi todoApi;

  TodoRepository({this.todoApi});

  //pic ur target which is the todo list or get the hole thing and let the bloc deal with it
  Future<TodoOnGetModel> todoDataRawGetAll(String token) async {
    try {
      TodoOnGetModel dataResponse = await todoApi.getTodos(token);
      print(dataResponse.data);
      return dataResponse;
    } catch (error) {
      print(error);
    }
    return TodoOnGetModel(data: null, success: false);
  }
}
