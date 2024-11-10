import 'package:flutter/material.dart';

// Assuming MainScreen is the screen to navigate to when logged out.
import 'package:flutter_application_1/main.dart';  // Import your main screen here

class Settings extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<Settings> {
  // Sample profile data
  String name = 'John Doe';
  String email = 'johndoe@email.com';
  String phone = '123-456-7890';
  String dateOfBirth = '1940-10-01';
  String status = 'Student'; // New field for status
  
  // This will be used to change profile image (optional)
  ImageProvider profileImage = AssetImage('assets/profile_picture.png');
  
  // Simple method to show a profile edit dialog (optional)
  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile', style: TextStyle(fontSize: 20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (newName) {
                  setState(() {
                    name = newName;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (newEmail) {
                  setState(() {
                    email = newEmail;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Phone'),
                onChanged: (newPhone) {
                  setState(() {
                    phone = newPhone;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onChanged: (newDate) {
                  setState(() {
                    dateOfBirth = newDate;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(fontSize: 18)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save', style: TextStyle(fontSize: 18)),
            ),
          ],
        );
      },
    );
  }

  // Function to handle logout and navigate to MainScreen
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),  // Replace MainScreen with your actual screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile', style: TextStyle(fontSize: 24)),
        backgroundColor: Color.fromARGB(255, 255, 228, 215),
      ),
      body: Center( // Wrap everything in a Center widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the column's children vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center the column's children horizontally
              children: [
                // Profile Image Section
                CircleAvatar(
                  radius: 80,
                  backgroundImage: profileImage,
                ),
                SizedBox(height: 20),
                // Name
                Text(
                  name,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // Status (Student) - Now the text is black
                Text(
                  status, // Display the "Student" status here
                  style: TextStyle(fontSize: 22, color: Colors.black), // Updated to black color
                ),
                SizedBox(height: 10),
                // Email
                Text(
                  'Email: $email',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 10),
                // Phone
                Text(
                  'Phone: $phone',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 10),
                // Date of Birth
                Text(
                  'Date of Birth: $dateOfBirth',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 30),

                // Edit Profile Button
                ElevatedButton(
                  onPressed: _editProfile,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    textStyle: TextStyle(fontSize: 20),// Corrected property
                  ),
                  child: Text('Edit Profile'),
                ),
                
                SizedBox(height: 20), // Space between buttons
                
                // Logout Button
                ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50), // Smaller size
                    backgroundColor: Colors.red, // Red background color
                    textStyle: TextStyle(fontSize: 18, color: Colors.white), // White text color
                  ),
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
