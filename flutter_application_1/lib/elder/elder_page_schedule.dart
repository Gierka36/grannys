import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ElderPageSchedule extends StatefulWidget {
  final Function(Map<String, String>) onSlotPosted;

  const ElderPageSchedule({Key? key, required this.onSlotPosted}) : super(key: key);

  @override
  _ElderPageScheduleState createState() => _ElderPageScheduleState();
}

class _ElderPageScheduleState extends State<ElderPageSchedule> {
  DateTime _currentDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedActivity = 'Cooking';

  // List to hold the available slots posted by the elder
  List<Map<String, String>> availableSlots = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _currentDate) {
      setState(() {
        _currentDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _postAvailability() {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(_currentDate);
    final String formattedTime = _selectedTime.format(context);

    final Map<String, String> slot = {
      'elder': 'John Doe',  // Replace with the elder's name
      'activity': _selectedActivity,
      'date': formattedDate,
      'time': formattedTime,
    };

    // Call the parent callback to pass this slot to the student's page
    widget.onSlotPosted(slot);

    setState(() {
      availableSlots.add(slot);
    });

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Availability Posted', style: TextStyle(fontSize: 22)),
        content: Text(
            'You have posted: $formattedDate at $formattedTime for $_selectedActivity', 
            style: TextStyle(fontSize: 20)), 
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  // Method to remove an availability slot
  void _removeAvailability(Map<String, String> slot) {
    setState(() {
      availableSlots.remove(slot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Elder Schedule',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 255, 228, 215),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Date and time selection
              Row(
                children: [
                  const Text('Select Date:', style: TextStyle(fontSize: 24)),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(_currentDate),
                      style: TextStyle(fontSize: 22, color: Colors.black), // Change to black
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Select Time:', style: TextStyle(fontSize: 24)),
                  TextButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                      _selectedTime.format(context),
                      style: TextStyle(fontSize: 22, color: Colors.black), // Change to black
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Activity Dropdown
              DropdownButton<String>(
                value: _selectedActivity,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedActivity = newValue!;
                  });
                },
                items: ['Cooking', 'Teaching', 'Knitting'].map((String activity) {
                  return DropdownMenuItem<String>(
                    value: activity,
                    child: Text(activity, style: TextStyle(fontSize: 22, color: Colors.black)), // Change to black
                  );
                }).toList(),
                style: const TextStyle(fontSize: 22, color: Colors.black), // Set dropdown text to black
              ),

              const SizedBox(height: 30),

              // Button to post the availability
              ElevatedButton(
                onPressed: _postAvailability,
                child: const Text(
                  'Post Availability',
                  style: TextStyle(fontSize: 22),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 24),
                ),
              ),

              const SizedBox(height: 50),

              // Display posted availability slots
              Text(
                'Posted Availability Slots:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Display the list of availability slots
              if (availableSlots.isEmpty)
                const Text(
                  'No availability slots posted yet.',
                  style: TextStyle(fontSize: 22),
                )
              else
                ...availableSlots.map((slot) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        '${slot['activity']} on ${slot['date']} at ${slot['time']}',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'Elder: ${slot['elder']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, size: 30, color: Colors.red),
                        onPressed: () => _removeAvailability(slot),
                      ),
                    ),
                  );
                }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
