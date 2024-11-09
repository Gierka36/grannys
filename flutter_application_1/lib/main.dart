import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/student_page.dart';  // Correct imports
import 'package:flutter_application_1/student/student_page_settings.dart';
import 'package:flutter_application_1/student/schedule_meeting.dart';
import 'package:flutter_application_1/both/chat_page.dart';
import 'package:flutter_application_1/both/student_page_info.dart';
import 'package:flutter_application_1/student/student_page_grandmas.dart';
import 'package:flutter_application_1/elder/elder_page.dart'; // Correct import for ElderPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 228, 215), // Background color for the scaffold // Set primary color (you can customize as needed)
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF6E2C9), // Set button background color globally
          textTheme: ButtonTextTheme.primary, // Set text color on buttons to contrast the background
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 179, 164), // Set background color for ElevatedButton globally
            foregroundColor: Colors.black,     // Set text color for ElevatedButton (black text)
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 228, 215), // Set AppBar background color to match the scaffold background color
          foregroundColor: Colors.black, // Set text color of AppBar (black text)
          elevation: 0, // Optional: Remove the shadow under the AppBar
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  // Toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Method to handle login logic
  void _login(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (password == '123') {
      if (username == 'rick') {
        // Navigate to ElderPage if the user is 'rick' (as an example)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ElderPage()),
        );
      } else if (username == 'morty') {
        // Navigate to StudentPage1 and set selected index to 1 (Schedule)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StudentPage1(initialSelectedIndex: 1)),  // Pass index 1 for Schedule
        );
      } else {
        _showErrorDialog(context, 'Invalid username');
      }
    } else {
      _showErrorDialog(context, 'Incorrect password');
    }
  }

  // Method to show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        // The background color is automatically set to the same color as the scaffold background color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username TextField
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20), // Space between TextFields

              // Password TextField with eye icon to toggle visibility
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Space between TextField and Button

              // Login Button
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
