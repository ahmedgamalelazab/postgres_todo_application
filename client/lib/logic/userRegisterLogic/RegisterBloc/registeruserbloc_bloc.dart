import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/data/Models/userRegister.dart';
import 'package:client/data/repository/userRegisterRepository.dart';
import 'package:meta/meta.dart';

part 'registeruserbloc_event.dart';
part 'registeruserbloc_state.dart';

class RegisteruserblocBloc
    extends Bloc<RegisteruserblocEvent, RegisteruserblocState> {
  final UserRegisterationProcessRepository registerRepository;
  RegisteruserblocBloc({this.registerRepository})
      : super(RegisteruserblocInitial());

  @override
  Stream<RegisteruserblocState> mapEventToState(
    RegisteruserblocEvent event,
  ) async* {
    if (event is RegisterUserEvenet) {
      yield LoadingScreen();
      await Future.delayed(Duration(seconds: 3));
      yield LoadingVerifyHints();
      await Future.delayed(Duration(seconds: 5));
      try {
        UserRegisterationProcessModel dataRaw =
            await registerRepository.getRegisterRawData(event.formBody);
        if (dataRaw.success == true || dataRaw.user != null) {
          print(dataRaw.token);
          yield LoadedUserInfo(dataRaw);
        } else {
          yield LoadedUserFailed(errorMessage: dataRaw.errorMessage);
          await Future.delayed(Duration(seconds: 5));
          yield LoadRegisterScreenAgain();
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
