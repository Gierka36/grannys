import 'package:flutter/material.dart';
import 'second_page.dart' as app2;
import 'elder_page_profile.dart';
import 'elder_page_schedule.dart';
import 'elder_page_location.dart';
import 'elder_page_help.dart';
import 'elder_page_opening_hours.dart';
class ElderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material Icons'),
        ),
      
        body: Padding(
 
            padding: const EdgeInsets.only(top:85, left:40,),
            child: Column (

              children: [
                Row(

                children: [Padding(
                  padding: const EdgeInsets.only(top:10, right:50),
                  child: Align(
                    alignment: Alignment.topLeft,
                child: createIconButton(
                  'assets/user.png',
                  'Profile',
                  () => goButton(context, ElderPageProfile())),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topRight,
                child: createIconButton(
                  'assets/calendar.png',
                  'Schedule',
                  () => goButton(context, ElderPageSchedule())),
                  ),),
              ]
            ),
            Row (
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10, right:50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: createIconButton(
                      'assets/24-7.png',
                      'Opening Hours',
                      () => goButton(context, app2.SecondPage()))), ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: createIconButton(
                      'assets/location.png',
                      'Location',
                      () => goButton(context, app2.SecondPage())),)
                  ),],),
              Row (
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10, right:50),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: createIconButton(
                      'assets/help-web-button.png',
                      'Help',
                      () => goButton(context, ElderPageHelp()))), ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: createIconButton(
                      'assets/back.png',
                      'Go Back',
                      () => goButton(context, app2.SecondPage())),)
                  ),
                  
              
                  
                
              ]

            )



            ])
            )
  
            ));
            
            
          
          }}

  Widget createIconButton(String assetPath, String label, Function() goBack) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Black border
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      padding: EdgeInsets.all(16), // Padding around the content
      child: Column(
        mainAxisSize: MainAxisSize.min, // Size the column to its content
        children: [
          InkWell(
            onTap: goBack, // Call the provided function
            child: Image.asset(
              assetPath, // Path to your PNG asset
              height: 100, // Adjust height as needed
              width: 100, // Adjust width as needed
            ),
          ),
          SizedBox(height: 10), // Space between icon and text
          Text(label), // Display the label for the icon
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