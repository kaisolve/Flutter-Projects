// doctor_profile_page.dart

import 'package:flutter/material.dart';

class DoctorProfilePage extends StatelessWidget {
  final String name; // Pass the doctor's name as a parameter

  const DoctorProfilePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
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
                    Text(name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    const Text(
                      'Experience: 5 years',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Language Spoken: English',
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    const Text(
                      'Working Hours: Monday to Sunday 7am to 9pm',
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    const Text(
                      'Available Timings:',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Today: 10am - 5pm',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tomorrow: 9am - 4pm',
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.green),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Consultation Fees',
                            ),
                            SizedBox(width: 8),
                            Text(
                              '\$50',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle booking appointment
            },
            child: const Text('Book Appointment'),
          ),
        ],
      ),
    );
  }
}
