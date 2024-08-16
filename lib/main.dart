import 'package:chat_app/screens/Home_screen.dart';
import 'package:chat_app/screens/Login_screen.dart';
import 'package:chat_app/screens/Singup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
       '/home': (context) => const HomeScreen(),
      },
    );
  }
}
