import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'view_scheduled_meetings_page.dart'; // Import the ViewScheduledMeetingsPage

class ScheduleMeetingPage extends StatefulWidget {
  final Function(Map<String, String>) onMeetingScheduled;

  const ScheduleMeetingPage({Key? key, required this.onMeetingScheduled}) : super(key: key);

  @override
  _ScheduleMeetingPageState createState() => _ScheduleMeetingPageState();
}

class _ScheduleMeetingPageState extends State<ScheduleMeetingPage> {
  String selectedActivity = 'Cooking';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Sample list of available times posted by elders
  List<Map<String, String>> availableTimes = [
    {'elder': 'John Doe', 'activity': 'Cooking', 'date': '2024-11-09', 'time': '10:00 AM'},
    {'elder': 'Jane Smith', 'activity': 'Fixing Tools', 'date': '2024-11-10', 'time': '02:00 PM'},
    {'elder': 'Mark Twain', 'activity': 'Learning Knitting', 'date': '2024-11-12', 'time': '09:00 AM'},
  ];

  // List to store meetings that the student has booked
  List<Map<String, String>> scheduledMeetings = [];

  void _showBookingDetails(Map<String, String> availableTime) {
    // Show dialog with more information about the booking
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Elder: ${availableTime['elder']}'),
              Text('Activity: ${availableTime['activity']}'),
              Text('Date: ${availableTime['date']}'),
              Text('Time: ${availableTime['time']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Proceed with the booking
                setState(() {
                  // Remove the booked time slot from the available list
                  availableTimes.remove(availableTime);
                  // Add the meeting to the list of scheduled meetings, make sure 'elder' is included
                  scheduledMeetings.add({
                    'elder': availableTime['elder']!,
                    'activity': availableTime['activity']!,
                    'date': availableTime['date']!,
                    'time': availableTime['time']!,
                  });
                });

                // Call the parent callback to update the state in StudentPage1
                widget.onMeetingScheduled({
                  'elder': availableTime['elder']!,
                  'activity': availableTime['activity']!,
                  'date': availableTime['date']!,
                  'time': availableTime['time']!,
                });

                Navigator.pop(context); // Close the dialog
                // Show confirmation dialog or any other action
                _showBookingConfirmation(availableTime);
              },
              child: const Text('Book Now'),
            ),
          ],
        );
      },
    );
  }

  void _showBookingConfirmation(Map<String, String> meeting) {
    // Show confirmation dialog for the booked meeting
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Meeting Scheduled'),
          content: Text(
              'You have successfully scheduled a meeting with ${meeting['elder']} for ${meeting['activity']} on ${meeting['date']} at ${meeting['time']}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _viewScheduledMeetings() {
    // Navigate to ViewScheduledMeetingsPage and pass the scheduledMeetings list
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewScheduledMeetingsPage(scheduledMeetings: scheduledMeetings),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Schedule Meeting'),
        backgroundColor: Color.fromARGB(255, 255, 228, 215),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Available Times for You to Book:'),
            if (availableTimes.isEmpty)
              Text('No available times posted yet.')
            else
              ...availableTimes.map((time) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('${time['activity']} on ${time['date']} at ${time['time']}'),
                    subtitle: Text('Elder: ${time['elder']}'),
                    trailing: ElevatedButton(
                      onPressed: () => _showBookingDetails(time),
                      child: const Text('Book'),
                    ),
                  ),
                );
              }).toList(),

            // Show the "View Scheduled Meetings" button if there are booked meetings
            if (scheduledMeetings.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: _viewScheduledMeetings,
                  child: const Text('View Scheduled Meetings'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
