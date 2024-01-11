// appointment_page.dart

import 'package:clinic/screens/payments.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String _selectedTab = 'Upcoming'; // Initial tab selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab('Upcoming'),
                _buildTab('Completed'),
                _buildTab('Canceled'),
              ],
            ),
          ),
          Expanded(
            child: _buildAppointmentsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String tabName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabName;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: _selectedTab == tabName ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          tabName,
          style: TextStyle(
            color: _selectedTab == tabName ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentsList() {
    // Replace the following with actual appointment data from your database
    List<Appointment> appointments = [
      Appointment(
        name: 'Dr.fsdf dsf',
        doctorImage: 'asset/logo.png',
        date: 'Jan 10, 2023',
        time: '10:30 AM',
        number: '12345',
        direction: '123 Main St, City',
      ),
      // Add more appointments as needed
    ];

    List<Appointment> filteredAppointments = appointments.where((appointment) {
      switch (_selectedTab) {
        case 'Upcoming':
          return true; // Show all appointments for 'Upcoming' tab
        case 'Completed':
          return false; // Implement logic to filter completed appointments
        case 'Canceled':
          return false; // Implement logic to filter canceled appointments
        default:
          return true;
      }
    }).toList();

    return ListView.builder(
      itemCount: filteredAppointments.length,
      itemBuilder: (context, index) {
        Appointment appointment = filteredAppointments[index];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(appointment.doctorImage),
                radius: 40,
              ),
              Center(
                child: Text(
                  appointment.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Date: ${appointment.date} ${appointment.time}',
              ),
              const SizedBox(height: 8),
              Text('Number: ${appointment.number}'),
              const SizedBox(height: 8),
              Text('Direction: ${appointment.direction}'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle cancel appointment
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      MaterialPageRoute(builder: (context) => PaymentPage());
                    },
                    child: const Text('Reschedule'),
                  ),
                ],
              ),
              const Divider(color: Colors.green),
            ],
          ),
        );
      },
    );
  }
}

class Appointment {
  final String doctorImage;
  final String date;
  final String time;
  final String number;
  final String direction;
  final String name;

  Appointment({
    required this.doctorImage,
    required this.date,
    required this.time,
    required this.number,
    required this.direction,
    required this.name,
  });
}
