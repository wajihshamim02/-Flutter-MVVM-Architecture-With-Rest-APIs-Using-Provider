import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG);
  }

  static flushbarmessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.all(15),
          message: message,
          positionOffset: 8,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.red,
          titleColor: Colors.white,
          duration: Duration(seconds: 3),
          icon: Icon(Icons.error, color: Colors.white),
        )..show(context));
  }
  static snackbar(String message,BuildContext context){

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),)
    );
  }

  static fieldfocuschange(BuildContext context , FocusNode current,FocusNode nextfocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);

  }
}
