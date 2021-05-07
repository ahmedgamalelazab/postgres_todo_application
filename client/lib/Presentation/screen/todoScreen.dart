import 'package:flutter/material.dart';

class TodoDataScreen extends StatelessWidget {
  static const String ScreenRoute = "/TodoDataScreen";
  const TodoDataScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("TodoDataScreen"),
      ),
    );
  }
}
