import 'dart:convert';
import 'package:http/http.dart' as http;


const String baseUrl = 'http://10.0.2.2/chatapp-backend';

// Function to create a new user
Future<bool> createUser(String name, String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/signup.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    }),
  );

  final data = jsonDecode(response.body);

  if (response.statusCode == 200 && data['success'] != null) {
    return true;
  } else {
    return false;
  }
}

Future<Map<String, dynamic>> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/login.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
    }),
  );

  return jsonDecode(response.body);
}


Future<Map<String, dynamic>> createMessage(int userId, String message) async {
  final response = await http.post(
    Uri.parse('$baseUrl/create_message.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'user_id': userId,
      'message': message,
    }),
  );

  return jsonDecode(response.body);
}


Future<List<dynamic>> getMessages() async {
  final response = await http.get(Uri.parse('$baseUrl/get_messages.php'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['messages'] as List<dynamic>;
  } else {
    throw Exception('Failed to load messages');
  }
}

// Function to delete a message
Future<Map<String, dynamic>> deleteMessage(int messageId) async {
  final response = await http.delete(
    Uri.parse('$baseUrl/delete_message.php'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String>{
      'id': messageId.toString(),
    },
  );

  return jsonDecode(response.body);
}
