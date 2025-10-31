import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/blockTest/event/AuthenticationEvent.dart';
import 'package:state_management/blockTest/state/AuthenticationState.dart';

class AuthenticationBlock extends Bloc<AuthenticationEvent,AuthenticationState>{

  AuthenticationBlock():super(AuthenticationInitialState()){

    on<LoginEvent>((event,emit) async {

      emit(AuthenticationLoadingState());

      await Future.delayed(Duration(seconds: 2));

      String username = event.username;
      String password = event.password;

      if(username.isNotEmpty && password.isNotEmpty){

        if(username == "kelaskaraditya1" && password=="Aditya@1234"){
          emit(AuthenticationSuccessState());
        }else{
          if(username != "kelaskaraditya1")
            emit(AuthenticationFailureState(errorMessage: "Username is incorrect"));
          else if(password != "Aditya@1234")
            emit(AuthenticationFailureState(errorMessage: "Password is incorrect"));
        }
      }else{
        if(username.isEmpty)
          emit(AuthenticationFailureState(errorMessage: "Username cannot be empty"));
        else if(password.isEmpty)
          emit(AuthenticationFailureState(errorMessage: "Password cannot be empty"));
      }

    });

    on<SignupEvent>((event,emit) async{
      
      emit(AuthenticationLoadingState());
      
      String name = event.name;
      String email = event.email;
      String contact = event.contact;
      String username = event.username;
      String password = event.password;
      
      await Future.delayed(Duration(seconds: 2));
      
      if(
        name.isNotEmpty &&
        email.isNotEmpty &&
          contact.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty 
      )
        emit(AuthenticationSuccessState());
      else
        emit(AuthenticationFailureState(errorMessage: "All fields are required"));

    });
    
  }
  
}