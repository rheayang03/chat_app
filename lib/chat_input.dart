import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');
    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text,
      id: '8',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(username: 'Elton Bernil'),
      imageUrl: ''
    );


    widget.onSubmit(newChatMessage);
    chatMessageController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {}, 
                      icon: Icon(Icons.add, 
                      color: Colors.white,
                      )
                    ),
                    
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        controller: chatMessageController,
                        textCapitalization: TextCapitalization.sentences,

                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: InputBorder.none,
                      ),
                    )),

                    IconButton(
                      onPressed: onSendButtonPressed, 
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                
                    ],
                ),
          
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          
                ),
              );
  }
}