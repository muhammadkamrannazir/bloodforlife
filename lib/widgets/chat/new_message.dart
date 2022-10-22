// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enterMessage = '';
  void _sendMessage() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    FocusScope.of(context).unfocus();
    await FirebaseFirestore.instance.collection('chat').add(
      {
        'text': _enterMessage,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'image_url': userData['image_url'],
      },
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      // color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  // prefixIcon: Icon(
                  //   Icons.emoji_emotions,
                  //   color: Colors.white,
                  // ),
                  // suffixIcon: Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Icon(
                  //       Icons.attachment,
                  //       color: Colors.white,
                  //     ),
                  //     SizedBox(width: 12),
                  //     Icon(
                  //       Icons.camera_alt_rounded,
                  //       color: Colors.white,
                  //     ),
                  //     SizedBox(width: 10),
                  //   ],
                  // ),
                  labelText: 'Message',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Color(0xffebebeb),
                ),
                onChanged: (value) {
                  setState(() {
                    _enterMessage = value;
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
              ),
              color: Theme.of(context).primaryColor,
              onPressed: _enterMessage.trim().isEmpty ? null : _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
