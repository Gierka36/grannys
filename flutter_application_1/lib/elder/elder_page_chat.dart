import 'package:flutter/material.dart';

// Model for Person
class Student {
  final String name;
  final String imagePath;
  
  Student({
    required this.name,
    required this.imagePath,
  });

  // Factory constructor to create a Person from JSON-like data
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      imagePath: json['imagePath'],
    );
  }
}

class ElderChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ElderChatPage> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = []; // Store messages along with sender info
  Student? _selectedPerson;

  // Sample JSON data for people
  final List<Map<String, dynamic>> _peopleData = [
    {
      "name": "Sarah Johnson",
      "imagePath": "assets/student5.png",
    },
    {
      "name": "Michael Lee",
      "imagePath": "assets/student1.png",
    },
    {
      "name": "Emily Williams",
      "imagePath": "assets/student6.png",
    },
    {
      "name": "David Brown",
      "imagePath": "assets/student2.png",
    },
    {
      "name": "Laura Davis",
      "imagePath": "assets/student4.png",
    },
  ];

  // List of Person objects
  List<Student> _people = [];

  @override
  void initState() {
    super.initState();
    // Convert the sample data to Person objects
    _people = _peopleData.map((personData) => Student.fromJson(personData)).toList();

    // Show dialog to select person as soon as the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSelectPersonDialog();
    });
  }

  // Show dialog to select a person to chat with
  void _showSelectPersonDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select a Person to Chat'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: _people.length,
              itemBuilder: (context, index) {
                final person = _people[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(person.imagePath),
                    radius: 30,
                    onBackgroundImageError: (exception, stackTrace) {
                      print('Error loading image: $exception');
                    },
                  ),
                  title: Text(person.name),
                  onTap: () {
                    setState(() {
                      _selectedPerson = person; // Set selected person
                    });
                    Navigator.pop(context); // Close the dialog
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // Method to send a message
  void _sendMessage() {
    String message = _controller.text.trim();
    if (message.isNotEmpty && _selectedPerson != null) {
      setState(() {
        _messages.insert(0, {
          'message': message,
          'sender': 'user', // 'user' is for the person sending the message
        }); // Add new message at the top
      });
      _controller.clear(); // Clear the input field

      // Simulate the reply from the selected person
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _messages.insert(0, {
            'message': "${_selectedPerson?.name}: Hello, how are you?",
            'sender': 'reply', // 'reply' is for the auto reply
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPerson == null ? 'Select a Person' : 'Chat with ${_selectedPerson?.name}'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          if (_selectedPerson != null) ...[
            // Show selected person's avatar and name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(_selectedPerson!.imagePath),
                    radius: 30,
                    onBackgroundImageError: (exception, stackTrace) {
                      print('Error loading image: $exception');
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Chatting with ${_selectedPerson!.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            child: ListView.builder(
              reverse: true, // Reverse the list to show the most recent messages at the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index]['message']!;
                final sender = _messages[index]['sender']!;

                // Create a chat bubble for each message
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: sender == 'user' ? Alignment.topRight : Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: sender == 'user' ? Colors.blue[100] : Colors.red[100], // Different colors for user and reply
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
