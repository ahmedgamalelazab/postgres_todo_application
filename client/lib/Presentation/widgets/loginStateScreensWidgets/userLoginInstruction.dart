import 'package:client/config/Colors.dart';
import 'package:client/config/appRelativeDim.dart';
import 'package:flutter/material.dart';

class UserLoginInstructionScreen extends StatelessWidget {
  final String imagePath;
  const UserLoginInstructionScreen({Key key, this.imagePath, this.messages})
      : super(key: key);
  final List<String> messages;
  @override
  Widget build(BuildContext context) {
    final appColors = TodoColors();
    final deviceSize = MediaQuery.of(context).size;
    final formWidth = deviceSize.width * 0.8761908073152076;
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
            ...messages
                .map((message) => Instructions(
                      formWidth: formWidth,
                      deviceSize: deviceSize,
                      appColors: appColors,
                      message: message,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class Instructions extends StatelessWidget {
  const Instructions({
    Key key,
    @required this.formWidth,
    @required this.deviceSize,
    @required this.appColors,
    this.message,
  }) : super(key: key);

  final double formWidth;
  final Size deviceSize;
  final TodoColors appColors;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: formWidth,
      height: deviceSize.height * 0.115,
      child: Text(
        message,
        style: TextStyle(
          fontSize: deviceSize.height * 0.025765074802378,
          color: appColors.getPrimaryColor(),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
