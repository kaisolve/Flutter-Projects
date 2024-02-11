import 'package:clinic/doctorcard.dart';
import 'package:clinic/screens/doctor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: Column(
        children: [
          // Top bar with scrollable categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryButton(context, 'All'),
                _buildCategoryButton(context, 'Cardiology'),
                _buildCategoryButton(context, 'Dermatology'),
                _buildCategoryButton(context, 'Orthopedics'),
                // Add more categories as needed
              ],
            ),
          ),
          // List of doctors
          Expanded(
            child: _buildDoctorsList(),
          ),
        ],
      ),
    );
  }
}

List<String> filteredDoctorNames = [
  'Doctor 1',
  'Doctor 2',
  'Doctor 3',
  'Doctor 4',
  'Doctor 5'
];

Widget _buildDoctorsList() {
  // Replace this with your actual list of doctors
  return Center(
    child: Expanded(
      child: ListView.builder(
        itemCount: filteredDoctorNames.length,
        itemBuilder: (context, index) {
          return DoctorCard(
            doctorimage: "asset/logo.png",
            name: filteredDoctorNames[index],
            specialization: 'Specialization $index',
            // rating: 4.5, // Replace with the actual rating
          );
        },
      ),
    ),
  );
}

Widget _buildCategoryButton(BuildContext context, String category) {
  return ElevatedButton(
    onPressed: () {
      // Show list of doctors based on the selected specialization
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DoctorListPage(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
    ),
    child: Text(
      category,
      style: const TextStyle(color: Colors.black),
    ),
  );
}
