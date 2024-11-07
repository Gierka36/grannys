import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/student_page_info.dart';
import 'package:flutter_application_1/student/student_page_settings.dart';
import 'package:flutter_application_1/elder/elder_page_schedule.dart';


class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10, right:10),
                  child: Center(
                    child: buildIconButton(
                    'assets/calendar.png',
                    'Schedule Time',
                    () => goButton(context, ElderPageSchedule())),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10, right:10),
                  child: Center(
                    child: buildIconButton(
                    'assets/calendar.png',
                    'Schedule Time',
                    () => goButton(context, ElderPageSchedule())),
                  )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleButton(
                  icon: Icons.info,
                  label: "Info",
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),);
                  },
                ),
                _buildCircleButton(
                  icon: Icons.home,
                  label: "Home",
                  onTap: () {
                    Navigator.pop(context);
                    print("Home button pressed");
                  },
                ),
                _buildCircleButton(
                  icon: Icons.settings,
                  label: "Settings",
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton(String assetPath, String label, Function() onPressed) {
  return Center(
    child: Container(
      width: double.infinity, // Take up the whole available width
      margin: EdgeInsets.symmetric(horizontal: 16.0), // Padding from the edges
      padding: EdgeInsets.all(16), // Internal padding
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Black border
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: InkWell(
        onTap: onPressed, // Call the provided function
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space label and icon
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16), // Customize label style if needed
            ),
            Image.asset(
              assetPath, // Path to your PNG asset
              height: 100, // Adjust icon size as needed
              width: 100,  // Adjust icon size as needed
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildCircleButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Icon(icon, size: 30,),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
  
  goButton(BuildContext context, ElderPageSchedule elderPageSchedule) {}
}