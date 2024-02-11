import 'package:clinic/screens/payments.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

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
    List<Appointment> appointments = [
      Appointment(
        name: 'Dr. name of doc',
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
        return Card(
          elevation: 5,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(appointment.doctorImage),
                  radius: 40,
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    appointment.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Date: ${appointment.date} ${appointment.time}',
                ),
                const SizedBox(height: 8),
                Text('Number: ${appointment.number}'),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        _copyToClipboard(appointment.number);
                      },
                      icon: const Icon(Icons.phone),
                      label: Text(appointment.number),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        _launchMaps(appointment.direction);
                      },
                      icon: const Icon(Icons.map),
                      label: const Text('Get Direction'),
                    ),
                  ],
                ),
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
                        MaterialPageRoute(builder: (context) => const PaymentPage());
                      },
                      child: const Text('Reschedule'),
                    ),
                  ],
                ),
              ],
            ),
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

void _launchMaps(String location) async {
  final url =
      Uri.parse('https://www.google.com/maps/search/?api=1&query=$location');
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  } else {
    throw 'Could not launch Maps';
  }
}

void _copyToClipboard(String text) {
//   FlutterClipboard.copy(text).then((result) {
//     if (result) {
//       Fluttertoast.showToast(
//         msg: 'Copied to clipboard',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     } else {
//       Fluttertoast.showToast(
//         msg: 'Failed to copy to clipboard',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//   });
}
