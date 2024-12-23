import 'package:flutter/material.dart';

class ElderPageProfile extends StatefulWidget {
  @override
  ElderPageState createState() => ElderPageState();
}

class ElderPageState extends State<ElderPageProfile> {
  // Sample profile data
  String name = 'John Doe';
  String email = 'johndoe@email.com';
  String phone = '123-456-7890';
  String dateOfBirth = '1940-10-01';
  
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    textStyle: TextStyle(fontSize: 20),
    backgroundColor: Color.fromARGB(255, 255, 206, 184),
  ).copyWith(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Adjust corner radius
        side: BorderSide(
          color: Color.fromARGB(255, 253, 193, 164), // Border color
          width: 4, // Border width
        ),
      ),
    ),
  ),
  child: Text("Edit Profile"), // Button text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
