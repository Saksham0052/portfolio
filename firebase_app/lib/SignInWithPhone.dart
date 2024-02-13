import 'package:firebase_app/UiHelper.dart';
import 'package:firebase_app/VerifyPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInWithPhone extends StatefulWidget{
  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  TextEditingController phoneController = TextEditingController();

  void sendOtp()async{
    String phone =  "+91" + phoneController.text.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:  phone,
      codeSent: (verificationId , resendToken) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyPage(
          verificationId: verificationId,
        )));
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        UiHelper.CustomAlertBox(context, ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {
        timeout: Duration(seconds:  30);
      }
    );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.greenAccent,
        title: Text('Sign In With Phone'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField2(phoneController, "Phone Number", Icons.phone, false),

          UiHelper.CustomButton(() {
            sendOtp();
          }, "Sign In"),
        ],
      ),
    );
  }
}