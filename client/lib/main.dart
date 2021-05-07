import 'package:client/Presentation/routers/generateRoutes.dart';
import 'package:client/Presentation/screen/SignupScreen.dart';
import 'package:client/Presentation/screen/SplashScreen.dart';
import 'package:client/config/Colors.dart';
import 'package:client/logic/splashScreenLogic/SplashScreenCubit/splashscreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //section of native code chekcer
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApplicationEntryPoint());
}

class MyApplicationEntryPoint extends StatelessWidget {
  const MyApplicationEntryPoint({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final applicationColors = TodoColors();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashscreenCubit()),
      ],
      child: MaterialApp(
        home: BlocBuilder<SplashscreenCubit, SplashscreenState>(
            builder: (context, state) {
          if (state is SplashScreenLoading) {
            return TodoSplashScreen();
          } else if (state is SplashScreenLoaded) {
            return TodoSignupScreen();
          }
          return TodoSignupScreen();
        }),
        onGenerateRoute: ApplicationRoutes.onGenerateRoutes,
        theme: ThemeData(
          primaryColor: applicationColors.getPrimaryColor(),
        ),
      ),
    );
  }
}
