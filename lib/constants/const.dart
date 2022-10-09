import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

var baseURL =
    "https://phonevalidation.abstractapi.com/v1/?api_key=4a0a78a73de54e3d9c7a4bb61f03eda6&phone=";

showToast(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0);
}
