import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/chat_container.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<dynamic> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/chatapp-backend/get_users.php'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        setState(() {
          users = data['users'];
          isLoading = false;
        });
      } else {
        _showError("Failed to load users");
      }
    } else {
      _showError("Error connecting to server");
    }
  }

  void _showError(String message) {
    setState(() {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    });
  }

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : IndexedStack(
          index: _currentIndex,
          children: [
            ListView.builder(
              itemCount: users.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const ChatContainer(
                    userName: 'Kero Nasser',
                    lastMessage: 'Hello world',
                    senderId: 1,
                    receiverId: 2,
                  );
                } else {
                  final user = users[index - 1];
                  return ChatContainer(
                    userName: user['name'],
                    lastMessage: 'Hello world',
                    senderId: user['id'],
                    receiverId: 0,
                  );
                }
              },
            ),
            const Center(child: Text('Contacts Page', style: TextStyle(fontSize: 25, color: Colors.white))),
            const Center(child: Text('Settings Page', style: TextStyle(fontSize: 25, color: Colors.white))),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: _onItemSelected),
    );
  }
}
