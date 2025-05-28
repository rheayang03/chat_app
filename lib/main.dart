import 'package:flutter/material.dart';
import 'package:chat_app/login_page.dart'; // Make sure this file exists

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: true,
      ),
      home:
          const LoginPage(), // Make sure LoginPage is a Stateless or Stateful widget
    );
  }
}
