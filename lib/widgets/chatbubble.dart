import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: isSender ? Colors.teal[700] : Colors.grey[800],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isSender
                ? const Radius.circular(20)
                : const Radius.circular(0),
            bottomRight: isSender
                ? const Radius.circular(0)
                : const Radius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: isSender ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }
}
