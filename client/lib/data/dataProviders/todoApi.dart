import 'dart:convert';

import '../Models/todo.dart';
import 'package:http/http.dart' as http;

abstract class TodoApi {
  //TODO implement get todos , create todos , update todo , delete to do request
  Future<TodoOnGetModel> getTodos(String token);

  //all the rest of the requests should be implemented here also
}

class Todo extends TodoApi {
  @override
  Future<TodoOnGetModel> getTodos(String token) async {
    final todoUri = Uri.parse("http://localhost:5000/app/api/todo/All");

    //try get todos
    try {
      final getTodoResponse =
          await http.get(todoUri, headers: {"x-auth-token": token});
      if (getTodoResponse.statusCode == 200) {
        final responseParser =
            json.decode(getTodoResponse.body) as Map<String, dynamic>;
        return TodoOnGetModel.fromJson(responseParser);
      } else {
        //parse the response and send it it it will go with a regular resposne filled with error
        final responseParser =
            json.decode(getTodoResponse.body) as Map<String, dynamic>;
        return TodoOnGetModel.fromJson(responseParser);
      }
    } catch (error) {
      print(error);
    }
    return TodoOnGetModel(data: null, success: false);
  }
}
