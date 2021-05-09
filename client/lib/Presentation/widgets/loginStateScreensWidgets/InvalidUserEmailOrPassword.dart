import 'package:flutter/material.dart';

import '../../../config/Colors.dart';
import '../../../config/appRelativeDim.dart';

class InvalidNameOrPassword extends StatelessWidget {
  const InvalidNameOrPassword({Key key, this.message, this.imagePath})
      : super(key: key);
  final String message;
  final String imagePath;

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
              child: Image.asset(imagePath),
            ),
            SizedBox(
              height: deviceSize.height * 0.0123,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: deviceSize.height * 0.0123,
            ),
            Container(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: deviceSize.height * 0.027765074802378,
                  color: appColors.getPrimaryColor(),
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.0100,
            ),
            Container(
              child: Text(
                "Access Denied Redirecting you in Five Seconds To Login,",
                style: TextStyle(
                  fontSize: deviceSize.height * 0.017765074802378,
                  color: appColors.getPrimaryColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
