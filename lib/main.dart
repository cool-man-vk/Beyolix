import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swapn/screens/get-started.dart';
import './screens/homepage.dart';
import './screens/create_account.dart';
import './screens/landing_screen.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

