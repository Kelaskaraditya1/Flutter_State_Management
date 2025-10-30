import 'package:flutter/cupertino.dart';
import 'package:state_management/usingBlock/application/application.dart';

void main(){
  runApp(Application());
}
/* Block: used for State Management in Flutter
*
* use the dependency flutter_bloc, flutter add pub flutter_bloc.
*
* It's a logical component, like it can be applied to Feature which has cases, foreg: in Authentication, Login State
* initially we can show a loading state, than whether login is success or failure we can show the respective state, like success or failure state.
*
* There are 3 main parts to the bloc, event, state and bloc.
*
* - Event: It is an action that triggers a change in the state. For example, in an authentication bloc, events could include LoginEvent, LogoutEvent, etc.
*
* for building state:
*
* 1) create a abstract class which acts as a parent to child classes, like AuthenticationEvent which is extended by LoginEvent, signupEvent .
* 2) create the child classes with the required parameters, and extend with the parent class.
*
* for eg:
* abstract class AuthEvent() {}
*
* class LoginEvent extends AuthEvent{
* String username;
* String password;
* }
*
* - State: It represents the current status of the application. States could include AuthInitialState, AuthLoadingState, AuthSuccessState, AuthFailureState, etc.
*
* for building state:
*
* 1) create a abstract class which acts as a parent to child classes, like AuthenticationState which is extended by AuthInitialState, AuthLoadingState, AuthSuccessState, AuthFailureState.
* 2) create the child classes with the required parameters, and extend with the parent class, also add some message coming with the state, if necessary.
*
* for eg:
*
* abstract class AuthenticationStae {}
*
* class InitialState extends AuthenticationState {}
* class LoadingState extends AuthenticationState {}
* class SuccessState extends AuthenticationState {}
* class FailureState extends AuthenticationState {
*  String errorMessage;
* FailureState(this.errorMessage);
* }
*
*
* Block: It is the core component that manages the flow of events and states. It listens for incoming events, processes them, and emits new states based on the logic defined within it.
* bloc combines both Event and State.
*
* for building bloc:
*
* 1) create a class Block and extend with Block<Event, State>
* 2) create a constructor call and call the super call and pass the initial state in it.
* 3) inside the constructor call use the on<Event> method to register a particular event.
* 4) inside the on<Event> method, define the logic to process the event and emit new states using the emit function.
*
* for eg:
*
* class AuthBlock extends Bloc<AuthEvent, AuthState> {

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
*
* for connecting Block with a particular screen we use BlockProvider.
*
* BlocProvider(create: (context) => AuthBlock(),
        child: HomeScreen(),
      )
*
* for using in UI: use BlocBuilder which accepts Block and State and gives a function with context and state.
* than on the basis of state we can show the respective UI.
*
*  BlocBuilder<AuthBlock,AuthState>(builder: (context,state){
          if(state is AuthLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is AuthSuccessState){
            return Center(
              child: Text("Login Successfully"),
            );
          }else if(state is AuthFailureState){
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return SizedBox();

          }
        )
*
* and to trigger an event we can use context.read<Block>().add(Event()) or BlocProvider.of<Block>(context).add(Event())
*
*
*
* */