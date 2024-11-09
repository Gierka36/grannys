import 'package:flutter/material.dart';
import 'package:flutter_application_1/both/chat_page.dart';
import 'package:flutter_application_1/both/student_page_info.dart';
import 'package:flutter_application_1/elder/elder_page_profile.dart';
import 'package:flutter_application_1/elder/elder_page_schedule.dart';
import 'package:flutter_application_1/elder/elder_page_opening_hours.dart';
import 'package:flutter_application_1/main.dart';

class ElderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elder Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ELDER PAGE'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // First Row: Profile and Schedule
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createIconButton(
                      Icons.person,
                      'Profile',
                      () => goButton(context, ElderPageProfile()),
                    ),
                    createIconButton(
                      Icons.calendar_today,
                      'Schedule',
                      () => goButton(context, ElderPageSchedule()),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                // Second Row: Opening Hours and Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createIconButton(
                      Icons.access_time,
                      'Opening Hours',
                      () => goButton(context, ElderPageOpeningHours()),
                    ),
                    createIconButton(
                      Icons.location_on,
                      'Location',
                      () => goButton(context, InfoPage()),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                // Third Row: Help and Go Back
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createIconButton(
                      Icons.chat_bubble,
                      'Chat',
                      () => goButton(context, ChatPage()),
                    ),
                    createIconButton(
                      Icons.arrow_back,
                      'Go Back',
                      () => goButton(context, MainScreen()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Icon button widget with styling improvements
  Widget createIconButton(IconData iconData, String label, VoidCallback onPressed) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green, width: 3), // Green border for distinction
        borderRadius: BorderRadius.circular(15), // Rounded corners for a softer look
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow offset
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center content in the container
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onPressed,
            child: Icon(
              iconData,
              size: 80, // Increase icon size for better visibility
              color: Colors.green,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center, // Center the label text
          ),
        ],
      ),
    );
  }

  // Navigation function to push to the next screen
  void goButton(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
