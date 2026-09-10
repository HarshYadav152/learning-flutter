import 'package:flutter/material.dart';
import 'package:learningflutter/LayoutWidget.dart';
import 'package:learningflutter/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LayoutWidget()
    );
  }
}
