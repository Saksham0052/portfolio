
import 'package:firebase_app/SignInWithPhone.dart';
import 'package:firebase_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'UiHelper.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void logIn()async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email == "" || password == ""){
      UiHelper.CustomAlertBox(context, "Enter the credentials");
    }
    else {
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
      } on FirebaseAuthException catch(ex){
        UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Login Page"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.email, false),
          UiHelper.CustomTextField(passwordController, "Password", Icons.password, true),
          UiHelper.CustomButton(() {
            logIn();
          }, "Login"),

          Column(
            children:  [Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont Have an Account??'),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                }, child: Text('Sign Up' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700 , fontStyle: FontStyle.italic, color: Colors.green),)),
              ],
            ),
              TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInWithPhone()));
                }, child: Text('Sign Up  With Phone' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 , fontStyle: FontStyle.italic , color: Colors.green))),

      ],
          )

        ],
      ),
    );
  }

}