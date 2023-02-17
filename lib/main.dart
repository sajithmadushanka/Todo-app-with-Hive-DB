

import 'package:flutter/material.dart';
import 'package:todoapp/Screens/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async{
  //init hive
   await Hive.initFlutter();

   // open box
var box = await Hive.openBox('MyBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
