import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community information'),
        backgroundColor: const Color.fromARGB(255, 255, 228, 215), // Set the background color here
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/map.png', height: 300, width: 300),
              ),
            ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Alsion 2, 6400 Sønderborg', // Example address
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Working Hours',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Monday-Friday 10:00-20:00'
                'Saturday-Sunday 10:00-19:00',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // Large text area
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Organizing intergenerational meet-ups where young people can learn from elderly community '
                'members is a valuable way to bridge generations and foster meaningful connections. These '
                'gatherings allow older adults to share life experiences, wisdom, and skills, such as storytelling,  '
                'traditional crafts, or advice on resilience. For young participants, it offers a unique chance to gain '
                'vitae ipsum bibendum fermentum. Mauris eu sem odio. Integer non ipsum volutpat, '
                'insights that arent easily found in books or online. These sessions can also provide the elderly with '
                'et nisl eget ornare. Proin venenatis metus non ipsum fermentum, sit amet luctus '
                'eros consectetur. Donec posuere nunc sit amet quam elementum convallis.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 40), // Add some spacing at the bottom
          ],
        ),
      ),
    );
  }
}
