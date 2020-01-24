import 'package:flutter/material.dart';
import 'package:simple/UserList.dart';
import 'package:simple/RegisterForm.dart';
import 'Home.dart';
import 'LoginForm.dart';
import 'logindatabase/LoginForm.dart';
import 'logindatabase/RegisterForm.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginForm(),
      routes: <String, WidgetBuilder>{
        // format penulisan:   '/namaRoute' : (BuildContext context) => HalamanYangInginDituju(),
        'home' : (BuildContext context) => MyHomePage(),
        'register' : (BuildContext context) => RegisterForm(),
        'login' : (BuildContext context) => LoginForm(),
        'userlist' : (BuildContext context) => UserList(),
        'logindatabase' : (BuildContext context) => LoginDatabase(),
        'registerdatabase' : (BuildContext context) => RegisterDatabase(),
      },
    );
  }
}