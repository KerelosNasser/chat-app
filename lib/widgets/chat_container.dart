import 'package:flutter/material.dart';
import '../screens/Chat_screen.dart';

class ChatContainer extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final int senderId;
  final int receiverId;

  const ChatContainer({
    required this.userName,
    required this.lastMessage,
    required this.senderId,
    required this.receiverId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                senderId: senderId,
                receiverId: receiverId,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue,
                    child: Text(
                      userName[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                  title: Text(
                    userName,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  subtitle: Text(
                    lastMessage,
                    style: const TextStyle(fontSize: 18, color: Colors.white60),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
