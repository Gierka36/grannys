import 'package:flutter/material.dart';

class ElderPageOpeningHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the first page
            Navigator.pop(context);
          },
          child: Text('Back to Home Page'),
        ),
      ),
    );
  }
}