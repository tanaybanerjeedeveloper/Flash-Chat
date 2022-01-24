import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'messageBubble.dart';

class MessagesStream extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }
        var messages = snapshot.data.docs;
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messages
                .map((message) =>
                    // Text('${message['text']} from ${message['sender']}'),
                    MessageBubble(
                      text: message['text'],
                      sender: message['sender'],
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
