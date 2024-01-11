import 'package:flutter/material.dart';
import 'package:kadai/models/category_data.dart';
import 'package:kadai/widgets/categorylist.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});
  static const String id = "addtask";

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // ignore: unused_field
  int n = 0;
  DateTime? _selectedDay; // Store the selected day here

  Future<void> _showCalendar() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (picked != null && picked != _selectedDay) {
      setState(() {
        _selectedDay = picked;
      });
    }
  }

  TextEditingController taskN = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            TextField(
              controller: taskN,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Add Task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            // AddSubTask(subtasks: Provider.of<CategoryData>(context).categoryList[0].tasksList[0].subtasks[0]),
            // AddSubTask(subtasks: []),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: CategoryList(),
                ),
                IconButton(
                  onPressed: () {
                    _showCalendar();
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
                Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: () => setState(() {
                      n++;
                    }),
                    icon: const Icon(Icons.subject_sharp),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.task),
                ),
                const SizedBox(
                  width: 70,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<CategoryData>(context, listen: false).addTask(
                          CategoryList.category, taskN.text, _selectedDay!);
                    });
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
