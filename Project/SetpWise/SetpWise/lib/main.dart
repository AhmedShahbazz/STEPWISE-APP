import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'termofservices.dart';
import 'PrivacyPolicy.dart';
import 'navigation.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id : (context) => SplashScreen(),
        home.id : (context) => home(),
        login.id : (context) => login(),
        signup.id : (context) => signup(),
        term.id : (context) => term(),
        PrivacyPolicy.id : (context) => PrivacyPolicy(),
        navigation.id : (context) => navigation(),






      },

    );
  }
}

