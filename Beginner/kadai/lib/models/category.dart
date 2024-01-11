class Category {
  final String categoryName;
  List<Task> tasksList = [
    Task(
      taskName: "First",
      subtasks: [],
      isStarred: false,
      deadline: DateTime.now(), // Set the initial deadline
    )
  ];

  Category({
    required this.categoryName,
    required this.tasksList,
  });
}

class Task {
  final String taskName;
  bool isStarred;
  List<SubTask> subtasks;
  DateTime deadline; // Add the deadline property

  Task({
    required this.taskName,
    required this.subtasks,
    required this.isStarred,
    required this.deadline, // Include the deadline parameter
  });
}

class SubTask {
  final String subTaskName;

  SubTask({required this.subTaskName});
}
