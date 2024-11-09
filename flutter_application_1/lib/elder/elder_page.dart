import 'package:flutter/material.dart';
import 'package:flutter_application_1/elder/elder_page_profile.dart';
import 'package:flutter_application_1/elder/elder_page_schedule.dart';
import 'package:flutter_application_1/elder/elder_page_location.dart';
import 'package:flutter_application_1/elder/elder_page_help.dart';
import 'package:flutter_application_1/elder/elder_page_opening_hours.dart';
import 'package:flutter_application_1/main.dart';

class ElderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ELDER PAGE'),
        ),
      
        body: Padding(
 
            padding: const EdgeInsets.only(top:85, left:40,),
            child: Column (

              children: [
                Row(

                children: [Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: Align(
                    alignment: Alignment.topLeft,
                child: createIconButton(
                        Icons.person,
                        'Profile',
                        () => goButton(context, ElderPageProfile()),
                  )
                )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topRight,
                child: createIconButton(
                  Icons.calendar_today,
                  'Schedule',
                  () => goButton(context, ElderPageSchedule())),
                  ),),
              ]
            ),
            Row (
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: createIconButton(
                      Icons.access_time,
                      'Opening Hours',
                      () => goButton(context, ElderPageOpeningHours()))), ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: createIconButton(
                      Icons.location_on,
                      'Location',
                      () => goButton(context, ElderPageLocations())),)
                  ),],),
              Row (
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: createIconButton(
                       Icons.help_outline,
                      'Help',
                      () => goButton(context, ElderPageHelp()))), ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: createIconButton(
                      Icons.arrow_back,
                      'Go Back',
                      () => goButton(context, MainScreen())),)
                  ),
                  
              
                  
                
              ]

            )



            ])
            )
  
            ));
            
            
          
          }}
 Widget createIconButton(IconData iconData, String label, VoidCallback onPressed) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Black border
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      padding: const EdgeInsets.all(16), // Padding around the content
      child: Column(
        mainAxisSize: MainAxisSize.min, // Size the column to its content
        children: [
          InkWell(
            onTap: onPressed,
            child: Icon(
              iconData, // Use the provided icon data
              size: 80, // Adjust icon size as needed
              color: Colors.black, // Adjust icon color if needed
            ),
          ),
          const SizedBox(height: 10), // Space between icon and text
          Text(label, style: const TextStyle(fontSize: 16)), // Display the label for the icon
        ],
      ),
    );
  }
void goButton(BuildContext context, Widget page) {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
}