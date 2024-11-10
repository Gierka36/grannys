import 'package:flutter/material.dart';
import 'package:flutter_application_1/elder/elder_page_chat.dart'; // Import the ElderChatPage
import 'package:flutter_application_1/elder/elder_page_profile.dart';
import 'package:flutter_application_1/elder/elder_page_schedule.dart';
import 'package:flutter_application_1/elder/elder_page_opening_hours.dart';
import 'package:flutter_application_1/both/student_page_info.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/elder/student_profiles.dart'; // Import student model for JSON

// Student Model
class Student {
  final String name;
  final String imagePath;
  final List<String> skills;
  final String helpOffered;
  final String story;

  Student({
    required this.name,
    required this.imagePath,
    required this.skills,
    required this.helpOffered,
    required this.story,
  });
}

class ElderPage extends StatelessWidget {
  // List of students (you could also load this dynamically)
  final List<Student> students = [
    Student(
      name: "John Doe",
      imagePath: "assets/john.png",
      skills: ["Gardening", "Cooking"],
      helpOffered: "Can help with gardening and meal preparation.",
      story: "John is a retired chef who loves sharing his skills with others.",
    ),
    Student(
      name: "Mary Smith",
      imagePath: "assets/mary.png",
      skills: ["Knitting", "Baking"],
      helpOffered: "Can assist with knitting and baking.",
      story: "Mary has a passion for baking and knitting warm clothes for others.",
    ),
    // Add more students here...
  ];

  // List to hold the scheduled slots
  List<Map<String, String>> scheduledSlots = [];

  // Handle the slot posted by the elder
  void _handleSlotPosted(Map<String, String> slot) {
    scheduledSlots.add(slot);
    print("Slot Posted: $slot");
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Button width and height based on screen size
    double buttonWidth = screenWidth * 0.4; // 40% of the screen width
    double buttonHeight = screenHeight * 0.2; // 20% of the screen height
    double iconSize = buttonWidth * 0.35; // Icon size based on button width

    return MaterialApp(
      title: 'Elder Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 228, 215), // Light brown background color
        appBar: AppBar(
          title: const Text(
            'ELDER PAGE',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 255, 228, 215), // Same brown color as the background
          elevation: 0,
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
                      buttonWidth,
                      buttonHeight,
                      iconSize,
                    ),
                    createIconButton(
                      Icons.calendar_today,
                      'Schedule',
                      () => goButton(context, ElderPageSchedule(onSlotPosted: _handleSlotPosted)),
                      buttonWidth,
                      buttonHeight,
                      iconSize,
                    ),
                  ],
                ),
                const SizedBox(height: 30), // Increased spacing

                // Second Row: Opening Hours and Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createIconButton(
                      Icons.info,
                      'Students',
                      () => goButton(context, StudentProfiles()),
                      buttonWidth,
                      buttonHeight,
                      iconSize,
                    ),
                    createIconButton(
                      Icons.location_on,
                      'Location',
                      () => goButton(context, InfoPage()),
                      buttonWidth,
                      buttonHeight,
                      iconSize,
                    ),
                  ],
                ),
                const SizedBox(height: 30), // Increased spacing

                // Third Row: Help and Go Back
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createIconButton(
                      Icons.chat_bubble,
                      'Chat',
                      () => goButton(context, ElderChatPage()),
                      buttonWidth,
                      buttonHeight,
                      iconSize,
                    ),
                    createIconButton(
                      Icons.arrow_back,
                      'Go Back',
                      () => goButton(context, MainScreen()),
                      buttonWidth,
                      buttonHeight,
                      iconSize,
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

  // Icon button widget with larger text and icons
  Widget createIconButton(IconData iconData, String label, VoidCallback onPressed, double buttonWidth, double buttonHeight, double iconSize) {
    return Container(
      width: buttonWidth, // Use the dynamic width
      height: buttonHeight, // Use the dynamic height
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 206, 184),
        border: Border.all(color: Color.fromARGB(255, 253, 193, 164), width: 4), // Green border for distinction
        borderRadius: BorderRadius.circular(15), // Rounded corners for a softer look
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Softer shadow for better visibility
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4), // Shadow offset for more noticeable depth
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
              size: iconSize, // Use dynamic icon size
              color: Color.fromARGB(255, 131, 81, 56),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 20, // Adjust text size slightly smaller for better fit
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 131, 81, 56),
            ),
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
