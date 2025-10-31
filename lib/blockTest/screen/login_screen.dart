import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/blockTest/keys/Keys.dart';
import 'package:state_management/blockTest/screen/signup_screen.dart';
import 'package:state_management/blockTest/state/AuthenticationState.dart';
import 'package:state_management/blockTest/event/AuthenticationEvent.dart';
import 'package:state_management/blockTest/block/AuthenticationBlock.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordVisibility = true; // Changed to true
  var visibilityIcon = Icons.visibility_off; // Changed to match
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          // --- Wrapped in SingleChildScrollView to prevent overflow ---
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0), // Added padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Login Screen",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                ),
                Container(
                  // Removed margin, using padding on SingleChildScrollView
                  child: Column(
                    children: [
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

                      // --- 2. FIXED: Column doesn't have 'spacing'. Use SizedBox. ---
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

                      Container(
                        margin: EdgeInsets.only(top: 20, right: 10, left: 10), // Increased top margin
                        width: double.infinity,
                        // --- 3. BLOC CONSUMER IS FIXED ---
                        child: BlocConsumer<AuthenticationBlock, AuthenticationState>(
                          // --- LISTENER: Does actions (Nav, SnackBar) ---
                          listener: (context, state) {
                            if (state is AuthenticationSuccessState) {
                              Navigator.pushReplacementNamed(
                                  context, Keys.HOME_SCREEN_ROUTE);
                            } else if (state is AuthenticationFailureState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)),
                              );
                            }
                          },
                          // --- BUILDER: Returns a widget (UI) ---
                          builder: (context, state) {
                            // If loading, show spinner
                            if (state is AuthenticationLoadingState) {
                              return Center(child: CircularProgressIndicator());
                            }

                            // Otherwise, show the button
                            return ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // --- 4. FIXED: Dispatch the event to the BLoC ---
                                  context.read<AuthenticationBlock>().add(
                                    LoginEvent(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't have an account?",
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
                                      child: SignupScreen()
                                  );
                                }
                                )
                            );
                          }, child: Text("Signup",
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
      ),
    );
  }
}