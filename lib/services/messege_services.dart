import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageService {
  static const String baseUrl = 'http://10.0.2.2/chatapp-backend/';
  Future<void> sendMessage(int senderId, int receiverId, String message) async {
    final response = await http.post(
      Uri.parse('${baseUrl}send_message.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'sender_id': senderId,
        'receiver_id': receiverId,
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message: ${response.body}');
    }
  }

  Future<List<dynamic>> getMessages(int senderId, int receiverId) async {
    final response = await http.get(
      Uri.parse('${baseUrl}get_messages.php?sender_id=$senderId&receiver_id=$receiverId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['messages'];
    } else {
      print('Failed to load messages: ${response.body}');
      return [];
    }
  }

  Future<void> markAsRead(int messageId) async {
    final response = await http.post(
      Uri.parse('${baseUrl}mark_as_read.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'message_id': messageId,
      }),
    );

    if (response.statusCode == 200) {
      print('Message marked as read');
    } else {
      print('Failed to mark message as read: ${response.body}');
    }
  }

  Future<void> deleteMessage(int messageId) async {
    final response = await http.delete(
      Uri.parse('${baseUrl}delete_message.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'message_id': messageId,
      }),
    );

    if (response.statusCode == 200) {
      print('Message deleted');
    } else {
      print('Failed to delete message: ${response.body}');
    }
  }
}
