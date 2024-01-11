import 'package:flutter/material.dart';
import 'package:kadai/models/category_data.dart';
import 'package:kadai/screens/task.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/category.dart';
import '../widgets/taskrow.dart';

class Calendar extends StatefulWidget {
  static String taskN = "";
  static String id = "calendar";
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String categoryN = "Work";
  List<Task> tasklist = [];
  void fillList() {
    tasklist = [];
    for (var i = 0;
        i < Provider.of<CategoryData>(context).categoryList.length;
        i++) {
      for (var cat
          in Provider.of<CategoryData>(context).categoryList[i].tasksList) {
        tasklist.add(cat);
      }
    }
  }

  late DateTime day = DateTime.now();
  int ind = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.week,
            onDaySelected: (selectedDay, focusedDay) => {
              setState(() {
                day = focusedDay;
              })
            },
            firstDay: DateTime(2000),
            lastDay: DateTime(3000),
            focusedDay: day,
            currentDay: day,
          ),
          Expanded(
            child: Consumer<CategoryData>(
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                builder: (context, CategoryData, child) {
              fillList();
              return ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (context, index) {
                  Task task = tasklist[index];
                  if (task.deadline.day == day.day) {
                    return TaskRow(
                        taskN: task.taskName,
                        onTap: () {
                          Navigator.pushNamed(context, Tasks.id);
                          Calendar.taskN = task.taskName;
                        },
                        star: (p0) {
                          CategoryData.addStar(task.taskName);
                        },
                        date: (p0) {},
                        del: (p0) {},
                        text: task.taskName);
                  } else {
                    return Container();
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
