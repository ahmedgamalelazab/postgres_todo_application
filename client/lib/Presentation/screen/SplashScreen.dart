import 'package:client/config/Colors.dart';
import 'package:client/config/appRelativeDim.dart';
import 'package:flutter/material.dart';

class TodoSplashScreen extends StatelessWidget {
  static const String ScreenRoute = "/SplashScreen";
  const TodoSplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final TodoColors appColors = TodoColors();
    print(deviceSize.width);
    return Scaffold(
      backgroundColor: appColors.getBackGroundColor(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: deviceSize.width *
                TodoApplicationRelativeDimensions
                    .splashScreenImageWidthRelativDim(),
            height: deviceSize.height *
                TodoApplicationRelativeDimensions
                    .splashScreenImageHeightReltiveDim(),
            child: Image.asset("assets/images/splashScreenImage.png"),
          ),
          SizedBox(
            height: deviceSize.height *
                TodoApplicationRelativeDimensions
                    .splashScreenImageTextSeperatorRelativeHeightDim(),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "PSQL TODO APP",
              style: TextStyle(
                color: appColors.getMainFontsColor(),
                fontWeight: FontWeight.w900,
                fontSize: deviceSize.height *
                    TodoApplicationRelativeDimensions
                        .splashScreenFontSizeRelativeDim(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
