import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/usingBlock/block/AuthBlock.dart';
import 'package:state_management/usingBlock/event/AuthEvent.dart';
import 'package:state_management/usingBlock/state/AuthState.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Block Management"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: BlocBuilder<AuthBlock,AuthState>(builder: (context,state){
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

        }),
      ),
      bottomSheet: ElevatedButton(onPressed: (){
        // context.read<AuthBlock>().add(LoginEvent("kelaskaraditya1", "Aditya@1234"));
        BlocProvider.of<AuthBlock>(context).add(LoginEvent("kelaskaraditya1", "Aditya@1234"));
      }, child: Text("Login",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          )
        ),
      ),
    );
  }
}
