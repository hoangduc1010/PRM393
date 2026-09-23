import 'package:flutter/material.dart';
import 'package:prm_project/UI/Screens/Lab_4.dart';
import 'package:prm_project/UI/Widgets/ProductWidget.dart';

void main() {
  runApp(MyApp());
}
//
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Lab4App(),
      debugShowCheckedModeBanner: false,
    );
  }
}

