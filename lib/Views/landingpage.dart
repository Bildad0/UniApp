// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:uniapp/Views/Chats/chatpage.dart';
import 'package:uniapp/Views/calender.dart';
import 'package:uniapp/Views/feemanagement.dart';
import 'package:uniapp/Views/homepage.dart';

class SchoolManagement extends StatefulWidget {
  const SchoolManagement({Key? key}) : super(key: key);

  @override
  _SchoolManagementState createState() => _SchoolManagementState();
}

class _SchoolManagementState extends State<SchoolManagement> {
  int _selectedItemIndex = 0;
  final List pages = const [
    HomePage(),
    null,
    FeesPage(),
    CalendarPage(),
    ChatPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: const Color(0xFFF0F0F0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.green,
            selectedIconTheme: IconThemeData(color: Colors.blueGrey[600]),
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.menu_book),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.account_balance_wallet),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.calendar_today),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.chat_bubble),
              ),
            ],
          ),
          body: pages[_selectedItemIndex]),
    );
  }
}
