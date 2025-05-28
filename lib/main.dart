import 'package:flutter/material.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter_stateful_demo.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat App!',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: LoginPage(),
        routes: {
          '/chat': (context) => ChatPage(),
        });
  }
}
