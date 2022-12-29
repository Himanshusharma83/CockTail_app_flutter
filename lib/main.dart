import 'package:cocktail/HomePage.dart';
import 'package:flutter/material.dart';

var myColor = Colors.brown;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cock Tail App',
      theme: ThemeData(primarySwatch: myColor),
      home: HomePage(),
    );
  }
}
