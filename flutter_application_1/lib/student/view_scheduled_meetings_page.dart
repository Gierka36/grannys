import 'package:flutter/material.dart';
import 'schedule_meeting.dart';

class ViewScheduledMeetingsPage extends StatefulWidget {
  const ViewScheduledMeetingsPage({Key? key}) : super(key: key);

  @override
  _ViewScheduledMeetingsPageState createState() => _ViewScheduledMeetingsPageState();
}

class _ViewScheduledMeetingsPageState extends State<ViewScheduledMeetingsPage> {
  final List<Map<String, String>> scheduledMeetings = [];

  // Add a sample meeting for testing purposes
  @override
  void initState() {
    super.initState();
    scheduledMeetings.add({
      'person': 'John Doe',
      'activity': 'Cooking',
      'date': '2024-12-01',
      'time': '14:00',
    });
    scheduledMeetings.add({
      'person': 'Mary Smith',
      'activity': 'Knitting',
      'date': '2024-12-02',
      'time': '10:00',
    });
  }

  // Cancel meeting
  void _cancelMeeting(int index) {
    setState(() {
      scheduledMeetings.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Meetings'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: scheduledMeetings.length,
        itemBuilder: (context, index) {
          final meeting = scheduledMeetings[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('${meeting['person']} - ${meeting['activity']}'),
              subtitle: Text('Date: ${meeting['date']} - Time: ${meeting['time']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _cancelMeeting(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
