import 'package:flutter/material.dart';
import 'package:flutterlazyloading/pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lazy Loaing....",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
