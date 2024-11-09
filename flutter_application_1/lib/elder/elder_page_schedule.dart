import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class ElderPageSchedule extends StatefulWidget {
  @override
  _ElderPageScheduleState createState() => _ElderPageScheduleState();
}

class _ElderPageScheduleState extends State<ElderPageSchedule> {
  DateTime _currentDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String? _selectedPerson;

  // Define the current user (example: 'John Doe')
  final String currentUser = 'John Doe';

  // List of scheduled meetings
  final List<Map<String, String>> _scheduledMeetings = [
    {
      'person': 'John Doe', // This should be replaced with 'You' for the current user
      'activity': 'Cooking',
      'date': '2024-11-09',
      'time': '10:00 AM',
    },
    {
      'person': 'Jane Smith',
      'activity': 'Fixing Tools',
      'date': '2024-11-10',
      'time': '02:00 PM',
    },
    // Add more meetings as needed
  ];

  List<Map<String, String>> _filteredMeetings = [];

  @override
  void initState() {
    super.initState();
    _filterMeetingsForDate(_currentDate); // Filter meetings for the default date
  }

  // Filter meetings based on the selected date
  void _filterMeetingsForDate(DateTime selectedDate) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    setState(() {
      _filteredMeetings = _scheduledMeetings
          .where((meeting) => meeting['date'] == formattedDate)
          .toList();
    });
  }

  // Replace the current user's name with "You"
  String _getDisplayName(String person) {
    return person == currentUser ? 'You' : person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        backgroundColor: Color.fromARGB(255, 255, 228, 215),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar for selecting a date
              Container(
                height: 400,
                child: CalendarCarousel(
                  onDayPressed: (DateTime date, List events) {
                    setState(() {
                      _currentDate = date;
                    });
                    _filterMeetingsForDate(date); // Filter meetings based on selected date
                  },
                  thisMonthDayBorderColor: Colors.grey,
                  selectedDayButtonColor: Colors.green,
                  selectedDayTextStyle: TextStyle(color: Colors.white),
                  daysHaveCircularBorder: false,
                  showOnlyCurrentMonthDate: false,
                ),
              ),
              SizedBox(height: 20),

              // Display meetings for the selected date
              if (_filteredMeetings.isEmpty)
                Text(
                  'No meetings scheduled for this day.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              else
                ..._filteredMeetings.map((meeting) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Meeting with ${_getDisplayName(meeting['person']!)}'),
                      subtitle: Text(
                          '${meeting['activity']} at ${meeting['time']}'),
                    ),
                  );
                }).toList(),

              // Other UI elements for selecting person, time, etc.
            ],
          ),
        ),
      ),
    );
  }
}
