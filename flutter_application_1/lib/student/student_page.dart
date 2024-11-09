import 'package:flutter/material.dart';
import 'package:flutter_application_1/both/chat_page.dart';
import 'package:flutter_application_1/student/schedule_meeting.dart';
import 'package:flutter_application_1/student/student_page_grandmas.dart';
import 'package:flutter_application_1/both/student_page_info.dart';
import 'package:flutter_application_1/student/student_page_settings.dart';

class StudentPage1 extends StatelessWidget {
  // Define the method that will be called when a meeting is scheduled
  void _onMeetingScheduled(Map<String, String> meeting) {
    // You can handle the scheduled meeting here, like adding it to a list
    print('Scheduled Meeting:');
    print('Person: ${meeting['person']}');
    print('Activity: ${meeting['activity']}');
    print('Date: ${meeting['date']}');
    print('Time: ${meeting['time']}');
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFC7754F), // Light background color TOP STRIP
    appBar: AppBar(
      title: const Text(
        'STUDENT PORTAL',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Color(0xFFC7754F), // BACKGROUND
      elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Main content (centered at the top, can be empty or used for additional info)
          Spacer(), // Space for flexibility

          // Bottom container with a darker background for buttons
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              color: Color(0xFFC7754F), // Darker shade of the background BOTTOM STRIP
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Chat Button (left-most)
                createCoolCard(
                  context,
                  iconData: Icons.chat_bubble,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage())),
                ),

                // Opening Hours Button (second from the left)
                createCoolCard(
                  context,
                  iconData: Icons.access_time,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StudentPage())),
                ),

                // Profile Button (center)
                createCoolCard(
                  context,
                  iconData: Icons.person,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Settings())),
                ),

                // Schedule Button (second from the right)
                createCoolCard(
                  context,
                  iconData: Icons.calendar_today,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ScheduleMeetingPage(onMeetingScheduled: _onMeetingScheduled))),
                ),

                // Location Button (right-most)
                createCoolCard(
                  context,
                  iconData: Icons.location_on,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InfoPage())),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Create a reusable method to create the icon buttons
Widget createCoolCard(BuildContext context, {required IconData iconData, required VoidCallback onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 50,  // Width of each button
      height: 50, // Height of each button
      decoration: BoxDecoration(
        color: Color(0xFFF1F2EB), // Match the main background color BUTTONS
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black, // Black icon color
          ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
}