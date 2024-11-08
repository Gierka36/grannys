import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ElderPageSchedule extends StatefulWidget {
  @override
  _ElderPageScheduleState createState() => _ElderPageScheduleState();
}

class _ElderPageScheduleState extends State<ElderPageSchedule> {
  DateTime _currentDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String? _selectedPerson;
  
  // List of people to select from
  final List<String> _people = ['John Doe', 'Jane Smith', 'Mark Johnson'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dropdown for selecting a person
              Text('Select Person:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedPerson,
                hint: Text('Choose a person'),
                items: _people.map((person) {
                  return DropdownMenuItem<String>(
                    value: person,
                    child: Text(person),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPerson = newValue;
                  });
                },
              ),
              SizedBox(height: 20),

              // Calendar for selecting a date
              Container(
                height: 400,
                child: CalendarCarousel(
                  onDayPressed: (DateTime date, List events) {
                    setState(() {
                      _currentDate = date;
                    });
                  },
                  thisMonthDayBorderColor: Colors.grey,
                  selectedDayButtonColor: Colors.green,
                  selectedDayTextStyle: TextStyle(color: Colors.white),
                  daysHaveCircularBorder: false,
                  showOnlyCurrentMonthDate: false,
                ),
              ),
              SizedBox(height: 20),

              // Time picker for selecting a time
              Text('Select Time:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime,
                  );
                  if (pickedTime != null && pickedTime != _selectedTime) {
                    setState(() {
                      _selectedTime = pickedTime;
                    });
                  }
                },
                child: Text('Pick Time'),
              ),
              SizedBox(height: 20),

              // Display the selected person, date, and time
              Text(
                'Selected Schedule:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Person: ${_selectedPerson ?? 'Not selected'}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Date: ${_currentDate.toLocal().toString().split(' ')[0]}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Time: ${_selectedTime.format(context)}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
