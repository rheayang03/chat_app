import 'package:flutter/material.dart';
import 'package:chat_app/chat_bubble.dart';
import 'package:chat_app/chat_input.dart';

class ChatPage extends StatelessWidget {
  final String userName;
  const ChatPage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hii $userName!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                print('Icon Pressed');
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: 'Hi, this is Elton!');
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
