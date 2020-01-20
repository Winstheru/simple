import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Home.dart';
import 'Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Routes(),
    );
  }
}