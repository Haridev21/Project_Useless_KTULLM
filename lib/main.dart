import 'package:chatbot/ForgetPass.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/LoginPage.dart';
import 'package:chatbot/SplashScreen.dart';
import 'package:chatbot/Message.dart';
import 'package:chatbot/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => MessagePage(),
        '/forget': (context) => ForgetPass(),
        '/_signup': (context) => Signup(),
      },
    );
  }
}
