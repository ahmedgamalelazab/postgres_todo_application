import 'package:client/config/Colors.dart';
import 'package:client/config/appRelativeDim.dart';
import 'package:flutter/material.dart';

class UserLoginLoadingScreen extends StatelessWidget {
  const UserLoginLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = TodoColors();
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.getBackGroundColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: deviceSize.width *
                  TodoApplicationRelativeDimensions
                      .splashScreenImageWidthRelativDim(),
              height: deviceSize.height *
                  TodoApplicationRelativeDimensions
                      .splashScreenImageHeightReltiveDim(),
              child: Image.asset("assets/images/Login.png"),
            ),
            SizedBox(
              height: deviceSize.height * 0.0123,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: deviceSize.height * 0.0123,
            ),
            Container(
              child: Text("Login you in ...",
                  style: TextStyle(
                    fontSize: deviceSize.height * 0.027765074802378,
                    color: appColors.getPrimaryColor(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
