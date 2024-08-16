import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;

  const BottomNavBar({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onItemSelected(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.teal,
      onTap: _onItemTapped,
      backgroundColor: Colors.black87,
      unselectedItemColor: Colors.grey,
    );
  }
}
