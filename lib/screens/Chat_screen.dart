import 'package:flutter/material.dart';
import '../services/messege_services.dart';
import '../widgets/chatbubble.dart';

class ChatScreen extends StatefulWidget {
  final int senderId;
  final int receiverId;

  const ChatScreen({super.key, required this.senderId, required this.receiverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageService _messageService = MessageService();
  final TextEditingController _messageController = TextEditingController();
  List<dynamic> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final messages = await _messageService.getMessages(widget.senderId, widget.receiverId);
    setState(() {
      _messages = messages;
    });
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      await _messageService.sendMessage(widget.senderId, widget.receiverId, message);
      _messageController.clear();
      _loadMessages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Chat with ${widget.receiverId}'),
        backgroundColor: Colors.teal[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isSender = msg['senderId'] == widget.senderId;
                return Align(
                  alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                  child: ChatBubble(
                    text: msg['message'],
                    isSender: isSender,
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[900],
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[850],
                      hintText: 'Type your message...',
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal[700],
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
