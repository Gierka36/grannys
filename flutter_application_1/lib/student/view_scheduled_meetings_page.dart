import 'package:flutter/material.dart';

class ViewScheduledMeetingsPage extends StatelessWidget {
  final List<Map<String, String>> scheduledMeetings;

  const ViewScheduledMeetingsPage({Key? key, required this.scheduledMeetings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Meetings'),
      ),
      body: ListView.builder(
        itemCount: scheduledMeetings.length,
        itemBuilder: (context, index) {
          final meeting = scheduledMeetings[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Meeting with ${meeting['person']}'),
              subtitle: Text('${meeting['activity']} on ${meeting['date']} at ${meeting['time']}'),
            ),
          );
        },
      ),
    );
  }
}
