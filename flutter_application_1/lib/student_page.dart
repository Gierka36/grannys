import 'package:flutter/material.dart';


class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100, // Background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top Section with Three Large Ovals
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOvalContainer("Text 1"),
                _buildOvalContainer("Text 2"),
                _buildOvalContainer("Text 3"),
              ],
            ),
          ),
          // Bottom Section with Three Circular Buttons
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleButton(
                  icon: Icons.info,
                  label: "Info",
                  onTap: () {
                    // Handle Info button press
                    print("Info button pressed");
                  },
                ),
                _buildCircleButton(
                  icon: Icons.home,
                  label: "Home",
                  onTap: () {
                    Navigator.pop(context);
                    // Handle Home button press
                    print("Home button pressed");
                  },
                ),
                _buildCircleButton(
                  icon: Icons.settings,
                  label: "Settings",
                  onTap: () {
                    // Handle Settings button press
                    print("Settings button pressed");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    Widget _buildOvalContainer(String text) {
    return Container(
      width: 250,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper to build the circular buttons with icons
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
            decoration: BoxDecoration(
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
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}