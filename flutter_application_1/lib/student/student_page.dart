import 'package:flutter/material.dart';
import 'package:flutter_application_1/both/chat_page.dart';
import 'package:flutter_application_1/student/schedule_meeting.dart';
import 'package:flutter_application_1/student/student_page_grandmas.dart'; 
import 'package:flutter_application_1/both/student_page_info.dart'; // Assuming this is the ElderInfoPage
import 'package:flutter_application_1/student/student_page_settings.dart';
import 'package:flutter_application_1/both/elder_page_infob.dart';

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
    ElderInfoPage(), // Update this to the actual ElderInfoPage
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

  // Helper function to create Bottom Navigation items with borders
  Widget _createNavItem(IconData icon, String label, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 253, 193, 164), // Border color
          width: isSelected ? 6 : 2, // Thicker border when selected
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(6),
      child: Icon(
        icon,
        color: isSelected ? Colors.grey : Color.fromARGB(255, 255, 206, 184),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7754F), // Light background color TOP STRIP
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        backgroundColor: Color.fromARGB(255, 131, 81, 56), // Bottom nav bar color
        selectedItemColor: Colors.grey,
        unselectedItemColor: Color.fromARGB(255, 255, 206, 184),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _createNavItem(Icons.chat_bubble, 'Chat', _selectedIndex == 0),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: _createNavItem(Icons.calendar_today, 'Schedule', _selectedIndex == 1),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: _createNavItem(Icons.info, 'Elderly', _selectedIndex == 2),
            label: 'Elderly',
          ),
          BottomNavigationBarItem(
            icon: _createNavItem(Icons.person, 'Profile', _selectedIndex == 3),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: _createNavItem(Icons.location_on, 'Location', _selectedIndex == 4),
            label: 'Location',
          ),
        ],
      ),
    );
  }
}
