import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'elderly_profile.dart'; // Import ElderlyProfile model

class ScheduleMeetingPage extends StatefulWidget {
  const ScheduleMeetingPage({Key? key}) : super(key: key);

  @override
  _ScheduleMeetingPageState createState() => _ScheduleMeetingPageState();
}

class _ScheduleMeetingPageState extends State<ScheduleMeetingPage> {
  final List<ElderlyProfile> profiles = [
    ElderlyProfile(
      name: 'John Doe',
      imagePath: 'assets/john.png',
      skills: ['Gardening', 'Cooking'],
      helpOffered: 'Can help with gardening and meal preparation.',
      story: 'John is a retired chef who loves sharing his skills with others.',
    ),
    ElderlyProfile(
      name: 'Mary Smith',
      imagePath: 'assets/mary.png',
      skills: ['Knitting', 'Baking'],
      helpOffered: 'Can assist with knitting and baking.',
      story: 'Mary has a passion for baking and knitting warm clothes for others.',
    ),
    // Add more profiles as needed
  ];

  late ElderlyProfile selectedProfile;
  String selectedActivity = 'Cooking';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Define a list of activities to choose from
  final List<String> activities = ['Cooking', 'Fixing Tools', 'Learning Danish', 'Learning Knitting'];

  @override
  void initState() {
    super.initState();
    selectedProfile = profiles[0]; // Default to the first profile
  }

  // Show a DatePicker to select the meeting date
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

  // Show a TimePicker to select the meeting time
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

  // Method to schedule a meeting
  void _scheduleMeeting() {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    final String formattedTime = selectedTime.format(context);

    // Print out or save the meeting details
    print('Scheduled Meeting Details:');
    print('Person: ${selectedProfile.name}');
    print('Activity: $selectedActivity');
    print('Date: $formattedDate');
    print('Time: $formattedTime');

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Meeting Scheduled'),
        content: Text(
          'You have scheduled a meeting with ${selectedProfile.name} to $selectedActivity on $formattedDate at $formattedTime.',
        ),
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
            // Profile dropdown
            DropdownButton<ElderlyProfile>(
              value: selectedProfile,
              onChanged: (ElderlyProfile? newValue) {
                setState(() {
                  selectedProfile = newValue!;
                });
              },
              items: profiles.map<DropdownMenuItem<ElderlyProfile>>((ElderlyProfile profile) {
                return DropdownMenuItem<ElderlyProfile>(
                  value: profile,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(profile.imagePath),
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(profile.name),
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
            const SizedBox(height: 20),

            // Schedule button
            ElevatedButton(
              onPressed: _scheduleMeeting,
              child: const Text('Schedule Meeting'),
            ),
          ],
        ),
      ),
    );
  }
}
