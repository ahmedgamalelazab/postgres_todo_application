import 'package:client/config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/userLoginLogic/userLoginBloc/userlogin_bloc.dart';

class TodoDrawerWidget extends StatelessWidget {
  const TodoDrawerWidget({
    Key key,
    this.deviceSize,
    this.appColors,
  }) : super(key: key);

  final Size deviceSize;
  final TodoColors appColors;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: deviceSize.width * 0.035),
            height: AppBar().preferredSize.height,
            child: Text('Settings',
                style: TextStyle(
                  fontSize: deviceSize.height * 0.027765074802378,
                  fontWeight: FontWeight.w500,
                  color: appColors.getIconsColor(),
                )),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            onTap: () {
              BlocProvider.of<UserloginBloc>(context).add(UserLogoutEvent());
            },
            title: Text(
              "Log out",
              style: TextStyle(fontSize: deviceSize.height * 0.021765074802378),
            ),
            trailing: Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
