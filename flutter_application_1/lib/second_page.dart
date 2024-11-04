import 'package:flutter/material.dart';
import 'elder_page.dart';
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ElderPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              ),
              child: const Text(
                'Elder',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 75), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Action for Button 2
                print("Button 2 pressed");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              ),
              child: const Text(
                'Student',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
