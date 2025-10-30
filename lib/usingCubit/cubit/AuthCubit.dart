import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/usingCubit/states/AuthState.dart';

class AuthCubit extends Cubit<AuthState>{

  AuthCubit():super(AuthInitialState());

  void login(String username, String password) async{

    emit(AuthLoadingState());

    await Future.delayed(Duration(seconds: 1));

    if(username == "kelaskaraditya1" && password=="Aditya@1234")
      emit(AuthSuccessState());
    else{
      if(username != "kelaskaraditya1")
        emit(AuthFailureState("Invalid Username"));
      else
        emit(AuthFailureState("Invalid Password"));
    }
  }
}