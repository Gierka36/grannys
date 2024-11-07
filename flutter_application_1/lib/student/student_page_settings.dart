import 'package:flutter/material.dart';

class Settings extends StatelessWidget
{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Toggle switch example
          _buildSwitchTile('Enable Dark Mode', false, (value) {
            // Add functionality here, e.g., change theme
          }),

          // Notifications switch
          _buildSwitchTile('Notifications', true, (value) {
            // Toggle notifications here
          }),

          // List item example
          _buildListTile(
            title: 'Account Settings',
            subtitle: 'Manage your account',
            icon: Icons.person,
            onTap: () {
              // Navigate to account settings
            },
          ),

          // Another list item
          _buildListTile(
            title: 'Language',
            subtitle: 'Select app language',
            icon: Icons.language,
            onTap: () {
              // Open language selection dialog
            },
          ),

          // Slider example
          _buildSliderTile('Brightness', 50.0, (value) {
            // Adjust volume here
          }),

          // Divider for visual grouping
          Divider(),

          // Custom button example
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                // Add custom functionality here
              },
              child: Text('Reset Settings'),
            ),
          ),
        ],
      ),
    );
  }

  /// Creates a switch tile for toggles
  Widget _buildSwitchTile(String title, bool initialValue, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: initialValue,
      onChanged: onChanged,
    );
  }

  /// Creates a standard list tile with an icon
  Widget _buildListTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  /// Creates a slider tile
  Widget _buildSliderTile(String title, double initialValue, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16.0)),
        Slider(
          value: initialValue,
          min: 0,
          max: 100,
          divisions: 10,
          onChanged: onChanged,
        ),
      ],
    );
  }
}