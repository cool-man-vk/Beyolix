import 'package:flutter/material.dart';
import 'package:swapn/screens/get-started.dart';
import './screens/homepage.dart';
import './screens/create_account.dart';
import './screens/landing_screen.dart';

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
        fontFamily: 'Lato',
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      home:HomePage(

      ),
      initialRoute: '/',
      routes: {
        CreateAccount.routeName:(context) => CreateAccount(),
        LandingScreen.routeName:(context) => LandingScreen(),
        GetStarted.routeName : (context) => GetStarted(),
      },
    );
  }
}

