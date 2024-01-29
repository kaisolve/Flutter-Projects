// doctor_profile_page.dart

import 'package:flutter/material.dart';

class DoctorProfilePage extends StatelessWidget {
  final String name; // Pass the doctor's name as a parameter
  const DoctorProfilePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    String job = 'Stomic';
    String Days = 'Monday - Sunday';
    String time = '7:00 am to 9:00 pm';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CircleAvatar(
                      // Replace with the actual image data
                      backgroundImage: AssetImage('assets/doctor_image.jpg'),
                      radius: 50,
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    Text(
                      'Specialization: $job',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.access_time_outlined),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Days,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Adjust the font size as needed
                              ),
                            ),
                            Text(
                              time,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Available Timings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Today: 10am - 5pm',
                        ),
                        Text(
                          'Tomorrow: 9am - 4pm',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Consultation Fees',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$50',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle booking appointment
              },
              child: const Text('Book Appointment'),
            ),
          ),
        ],
      ),
    );
  }
}
