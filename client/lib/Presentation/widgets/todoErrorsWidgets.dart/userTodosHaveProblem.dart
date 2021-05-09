import 'package:client/Presentation/screen/loginScreen.dart';
import 'package:client/config/signupRelativeDim.dart';
import 'package:client/logic/TodoLogic/TodoBloc/todo_bloc.dart';
import 'package:client/logic/userLoginLogic/userLoginBloc/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/Colors.dart';
import '../../../config/appRelativeDim.dart';
import '../drawer.dart';

class UserErrorAfterLoginScreen extends StatelessWidget {
  const UserErrorAfterLoginScreen(
      {Key key,
      this.message,
      this.imagePath,
      this.userDataRaw,
      this.messageTwo,
      this.token})
      : super(key: key);
  final String message;
  final String imagePath;
  final String messageTwo;
  final String token;
  final Map<String, dynamic> userDataRaw;

  @override
  Widget build(BuildContext context) {
    final appColors = TodoColors();
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.getBackGroundColor(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceSize.height *
            SingUpRleativeDimesions
                .getAppBarRelativeHight()), // here the desired height
        child: AppBar(
          title: Text(
            '${userDataRaw["userName"]} Todos',
            style: TextStyle(
              fontSize: deviceSize.height * 0.027765074802378,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
          centerTitle: true,
        ),
      ),
      drawer: BlocListener<UserloginBloc, UserloginState>(
        listenWhen: (prev, curr) {
          return prev.hashCode != curr.hashCode;
        },
        listener: (context, state) {
          if (state is UserLogoutLoadingScreen) {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  title: Text("Loggin you out"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Loging you out .."),
                      SizedBox(
                        height: deviceSize.height * 0.0123,
                      ),
                      CircularProgressIndicator(),
                    ],
                  )),
            );
          } else if (state is UserLogoutState) {
            Navigator.of(context).pop(context);
            Navigator.of(context)
                .pushReplacementNamed(TodoLoginScreen.PageRoute);
          }
        },
        child: TodoDrawerWidget(
          deviceSize: deviceSize,
          appColors: appColors,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          BlocProvider.of<TodoBloc>(context).add(GetTodos(token: token));
          return Future.value();
        },
        child: Container(
          height: deviceSize.height,
          alignment: Alignment.center,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: deviceSize.height * 0.2),
                child: Container(
                  alignment: Alignment.center,
                  width: deviceSize.width *
                      TodoApplicationRelativeDimensions
                          .splashScreenImageWidthRelativDim(),
                  height: deviceSize.height *
                      TodoApplicationRelativeDimensions
                          .splashScreenImageHeightReltiveDim(),
                  child: Image.asset(imagePath),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.0123,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: deviceSize.height * 0.021765074802378,
                    fontWeight: FontWeight.w600,
                    color: appColors.getPrimaryColor(),
                  ),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.0100,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  messageTwo,
                  style: TextStyle(
                    fontSize: deviceSize.height * 0.017765074802378,
                    color: appColors.getPrimaryColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
