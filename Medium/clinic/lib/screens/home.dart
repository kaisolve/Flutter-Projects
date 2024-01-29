import 'package:clinic/doctorcard.dart';
import 'package:flutter/material.dart';
import 'appointment.dart';
import 'settings.dart';
import 'doctor.dart';
import 'notifications.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
          // ButtonBar with IconButton widgets at the bottom
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                _buildIconButton(context, Icons.home),
                _buildIconButton(context, Icons.date_range),
                _buildIconButton(context, Icons.search, isGreen: true),
                _buildIconButton(context, Icons.notifications),
                _buildIconButton(context, Icons.settings),
              ],
            ),
          ),
        ],
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
            builder: (context) => DoctorListPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      child: Text(
        category,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData iconData,
      {bool isGreen = false}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isGreen ? Colors.green : Colors.transparent,
        // boxShadow: isGreen
        //     ? [
        //         BoxShadow(
        //           color: Colors.green.withOpacity(0.5),
        //           spreadRadius: 2,
        //           blurRadius: 8,
        //           offset: Offset(0, 3),
        //         ),
        //       ]
        //     : [],
      ),
      child: IconButton(
        icon: Icon(iconData, color: isGreen ? Colors.white : Colors.black),
        onPressed: () {
          // Navigate to the corresponding page
          _navigateToPage(context, iconData);
        },
      ),
    );
  }

  void _navigateToPage(BuildContext context, IconData iconData) {
    switch (iconData) {
      case Icons.home:
        // Navigate to the home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case Icons.date_range:
        // Navigate to the appointment page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppointmentPage()),
        );
        break;
      case Icons.search:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorListPage()),
        );
        // No need to navigate, already on the home page
        break;
      case Icons.notifications:
        // Navigate to the notification page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotificationPage('Notifications')),
        );
        break;
      case Icons.settings:
        // Navigate to the settings page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingPage('Settings')),
        );
        break;
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
    // For now, let's just show a placeholder text
    return Center(
      child: Expanded(
        child: ListView.builder(
          itemCount: filteredDoctorNames.length,
          itemBuilder: (context, index) {
            return DoctorCard(
              doctorimage: "asset/logo.png",
              name: filteredDoctorNames[index],
              specialization: 'Specialization $index',
              rating: 4.5, // Replace with the actual rating
            );
          },
        ),
      ),
    );
  }
}
