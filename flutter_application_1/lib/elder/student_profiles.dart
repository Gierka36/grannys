import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/elder/student_model.dart'; // Import the Student model

class StudentProfiles extends StatefulWidget {
  const StudentProfiles({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfiles> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final String response = await rootBundle.loadString('assets/students.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      students = data.map((json) => Student.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Profiles'),
        backgroundColor:  Color.fromARGB(255, 255, 228, 215),
      ),
      body: students.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return StudentProfileCard(profile: student);
              },
            ),
    );
  }
}

class StudentProfileCard extends StatefulWidget {
  final Student profile;

  const StudentProfileCard({Key? key, required this.profile}) : super(key: key);

  @override
  _StudentProfileCardState createState() => _StudentProfileCardState();
}

class _StudentProfileCardState extends State<StudentProfileCard> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: toggleExpanded,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.profile.imagePath),
                    radius: 40,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.profile.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 16),
                Text(
                  'Skills:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                for (var skill in widget.profile.skills)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      '- $skill',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  'Help Offered:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.profile.helpOffered,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Story:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.profile.story,
                  style: const TextStyle(fontSize: 14),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
