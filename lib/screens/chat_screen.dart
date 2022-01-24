import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';
// import '../widgets/messagesStream.dart';
import '../widgets/messageBubble.dart';

User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String _messageText;
  final _messageTextController = TextEditingController();
  // User loggedInUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          )
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessagesStream(),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageTextController,
                    onChanged: (value) {
                      _messageText = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      _messageTextController.clear();
                      if (_messageText != null || _messageText != '') {
                        _firestore.collection('messages').add({
                          'text': _messageText,
                          'sender': loggedInUser.email,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                      } else {
                        return;
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }
        var messages = snapshot.data.docs.reversed;

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messages.map((message) {
              final currentUser = loggedInUser.email;

              return MessageBubble(
                text: message['text'],
                sender: message['sender'],
                isMe: currentUser == message['sender'],
              );
            }
                // Text('${message['text']} from ${message['sender']}'),
                ).toList(),
          ),
        );
      },
    );
  }
}
