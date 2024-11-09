import 'package:flutter/material.dart';
import 'package:flutter_application_1/both/chat_page.dart';
import 'package:flutter_application_1/student/schedule_meeting.dart';
import 'package:flutter_application_1/student/student_page_grandmas.dart'; 
import 'package:flutter_application_1/both/student_page_info.dart';
import 'package:flutter_application_1/student/student_page_settings.dart';

class StudentPage1 extends StatefulWidget {
  final int initialSelectedIndex;

  StudentPage1({Key? key, required this.initialSelectedIndex}) : super(key: key);

  @override
  _StudentPage1State createState() => _StudentPage1State();
}

class _StudentPage1State extends State<StudentPage1> {
  // The index of the currently selected page
  int _selectedIndex = 0;

  // List of pages to be displayed
  final List<Widget> _pages = [
    ChatPage(), // Chat Page
    ScheduleMeetingPage(onMeetingScheduled: (meeting) {
      print('Scheduled: $meeting');
    }), // Schedule Meeting Page
    StudentPage(), // Opening Hours Page (Index 2)
    Settings(), // Profile page (Settings)
    InfoPage(), // Location page (Info)
  ];

  @override
  void initState() {
    super.initState();
    // Set the initial selected index based on the passed value
    _selectedIndex = widget.initialSelectedIndex;
  }

  // Method to handle navigation between pages
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7754F), // Light background color TOP STRIP
      appBar: AppBar(
        title: const Text(
          'STUDENT PORTAL',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 228, 215), // Set AppBar color to peach
        elevation: 0,
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFC7754F), // Bottom nav bar color
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Elderly', // This button leads to the StudentPage
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
        ],
      ),
    );
  }
}
