import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Presentation/routers/generateRoutes.dart';
import 'Presentation/screen/SignupScreen.dart';
import 'Presentation/screen/SplashScreen.dart';
import 'Presentation/screen/todoScreen.dart';
import 'config/Colors.dart';
import 'data/dataProviders/todoApi.dart';
import 'data/dataProviders/userLoginApi.dart';
import 'data/dataProviders/userRegisterationApi.dart';
import 'data/repository/todoRepository.dart';
import 'data/repository/userLoginRepository.dart';
import 'data/repository/userRegisterRepository.dart';
import 'logic/TodoLogic/TodoBloc/todo_bloc.dart';
import 'logic/splashScreenLogic/SplashScreenCubit/splashscreen_cubit.dart';
import 'logic/userLoginLogic/userLoginBloc/userlogin_bloc.dart';
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
        RepositoryProvider(
          create: (context) => TodoRepository(todoApi: Todo()),
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
                    RepositoryProvider.of<LoginRepository>(context)),
          ),
          BlocProvider(
            create: (context) => TodoBloc(
                todoRepository: RepositoryProvider.of<TodoRepository>(context)),
          ),
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
