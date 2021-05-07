import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splashscreen_state.dart';

Stream splashTime() async* {
  for (int i = 0; i < 2; i++) {
    print(i);
    yield i;
    await Future.delayed(Duration(seconds: 4));
  }
}

class SplashscreenCubit extends Cubit<SplashscreenState> {
  StreamSubscription splashTimeSubscribtion;
  SplashscreenCubit() : super(SplashscreenInitial()) {
    splashTimeSubscribtion = splashTime().listen((time) {
      switch (time) {
        case 0:
          return loadingSplashScreen();
          break;
        case 1:
          return loadedSplashScreen();
          break;
        default:
          return loadingSplashScreen();
          break;
      }
    });
  }

  void loadingSplashScreen() => emit(SplashScreenLoading());

  void loadedSplashScreen() => emit(SplashScreenLoaded());

  @override
  Future<void> close() {
    splashTimeSubscribtion.cancel();
    return super.close();
  }
}
