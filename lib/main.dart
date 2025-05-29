import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter_stateful_demo.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Provider(
    create: (BuildContext context) => AuthService(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: Colors.deepPurple, 
        appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
    
      )),
      //
      home: LoginPage(),
      routes: {
        '/chat': (context) => ChatPage(
       
          ),


      }
    );
  }
}
