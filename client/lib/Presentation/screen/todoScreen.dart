import 'package:client/data/Models/userRegister.dart';
import 'package:flutter/material.dart';

class TodoDataScreen extends StatelessWidget {
  static const String ScreenRoute = "/TodoDataScreen";
  const TodoDataScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDataRaw =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              userDataRaw["data"].success.toString(),
            ),
            Text(
              userDataRaw["data"].user.userEmail,
            ),
          ],
        ),
      ),
    );
  }
}
