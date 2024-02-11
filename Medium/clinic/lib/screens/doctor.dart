// main_page.dart

import 'package:clinic/doctorcard.dart';
import 'package:flutter/material.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  List<String> doctorNames = [
    'Doctor 1',
    'Doctor 2',
    'Doctor 3',
    'Doctor 4',
    'Doctor 5',
  ];

  List<String> filteredDoctorNames = [];

  @override
  void initState() {
    filteredDoctorNames.addAll(doctorNames);
    super.initState();
  }

  void filterDoctors(String query) {
    setState(() {
      filteredDoctorNames = doctorNames
          .where((doctor) => doctor.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Doctors'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: filterDoctors,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.mic),
                      hintText: 'Hot Research',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
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
        ],
      ),
    );
  }
}
