import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/blockTest/block/AuthenticationBlock.dart';
import 'package:state_management/blockTest/keys/Keys.dart';
import 'package:state_management/blockTest/screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HomeScreen",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: (){

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return BlocProvider(create: (context) => AuthenticationBlock(),
                child: LoginScreen(),
                      );
                  }
                )
              );

              }, child: Text("Logout")
            )
          ],
        ),
      ),
    );
  }
}
