import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/usingCubit/cubit/AuthCubit.dart';
import 'package:state_management/usingCubit/states/AuthState.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using Cubit"),
        backgroundColor: Colors.orange,
      ),
      body:BlocBuilder<AuthCubit,AuthState>(builder: (context, state){

        if(state is AuthLoadingState){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is AuthSuccessState){
          return Center(
            child: Text("Login Success",
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
            )
          );
        }

        else if(state is AuthFailureState){
          return Center(
            child: Text("Login Failed: ${state.errorMessage}",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.w500
              ),
            ),
          );
        }
        return SizedBox();

      }),
      bottomSheet: ElevatedButton(onPressed: (){
        BlocProvider.of<AuthCubit>(context).login("kelaskaraditya1", "Aditya@12345");
      }, child: Text("Login")
      ),
    );
  }
}
