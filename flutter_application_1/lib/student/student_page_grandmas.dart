import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/elderly_profile.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  List<ElderlyProfile> profiles = [];

  @override
  void initState() {
    super.initState();
    loadProfiles();
  }

  Future<void> loadProfiles() async {
    final String response = await rootBundle.loadString('assets/profiles.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      profiles = data.map((json) => ElderlyProfile.fromJson(json)).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Student Page'),
      ),
      body: profiles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                return ElderProfileCard(profile: profiles[index]);
              },
            ),
    );
  }
}

class ElderProfileCard extends StatefulWidget {
  final ElderlyProfile profile;

  const ElderProfileCard({Key? key, required this.profile}) : super(key: key);

  @override
  _ElderProfileCardState createState() => _ElderProfileCardState();
}

class _ElderProfileCardState extends State<ElderProfileCard> {
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
