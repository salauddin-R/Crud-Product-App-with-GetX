import 'package:flutter/material.dart';
import'package:fluttertoast/fluttertoast.dart';

InputDecoration inputDecoration(text) {
  return InputDecoration(
    labelText: text,
    labelStyle: TextStyle(color: Colors.white),
    fillColor: Colors.grey,
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue,width: 2)
    ),
  );
}
SuccessMessege(msg){
  Fluttertoast.showToast(
      msg:msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 35, 65, 2),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
ErrorMessege(tmsg)
{
  Fluttertoast.showToast(
      msg: tmsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
