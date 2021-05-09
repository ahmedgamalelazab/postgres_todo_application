class TodoOnGetModel {
  bool success;
  List<Data> data;
  String message; //error message comes out from the server

  TodoOnGetModel({this.success, this.data});

  TodoOnGetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    message = json['message'] ?? "NoMessage";
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int todoId;
  String describtion;
  String userId;

  Data({this.todoId, this.describtion, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    todoId = json['todo_id'];
    describtion = json['describtion'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todo_id'] = this.todoId;
    data['describtion'] = this.describtion;
    data['user_id'] = this.userId;
    return data;
  }
}
