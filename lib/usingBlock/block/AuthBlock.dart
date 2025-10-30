import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/usingBlock/event/AuthEvent.dart';
import 'package:state_management/usingBlock/state/AuthState.dart';

class AuthBlock extends Bloc<AuthEvent, AuthState> {

  AuthBlock() : super(AuthInitialState()) {

    on<LoginEvent>((event, emit) async {

      emit(AuthLoadingState());

      await Future.delayed(Duration(seconds: 2));

      String username = event.username;
      String password = event.password;

      if (username == "kelaskaraditya1" && password == "Aditya@1234") {
        emit(AuthSuccessState());
      } else {
        emit(AuthFailureState("Invalid Username or Password"));
      }
    });
  }
}