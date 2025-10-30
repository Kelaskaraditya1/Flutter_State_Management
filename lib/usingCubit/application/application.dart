import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/usingBlock/block/AuthBlock.dart';
import 'package:state_management/usingCubit/cubit/AuthCubit.dart';
import 'package:state_management/usingCubit/screens/home_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => AuthCubit(),
        child: HomeScreen(),
      ),
    );
  }
}

void main() {
  runApp(Application());
}
