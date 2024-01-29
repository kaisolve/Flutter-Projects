// doctor_card.dart

import 'package:clinic/screens/doctor_profile.dart';
import 'package:clinic/screens/payments.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String doctorimage;
  final String specialization;
  final double rating;

  const DoctorCard({
    super.key,
    required this.name,
    required this.doctorimage,
    required this.specialization,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DoctorProfilePage(name: name)),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(doctorimage),
                  // Replace with the actual image data
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name),
                    IconButton(
                      onPressed: () {
                        // Handle favorite button press
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                subtitle: Text(specialization),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle appointment button press
                      MaterialPageRoute(builder: (context) => PaymentPage());
                    },
                    child: const Text('Appoint Me'),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 8),
                      Text('$rating'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
