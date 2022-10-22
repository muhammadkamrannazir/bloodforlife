// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String image;
  const MessageBubble({
    Key? key,
    required this.image,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                ),
              ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: isMe ? Colors.lightBlue : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(10) : Radius.circular(0),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
