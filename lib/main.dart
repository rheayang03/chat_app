import 'package:flutter/material.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter_stateful_demo.dart';
import 'package:chat_app/util/brand_color.dart';
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
        ),
        home: LoginPage(),
        routes: {
          '/chat': (context) => ChatPage(),
        });
  }
}
