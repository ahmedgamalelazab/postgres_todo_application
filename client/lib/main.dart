import 'package:client/Presentation/routers/generateRoutes.dart';
import 'package:client/Presentation/screen/SignupScreen.dart';
import 'package:client/Presentation/screen/SplashScreen.dart';
import 'package:client/Presentation/screen/todoScreen.dart';
import 'package:client/config/Colors.dart';
import 'package:client/data/dataProviders/userLoginApi.dart';
import 'package:client/data/repository/userLoginRepository.dart';
import 'package:client/data/repository/userRegisterRepository.dart';
import 'package:client/logic/splashScreenLogic/SplashScreenCubit/splashscreen_cubit.dart';
import 'package:client/logic/userLoginLogic/userLoginBloc/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/dataProviders/userRegisterationApi.dart';
import 'logic/userRegisterLogic/RegisterBloc/registeruserbloc_bloc.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              UserRegisterationProcessRepository(userApi: Register()),
        ),
        RepositoryProvider(
          create: (context) => LoginRepository(userLoginApi: Login()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashscreenCubit()),
          //FIXME
          BlocProvider(
            create: (context) => RegisteruserblocBloc(
              registerRepository:
                  RepositoryProvider.of<UserRegisterationProcessRepository>(
                      context),
            ),
          ),
          BlocProvider(
              create: (context) => UserloginBloc(
                  loginRepository:
                      RepositoryProvider.of<LoginRepository>(context))),
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
          routes: {
            TodoDataScreen.ScreenRoute: (context) => TodoDataScreen(),
          },
          onGenerateRoute: ApplicationRoutes.onGenerateRoutes,
          theme: ThemeData(
            primaryColor: applicationColors.getPrimaryColor(),
          ),
        ),
      ),
    );
  }
}
