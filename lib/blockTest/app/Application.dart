import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/blockTest/block/AuthenticationBlock.dart';
import 'package:state_management/blockTest/routes/Routes.dart';
import 'package:state_management/blockTest/screen/login_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.getStaticRoutes(),
      home:BlocProvider(create: (context) => AuthenticationBlock(),
      child: LoginScreen(),
      ),
    );
  }
}


void main(){
  runApp(Application());
}