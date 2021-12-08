import 'package:flutter/material.dart';
import 'data.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'animated list view',
      home: MyHomePage(title: 'Animated listview'),
    );
  }
}
