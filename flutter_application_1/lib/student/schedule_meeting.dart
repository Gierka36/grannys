import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/student/view_scheduled_meetings_page.dart'; // Import the ViewScheduledMeetingsPage

class ScheduleMeetingPage extends StatefulWidget {
  final Function(Map<String, String>) onMeetingScheduled;

  const ScheduleMeetingPage({Key? key, required this.onMeetingScheduled}) : super(key: key);

  @override
  _ScheduleMeetingPageState createState() => _ScheduleMeetingPageState();
}

class _ScheduleMeetingPageState extends State<ScheduleMeetingPage> {
  String selectedPerson = 'John Doe'; // Add default selected person
  String selectedActivity = 'Cooking';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Sample list of people with images
  final List<Map<String, String>> people = [
    {'name': 'John Doe', 'image': 'assets/john.png'}, 
    {'name': 'Jane Smith', 'image': 'assets/betty.png'},
    {'name': 'Mark Twain', 'image': 'assets/frank.png'}
  ];
  
  final List<String> activities = ['Cooking', 'Fixing Tools', 'Learning Danish', 'Learning Knitting'];

  // List to store scheduled meetings
  List<Map<String, String>> scheduledMeetings = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _scheduleMeeting() {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    final String formattedTime = selectedTime.format(context);

    final Map<String, String> meeting = {
      'person': selectedPerson,
      'activity': selectedActivity,
      'date': formattedDate,
      'time': formattedTime,
    };

    // Call the parent callback to update the state in StudentPage1
    widget.onMeetingScheduled(meeting);

    setState(() {
      scheduledMeetings.add(meeting);
    });

    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Meeting Scheduled'),
        content: Text('Scheduled: $selectedActivity with $selectedPerson on $formattedDate at $formattedTime.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Meeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Person dropdown
            DropdownButton<String>(
              value: selectedPerson,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPerson = newValue!;
                });
              },
              items: people.map<DropdownMenuItem<String>>((person) {
                return DropdownMenuItem<String>(
                  value: person['name']!,
                  child: Row(
                    children: [
                      // Add an image next to the person's name
                      CircleAvatar(
                        backgroundImage: AssetImage(person['image']!),
                        radius: 16,
                      ),
                      const SizedBox(width: 10),
                      Text(person['name']!),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Activity dropdown
            DropdownButton<String>(
              value: selectedActivity,
              onChanged: (String? newValue) {
                setState(() {
                  selectedActivity = newValue!;
                });
              },
              items: activities.map<DropdownMenuItem<String>>((String activity) {
                return DropdownMenuItem<String>(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Date selection
            Row(
              children: [
                const Text('Select Date:'),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Time selection
            Row(
              children: [
                const Text('Select Time:'),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => _selectTime(context),
                  child: Text(selectedTime.format(context)),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Button to schedule meeting
            ElevatedButton(
              onPressed: _scheduleMeeting,
              child: const Text('Schedule Meeting'),
            ),

            // Display "View Scheduled Meetings" button if meetings are scheduled
            if (scheduledMeetings.isNotEmpty) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to ViewScheduledMeetingsPage and pass meetings list
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewScheduledMeetingsPage(
                        scheduledMeetings: scheduledMeetings, // Pass updated list
                      ),
                    ),
                  );
                },
                child: const Text('View Scheduled Meetings'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
