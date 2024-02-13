import 'package:firebase_app/UiHelper.dart';
import 'package:firebase_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget{
  final String verificationId;
  const VerifyPage( {required this.verificationId});
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController otpController = TextEditingController();

  void verifyOtp()async{
    String otp = otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential.user != null){
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    }on FirebaseAuthException catch(ex){
      UiHelper.CustomAlertBox(context, ex.code.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Phone Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
            child: TextField(
              controller: otpController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                counterText: "",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide(
                        width: 2,
                      )

                  ),
                  hintText: "6-Digit OTP",
                  suffixIcon: Icon(Icons.pin),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23)
                  )
              ),
            ),
          ),
          UiHelper.CustomButton(() {
            verifyOtp();
          }, "Verify"),
        ],
      ),
    );
  }
}