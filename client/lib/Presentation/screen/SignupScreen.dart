import 'package:client/Presentation/screen/loginScreen.dart';
import 'package:client/Presentation/screen/todoScreen.dart';
import 'package:client/config/Colors.dart';
import 'package:client/config/appRelativeDim.dart';
import 'package:client/config/signupRelativeDim.dart';
import 'package:client/logic/TodoLogic/TodoBloc/todo_bloc.dart';
import 'package:client/logic/userRegisterLogic/RegisterBloc/registeruserbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TodoSignupScreen extends StatelessWidget {
  static const String PageRoute = "/SignUpScreen";
  TodoSignupScreen({Key key}) : super(key: key);

  Map<String, dynamic> registerData = {
    "userName": "",
    "userEmail": "",
    "userPassword": "",
    "userConfirmPassword": ""
  };

  //form key

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TodoColors appColors = TodoColors();
    final deviceSize = MediaQuery.of(context).size;
    final formHeight = deviceSize.height * 0.4452276736133795;
    final formWidth = deviceSize.width * 0.8761908073152076;
    return BlocConsumer<RegisteruserblocBloc, RegisteruserblocState>(
        builder: (context, state) {
      if (state is LoadedUserFailed) {
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
                  child: Image.asset("assets/images/accessDenied.png"),
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
                    state.errorMessage,
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
      } else if (state is LoadingScreen) {
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
                  child: Image.asset("assets/images/registering.png"),
                ),
                SizedBox(
                  height: deviceSize.height * 0.0123,
                ),
                CircularProgressIndicator(),
                SizedBox(
                  height: deviceSize.height * 0.0123,
                ),
                Container(
                  child: Text("Registering...",
                      style: TextStyle(
                        fontSize: deviceSize.height * 0.027765074802378,
                        color: appColors.getPrimaryColor(),
                      )),
                ),
              ],
            ),
          ),
        );
      } else if (state is LoadingVerifyHints) {
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
                  child: Image.asset("assets/images/verify.png"),
                ),
                SizedBox(
                  height: deviceSize.height * 0.0123,
                ),
                CircularProgressIndicator(),
                SizedBox(
                  height: deviceSize.height * 0.0123,
                ),
                Container(
                  child: Text("Verify Your Account to Enjoy The Service...",
                      style: TextStyle(
                        fontSize: deviceSize.height * 0.027765074802378,
                        color: appColors.getPrimaryColor(),
                      )),
                ),
                SizedBox(
                  height: deviceSize.height * 0.0123,
                ),
                Container(
                  child: Text(
                      "Withour verifying your account you won't be able to use the service!",
                      style: TextStyle(
                        fontSize: deviceSize.height * 0.017765074802378,
                        color: appColors.getPrimaryColor(),
                      )),
                ),
              ],
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
                        key: formKey,
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
                                        //!FIXME full name resides here
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
                                          onSaved: (value) {
                                            registerData["userName"] = value;
                                          },
                                        ),
                                      ),
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
                                        //!FIXME EMAIL INPUT RESIDES HERE
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
                                          onSaved: (value) {
                                            registerData["userEmail"] = value;
                                          },
                                        ),
                                      ),
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
                                          onSaved: (value) {
                                            registerData["userPassword"] =
                                                value;
                                          },
                                        ),
                                      ),
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
                                        //!FIXME confirm password resides here
                                        child: TextFormField(
                                          onSaved: (value) {
                                            registerData[
                                                "userConfirmPassword"] = value;
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 0,
                                                        color: Colors
                                                            .transparent)),
                                          ),
                                          obscureText: true,
                                          style: TextStyle(
                                              color:
                                                  appColors.getMainFontsColor(),
                                              fontWeight: FontWeight.w800,
                                              fontSize: deviceSize.height *
                                                  0.0195988763310904),
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
                    ),
                    Positioned(
                      top: deviceSize.height * 0.5979950349513295,
                      child: BlocBuilder<RegisteruserblocBloc,
                          RegisteruserblocState>(
                        builder: (context, state) {
                          return Builder(
                            builder: (context) {
                              return Material(
                                color: appColors.getPrimaryColor(),
                                child: InkWell(
                                  splashColor: appColors.getSecondartColor(),
                                  onTap: () {
                                    formKey.currentState.validate();
                                    formKey.currentState.save();
                                    if (registerData["userPassword"]
                                            .toString() !=
                                        registerData["userConfirmPassword"]
                                            .toString()) {
                                      print("error");
                                      //!FIXME validation error
                                      showBottomSheet<void>(
                                          context: context,
                                          builder: (_) {
                                            return ValidationErrorBottomSheet(
                                              deviceSize: deviceSize,
                                              appColors: appColors,
                                              message: "Password Not Match",
                                              imagePath:
                                                  "assets/images/error.png",
                                            );
                                          });
                                      return;
                                    }
                                    //IF VALIDE DATA
                                    print(registerData);
                                    //fireeeeeeeeeeeeeeee
                                    BlocProvider.of<RegisteruserblocBloc>(
                                            context)
                                        .add(RegisterUserEvenet(
                                            formBody: registerData));
                                  },
                                  child: Container(
                                    width: formWidth,
                                    height:
                                        deviceSize.height * 0.060413536290586,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: deviceSize.height *
                                          0.0595988763310904,
                                      color: appColors.getIconsColor(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
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
                            Navigator.of(context).pushReplacementNamed(
                                TodoLoginScreen.PageRoute);
                          },
                          child: Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize:
                                    deviceSize.height * 0.0195988763310904,
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
    }, listener: (context, state) {
      if (state is LoadedUserInfo) {
        BlocProvider.of<TodoBloc>(context)
            .add(GetTodos(token: state.dataRaw.token));
        print(state.dataRaw.success);
        print(state.dataRaw.user.userEmail);
        Navigator.of(context)
            .pushReplacementNamed(TodoDataScreen.ScreenRoute, arguments: {
          "token": state.dataRaw.token,
          "userEmail": state.dataRaw.user.userEmail,
          "userName": state.dataRaw.user.userName
        });
      } else if (state is LoadRegisterScreenAgain) {
        Navigator.of(context).pushReplacementNamed(TodoLoginScreen.PageRoute);
      }
    });
  }
}

class ValidationErrorBottomSheet extends StatelessWidget {
  const ValidationErrorBottomSheet({
    Key key,
    @required this.deviceSize,
    @required this.appColors,
    this.message,
    this.imagePath,
  }) : super(key: key);

  final Size deviceSize;
  final TodoColors appColors;
  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceSize.width,
      height: deviceSize.height * 0.6,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: deviceSize.width,
            height: deviceSize.height *
                SingUpRleativeDimesions.getAppBarRelativeHight(),
            color: appColors.getPrimaryColor(),
            child: Text(
              "Sign up error",
              style: TextStyle(
                color: appColors.getIconsColor(),
                fontSize: deviceSize.height * 0.0354,
              ),
            ),
          ),
          SizedBox(
            height: deviceSize.height * 0.0123,
          ),
          Container(
            height: deviceSize.height * 0.3,
            width: deviceSize.width * 0.3,
            child: Image.asset(imagePath),
          ),
          SizedBox(
            height: deviceSize.height * 0.0123,
          ),
          Container(
            child: Text(message),
          ),
          SizedBox(
            height: deviceSize.height * 0.0123,
          ),
          MaterialButton(
            color: appColors.getPrimaryColor(),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: Text(
              "back To Form",
              style: TextStyle(
                color: appColors.getIconsColor(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
