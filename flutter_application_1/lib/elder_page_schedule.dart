import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ElderPageSchedule extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<ElderPageSchedule> {
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Wrapping in SingleChildScrollView for scrolling
          child: Column(
            
            children: [
              // Adding constraints or wrapping the calendar in a Container
              Container(
                height: 400, // You can adjust the height as needed
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
              SizedBox(height: 20), // Add space between the calendar and the selected day text
              Text(
                'Selected Day: ${_currentDate.toLocal()}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
