import 'package:flutter/cupertino.dart';
import 'package:state_management/blockTest/keys/Keys.dart';
import 'package:state_management/blockTest/screen/home_screen.dart';
import 'package:state_management/blockTest/screen/login_screen.dart';
import 'package:state_management/blockTest/screen/signup_screen.dart';

class Routes{

  static Map<String,WidgetBuilder> getStaticRoutes(){
    return {
      Keys.LOGIN_SCREEN_ROUTE: (context) => LoginScreen(),
      Keys.SIGNUP_SCREEN_ROUTE : (context) => SignupScreen(),
      Keys.HOME_SCREEN_ROUTE: (context) => HomeScreen()
    };
  }
}