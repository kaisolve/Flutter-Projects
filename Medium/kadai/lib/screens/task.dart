import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadai/widgets/bubble.dart';
import 'package:kadai/widgets/categorylist.dart';
import 'package:kadai/widgets/tasklist.dart';
import 'package:provider/provider.dart';

import '../models/category_data.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});
  static String id = "task";

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    TextEditingController task = TextEditingController();
    int n = 0;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(
            Icons.more_vert_sharp,
            color: Colors.black,
            size: 27,
          ),
        ],
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 27,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Buble(
            child: CategoryList(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              controller: task,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: "Task",
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Consumer<CategoryData>(
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                builder: (BuildContext context, CategoryData, child) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: CategoryData.getSubTasksCount(
                    CategoryList.category, TaskList.taskN),
                itemBuilder: (context, index) {
                  String subT = CategoryData.getRelevantTask(
                          CategoryList.category, TaskList.taskN)
                      .subtasks[index]
                      .subTaskName;
                  return ListTile(
                    leading: GestureDetector(
                        onTap: () {
                          setState(() {
                            n = 1;
                          });
                        },
                        child: Icon(
                            n == 1 ? Icons.circle : Icons.circle_outlined)),
                    title: Text(
                      subT,
                      style: TextStyle(
                          decoration: n == 1
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    trailing: const Icon(Icons.list),
                  );
                },
              );
            }),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: TextButton(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "+ Add Sub-task",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Divider(
                        color: Colors.grey,
                        height: 5,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                              onTap: () {},
                              leading: const Icon(FontAwesomeIcons.calendar),
                              title: const Text('Due Date'),
                              trailing: const Text('data')),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Divider(
                              color: Colors.grey,
                              height: 5,
                            ),
                          ),
                          ListTile(
                              onTap: () {},
                              leading: const Icon(FontAwesomeIcons.solidClock),
                              title: const Text('Time & Reminder'),
                              trailing: const Text('No')),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Divider(
                              color: Colors.grey,
                              height: 5,
                            ),
                          ),
                          ListTile(
                              onTap: () {},
                              leading: const Icon(FontAwesomeIcons.repeat),
                              title: const Text('Repeat Task'),
                              trailing: const Text('No')),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Divider(
                              color: Colors.grey,
                              height: 5,
                            ),
                          ),
                          ListTile(
                              onTap: () {},
                              leading:
                                  const Icon(FontAwesomeIcons.solidNoteSticky),
                              title: const Text('Notes'),
                              trailing: const Text('ADD')),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Divider(
                              color: Colors.grey,
                              height: 5,
                            ),
                          ),
                          ListTile(
                              onTap: () {},
                              leading: const Icon(FontAwesomeIcons.paperclip),
                              title: const Text('Attachment'),
                              trailing: const Text('ADD')),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Divider(
                              color: Colors.grey,
                              height: 5,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
