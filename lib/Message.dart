import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _userId;

  @override
  void initState() {
    super.initState();
    _userId = _auth.currentUser!.uid;
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('messages')
        .orderBy('timestamp')
        .get();

    setState(() {
      _messages.clear();
      for (var doc in querySnapshot.docs) {
        _messages.add(doc['message']);
      }
    });
  }

  Future<void> _sendMessage() async {
    if (_controller.text.trim().isNotEmpty) {
      String message = _controller.text.trim();


      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('messages')
          .add({
        'message': "You: $message",
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        _messages.add("You: $message");
        _controller.clear();
      });

      final url = Uri.parse('http://192.168.229.1:5000/predict');
      final body = json.encode({"text": message});

      try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: body,
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          String serverMessage = "SHA chatbot: ${responseData['response']}";


          await _firestore
              .collection('users')
              .doc(_userId)
              .collection('messages')
              .add({
            'message': serverMessage,
            'timestamp': FieldValue.serverTimestamp(),
          });

          setState(() {
            _messages.add(serverMessage);
          });
        } else {
          setState(() {
            _messages.add("Error: ${response.reasonPhrase}");
          });
        }
      } catch (e) {
        setState(() {
          _messages.add("Error: Failed to send message.");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text('Chat'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                reverse: false, // Messages load from top to bottom
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index].startsWith("You:");

                  return Align(
                    alignment:
                    isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blueAccent : Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        _messages[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        fillColor: Colors.white.withOpacity(0.7),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.blueAccent,
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
