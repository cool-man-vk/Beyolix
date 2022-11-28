import 'package:flutter/material.dart';
import './screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const Color.fromARGB(255, 0, 134, 245) as MaterialColor,
      ),
      home:HomePage(
        
      ),
    );
  }
}

