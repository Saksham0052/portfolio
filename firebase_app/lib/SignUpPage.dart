import 'dart:developer';

import 'package:firebase_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UiHelper.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void createAccount()async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = confirmPasswordController.text.trim();

    if(email == "" || password == "" || cPassword == ""){
      // print("Please fill all the details");
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
    }
    else if(password != cPassword){
      // print("Password do not match");
      UiHelper.CustomAlertBox(context, "Passwords do not match");
    }
    else{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        // print("User created");
        // UiHelper.CustomAlertBox(context, "User Created");
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } on FirebaseAuthException catch(ex){
        // print(ex.code.toString());
        UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Sign Up"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.email, false),
          UiHelper.CustomTextField(passwordController, "Password", Icons.password, true),
          UiHelper.CustomTextField(confirmPasswordController, "Confirm Password", Icons.password, true),
          UiHelper.CustomButton(() {
            createAccount();
          }, "Sign Up"),

        ],
      ),
    );
  }

}