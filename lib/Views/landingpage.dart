// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:uniapp/Views/Chats/chatpage.dart';
import 'package:uniapp/Views/EventsAndCalender/calender.dart';
import 'package:uniapp/Views/feemanagement.dart';
import 'package:uniapp/Views/homepage.dart';
import 'package:uniapp/Views/NotesAndUnitReveiw/notes.dart';

class SchoolManagement extends StatefulWidget {
  const SchoolManagement({Key? key}) : super(key: key);

  @override
  _SchoolManagementState createState() => _SchoolManagementState();
}

class _SchoolManagementState extends State<SchoolManagement> {
  int _selectedItemIndex = 0;
  final List pages = const [
    HomePage(),
    MiniCalender(),
    NotesPage(), //for testing my calender page
    FeesPage(),
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
            selectedIconTheme: IconThemeData(color: Colors.green[600]),
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Activites",
                icon: Icon(Icons.calendar_today),
              ),
              BottomNavigationBarItem(
                label: "Notes",
                icon: Icon(Icons.school_outlined),
              ),
              BottomNavigationBarItem(
                label: "Fees",
                icon: Icon(Icons.account_balance_wallet),
              ),
              BottomNavigationBarItem(
                label: "Chat",
                icon: Icon(Icons.chat_bubble),
              ),
            ],
          ),
          body: pages[_selectedItemIndex]),
    );
  }
}
