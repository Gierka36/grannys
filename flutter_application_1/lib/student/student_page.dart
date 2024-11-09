import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/student/schedule_meeting.dart';
import 'package:flutter_application_1/student/student_page_grandmas.dart';
import 'package:flutter_application_1/student/student_page_info.dart';
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
      appBar: AppBar(
        title: const Text('STUDENT PAGE'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 85, left: 40),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: createIconButton(
                      Icons.person,
                      'Profile',
                      () => goButton(context, Settings()), // Navigate to Profile page
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: createIconButton(
                      Icons.calendar_today, // Pass IconData instead of String
                      'Schedule',
                      () => goButton(
                        context,
                        ScheduleMeetingPage(
                          onMeetingScheduled: _onMeetingScheduled, // Pass the callback function
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: createIconButton(
                        Icons.access_time, // Pass IconData instead of String
                        'Opening Hours',
                        () => goButton(context, StudentPage()), // Navigate to Opening Hours page
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: createIconButton(
                        Icons.location_on, // Pass IconData instead of String
                        'Location',
                        () => goButton(context, InfoPage()), // Navigate to Location page
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: createIconButton(
                        Icons.help_outline, // Pass IconData instead of String
                        'Help',
                        () => goButton(context, InfoPage()), // Navigate to Help page
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: createIconButton(
                        Icons.arrow_back, // Pass IconData instead of String
                        'Go Back',
                        () => goButton(context, MainScreen()), // Navigate to Main Screen
                      ),
                    ),
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
  Widget createIconButton(IconData iconData, String label, VoidCallback onPressed) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Black border
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      padding: const EdgeInsets.all(16), // Padding around the content
      child: Column(
        mainAxisSize: MainAxisSize.min, // Size the column to its content
        children: [
          InkWell(
            onTap: onPressed,
            child: Icon(
              iconData, // Use the provided icon data
              size: 80, // Adjust icon size as needed
              color: Colors.black, // Adjust icon color if needed
            ),
          ),
          const SizedBox(height: 10), // Space between icon and text
          Text(label, style: const TextStyle(fontSize: 16)), // Display the label for the icon
        ],
      ),
    );
  }

  // Method to navigate between pages
  void goButton(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
