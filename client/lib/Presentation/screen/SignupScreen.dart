import 'package:client/Presentation/screen/loginScreen.dart';
import 'package:client/config/Colors.dart';
import 'package:client/config/signupRelativeDim.dart';
import 'package:flutter/material.dart';

class TodoSignupScreen extends StatelessWidget {
  static const String PageRoute = "/SignUpScreen";
  const TodoSignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoColors appColors = TodoColors();
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
              "SIGNUP",
              style: TextStyle(
                fontSize: deviceSize.height * 0.027765074802378,
                fontWeight: FontWeight.w900,
              ),
            ),
            centerTitle: true,
          )),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: deviceSize.height * 0.1188541190305089),
                    height: formHeight,
                    width: deviceSize.width * 0.8761908073152076,
                    // color: Color(0xfff2f2f2),
                    //!userForm
                    child: Form(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: formHeight * 0.042999999999999),
                            height: formHeight * 0.2069920244638208,
                            // color: Colors.purple,
                            child: Column(
                              children: [
                                Container(
                                  height: formHeight * 0.059999999999999,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Full Name",
                                      style: TextStyle(
                                        color: appColors.getMainFontsColor(),
                                        fontSize: deviceSize.height *
                                            0.0195988763310904,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: formHeight * 0.029999999999999),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                formHeight * 0.042999999999999,
                                            right:
                                                formHeight * 0.042999999999999,
                                            bottom:
                                                formHeight * 0.012999999999999),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                appColors.getSecondartColor(),
                                            width: 1.00,
                                          ),
                                        ),
                                        // color: Colors.white,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                              color:
                                                  appColors.getMainFontsColor(),
                                              fontWeight: FontWeight.w600,
                                              fontSize: deviceSize.height *
                                                  0.0195988763310904),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: formHeight * 0.042999999999999),
                            height: formHeight * 0.2069920244638208,
                            // color: Colors.purple,
                            child: Column(
                              children: [
                                Container(
                                  height: formHeight * 0.059999999999999,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                        color: appColors.getMainFontsColor(),
                                        fontSize: deviceSize.height *
                                            0.0195988763310904,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: formHeight * 0.029999999999999),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                formHeight * 0.042999999999999,
                                            right:
                                                formHeight * 0.042999999999999,
                                            bottom:
                                                formHeight * 0.012999999999999),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                appColors.getSecondartColor(),
                                            width: 1.00,
                                          ),
                                        ),
                                        // color: Colors.white,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                              color:
                                                  appColors.getMainFontsColor(),
                                              fontWeight: FontWeight.w600,
                                              fontSize: deviceSize.height *
                                                  0.0195988763310904),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: formHeight * 0.042999999999999),
                            height: formHeight * 0.2069920244638208,
                            // color: Colors.purple,
                            child: Column(
                              children: [
                                Container(
                                  height: formHeight * 0.059999999999999,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                        color: appColors.getMainFontsColor(),
                                        fontSize: deviceSize.height *
                                            0.0195988763310904,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: formHeight * 0.029999999999999),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                formHeight * 0.042999999999999,
                                            right:
                                                formHeight * 0.042999999999999,
                                            bottom:
                                                formHeight * 0.012999999999999),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                appColors.getSecondartColor(),
                                            width: 1.00,
                                          ),
                                        ),
                                        // color: Colors.white,
                                        child: TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                              color:
                                                  appColors.getMainFontsColor(),
                                              fontWeight: FontWeight.w800,
                                              fontSize: deviceSize.height *
                                                  0.0195988763310904),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: formHeight * 0.042999999999999),
                            height: formHeight * 0.2069920244638208,
                            // color: Colors.purple,
                            child: Column(
                              children: [
                                Container(
                                  height: formHeight * 0.059999999999999,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Confirm Password",
                                      style: TextStyle(
                                        color: appColors.getMainFontsColor(),
                                        fontSize: deviceSize.height *
                                            0.0195988763310904,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: formHeight * 0.029999999999999),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                formHeight * 0.042999999999999,
                                            right:
                                                formHeight * 0.042999999999999,
                                            bottom:
                                                formHeight * 0.012999999999999),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                appColors.getSecondartColor(),
                                            width: 1.00,
                                          ),
                                        ),
                                        // color: Colors.white,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          obscureText: true,
                                          style: TextStyle(
                                              color:
                                                  appColors.getMainFontsColor(),
                                              fontWeight: FontWeight.w800,
                                              fontSize: deviceSize.height *
                                                  0.0195988763310904),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: deviceSize.height * 0.5979950349513295,
                    child: Material(
                      color: appColors.getPrimaryColor(),
                      child: InkWell(
                        splashColor: appColors.getSecondartColor(),
                        onTap: () {
                          print("call backend to register the user");
                        },
                        child: Container(
                          width: formWidth,
                          height: deviceSize.height * 0.060413536290586,
                          child: Icon(
                            Icons.arrow_forward,
                            size: deviceSize.height * 0.0595988763310904,
                            color: appColors.getIconsColor(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: deviceSize.height * 0.6979950349513295,
                    child: Container(
                      alignment: Alignment.center,
                      width: formWidth,
                      height: deviceSize.height * 0.060413536290586,
                      // color: appColors.getMainFontsColor(),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(TodoLoginScreen.PageRoute);
                        },
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: deviceSize.height * 0.0195988763310904,
                              color: appColors.getSecondartColor(),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      color: appColors.getSecondartColor(),
                      height: deviceSize.height * 0.070490625204155,
                      width: deviceSize.width,
                      child: Text(
                        "Todo PSQL APP",
                        style: TextStyle(
                          fontSize: deviceSize.height * 0.0195988763310904,
                          color: appColors.getMainFontsColor(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
