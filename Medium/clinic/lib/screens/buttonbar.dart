import 'package:clinic/screens/home.dart';
import 'package:flutter/material.dart';
import 'appointment.dart';
import 'settings.dart';
import 'doctor.dart';
import 'notifications.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: HomePage()),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                _buildIconButton(context, Icons.home),
                _buildIconButton(context, Icons.date_range),
                _buildIconButton(context, Icons.search, isGreen: true),
                _buildIconButton(context, Icons.notifications),
                _buildIconButton(context, Icons.settings),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData iconData,
      {bool isGreen = false}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isGreen ? const Color(0xFF2DACA3) : Colors.transparent,
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
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case Icons.date_range:
        // Navigate to the appointment page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AppointmentPage()),
        );
        break;
      case Icons.search:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DoctorListPage()),
        );
        // No need to navigate, already on the home page
        break;
      case Icons.notifications:
        // Navigate to the notification page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NotificationPage('Notifications')),
        );
        break;
      case Icons.settings:
        // Navigate to the settings page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SettingPage('Settings')),
        );
        break;
    }
  }
}
