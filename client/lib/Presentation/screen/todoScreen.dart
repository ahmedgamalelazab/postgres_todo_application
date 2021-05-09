import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/Colors.dart';
import '../../config/signupRelativeDim.dart';
import '../../logic/TodoLogic/TodoBloc/todo_bloc.dart';
import '../../logic/userLoginLogic/userLoginBloc/userlogin_bloc.dart';
import '../widgets/drawer.dart';
import '../widgets/todoErrorsWidgets.dart/userTodosHaveProblem.dart';
import 'loginScreen.dart';

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
    // final formHeight = deviceSize.height * 0.4452276736133795;
    // final formWidth = deviceSize.width * 0.8761908073152076;

    return BlocConsumer<TodoBloc, TodoState>(builder: (context, state) {
      //!FIXME
      if (state is TodoLoading) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is TodoUserTokenExpiredError) {
        return UserErrorAfterLoginScreen(
          imagePath: "assets/images/EmptyTodoImage.png",
          message: "Your Token Expired ",
          userDataRaw: userDataRaw,
          messageTwo: "Pleas relogin again to start new session",
          token: userDataRaw["token"],
        );
      } else if (state is TodoUserHaveToVerifyError) {
        return UserErrorAfterLoginScreen(
          imagePath: "assets/images/nullVerified.png",
          message: state.message,
          userDataRaw: userDataRaw,
          messageTwo:
              "you have 5 days , if no verifying, moderator will delete this account",
          token: userDataRaw["token"],
        );
      } else if (state is NotodoFound) {
        return UserErrorAfterLoginScreen(
          imagePath: "assets/images/EmptyTodoImage.png",
          message: "New User .. ? Dont Worry !",
          userDataRaw: userDataRaw,
          messageTwo: "Follow the Plus Button to insert your first Todo",
          token: userDataRaw["token"],
        );
      } else if (state is LoadedTodo) {
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
              BlocProvider.of<TodoBloc>(context)
                  .add(GetTodos(token: userDataRaw["token"]));
              return Future.value();
            },
            child: ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(state.todos[index].describtion),
                ),
              ),
            ),
          ),
        );
      }
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
    }, listener: (context, state) {
      if (state is TodoExpiredTokenLoadingScreen) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Expired session"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Loging you out .."),
                SizedBox(
                  height: deviceSize.height * 0.0123,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      }
      if (state is TodoExpiredTokenRelogin) {
        Navigator.of(context).pop(context);
        Navigator.of(context).pushReplacementNamed(TodoLoginScreen.PageRoute);
      }
    });
  }
}
