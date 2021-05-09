import 'package:client/Presentation/screen/loginScreen.dart';
import 'package:client/Presentation/widgets/drawer.dart';
import 'package:client/config/Colors.dart';
import 'package:client/config/signupRelativeDim.dart';
import 'package:client/logic/userLoginLogic/userLoginBloc/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
   userDataRaw["token"],
         
   userDataRaw["userEmail"],

  userDataRaw["userName"],
*/

class TodoDataScreen extends StatelessWidget {
  static const String ScreenRoute = "/TodoDataScreen";
  const TodoDataScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDataRaw =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final appColors = TodoColors();
    final deviceSize = MediaQuery.of(context).size;
    final formHeight = deviceSize.height * 0.4452276736133795;
    final formWidth = deviceSize.width * 0.8761908073152076;

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
      body: Center(
        child: Text('hello : ${userDataRaw["userName"]}'),
      ),
    );
  }
}
