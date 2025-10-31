import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/blockTest/block/AuthenticationBlock.dart';
import 'package:state_management/blockTest/event/AuthenticationEvent.dart';
import 'package:state_management/blockTest/keys/Keys.dart';
import 'package:state_management/blockTest/screen/home_screen.dart';
import 'package:state_management/blockTest/screen/login_screen.dart';
import 'package:state_management/blockTest/state/AuthenticationState.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var contactController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordVisibility = false;
  var visibilityIcon =  Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SignUp Screen",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 25
               ),
              ),
              SizedBox(height: 25),

              Container(
                margin: EdgeInsets.only(left: 5,right: 5),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          label: Text(
                            "Name",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          hintText: "Enter Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Name cannot be empty";
                        return null; // Don't forget to return null
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: contactController,
                      decoration: InputDecoration(
                          label: Text(
                            "Contact Number",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          hintText: "Enter Contact number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Contact number cannot be empty";
                        return null; // Don't forget to return null
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          label: Text(
                            "Email Id",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          hintText: "Enter Email Id",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Email Id cannot be empty";
                        return null; // Don't forget to return null
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          label: Text(
                            "Username",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          hintText: "Enter Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Username cannot be empty";
                        return null; // Don't forget to return null
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: passwordVisibility,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          hintText: "Enter Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  // --- Simplified toggle logic ---
                                  passwordVisibility = !passwordVisibility;
                                  visibilityIcon = passwordVisibility
                                      ? Icons.visibility_off
                                      : Icons.visibility;
                                });
                              },
                              icon: Icon(visibilityIcon))),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Password cannot be empty";
                        else if (value.length < 6)
                          return "Password length should be at least 6 characters";
                        return null; // Don't forget to return null
                      },
                    ),

                    SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: BlocConsumer<AuthenticationBlock,AuthenticationState>(builder: (context,state){
                        if(state is AuthenticationLoadingState){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(onPressed: (){

                          if(formKey.currentState!.validate()){
// Corrected syntax
                            context.read<AuthenticationBlock>().add(
                                SignupEvent(name: nameController.text,
                                    email: emailController.text,
                                    contact: contactController.text,
                                    username: usernameController.text,
                                    password: passwordController.text
                                )
                            );
                          }

                        }, child: Text("Signup",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
                        ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                          ),
                        );
                      }, listener: (context,state){
                        if(state is AuthenticationFailureState){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage))
                          );
                        }else if(state is AuthenticationSuccessState){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context){
                                return BlocProvider(create: (context)=> AuthenticationBlock(),
                                child: HomeScreen(),
                                  );
                                }
                              )
                          );
                        }
                      }),
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have and account?",
                        style:TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(onPressed: (){
                          Navigator.pushReplacementNamed(context, Keys.LOGIN_SCREEN_ROUTE);
                          Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context){
                            return BlocProvider(create: (context) => AuthenticationBlock(),
                            child: LoginScreen()
                                );
                              }
                            )
                          );
                        }, child: Text("Login",
                            style:TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ))
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: BlocProvider(
//       create: (context) => AuthenticationBlock(),
//       child: SignupScreen(),
//     ),
//   ));
// }