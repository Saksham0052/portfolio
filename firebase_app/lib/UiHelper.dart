import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller , String text , IconData iconData , bool toHide , ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(
                  width: 2,
                )

            ),
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23)
            )
        ),
      ),
    );
  }
  static CustomButton(VoidCallback voidCallback , String text){
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(onPressed: (){
        voidCallback();
      }, child: Text(text , style: TextStyle(color: Colors.white , fontSize: 20),),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent
        ),

      ),
    );
  }
  static CustomAlertBox(BuildContext context , String text){
    return showDialog(context: context , builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
      }, child: Text('OK')),
        ],
      );
    });
  }
  static CustomTextField2(TextEditingController controller , String text , IconData iconData , bool toHide , ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        obscureText: toHide,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(
                  width: 2,
                )

            ),
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23)
            )
        ),
      ),
    );
  }

}