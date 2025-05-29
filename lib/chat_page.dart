import 'dart:convert';

import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/chat_bubble.dart';
import 'package:chat_app/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ChatPage extends StatefulWidget {
   ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //Inialize the list of messages
   List<ChatMessageEntity> _messages = [];
  

  _loadInitialMessages() async{
    final response = await rootBundle.loadString('assets/mock_messages.json');
    
    final List <dynamic> decodeList = jsonDecode(response) as List;
    
    final List<ChatMessageEntity> _chatMessages = decodeList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }). toList();
        
    print(_chatMessages.length);
    
    //Finally, add the messages to the list
    setState(() {
      _messages = _chatMessages;
    });
  }

  onMessageSent(ChatMessageEntity entity) {
      _messages.add(entity);
      setState(() {});
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hii $userName!'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
                print('Icon Pressed');
              }, 
              icon: const Icon(Icons.logout)),

        ],
      ),

      body: Column(
        children: [
          Expanded(
           

            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {

              return ChatBubble(
              
                alignment: _messages[index].author.username == 'Elton Bernil'
                    ?Alignment.centerRight
                    : Alignment.centerLeft,
                    
                entity: _messages[index],);
            })),
            
        ChatInput(
          onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}