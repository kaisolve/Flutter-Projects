import 'package:flutter/material.dart';
import 'package:kadai/models/category.dart';

import 'hive_database.dart';

class CategoryData extends ChangeNotifier {
  final db = HiveData();

List<Category> categoryList = [
    Category(
      categoryName: "Work",
      tasksList: [
        Task(
          taskName: "taskame",
          subtasks: [SubTask(subTaskName: "subs"), SubTask(subTaskName: "ts")],
          isStarred: false,
          deadline: DateTime.now(),
        ),
      ],
    ),
    Category(
      categoryName: "Personal",
      tasksList: [
        Task(
          taskName: "new",
          subtasks: [],
          isStarred: false,
          deadline: DateTime(2023, 8, 21),
        )
      ],
    ),


  ];
  void initializeBudgetList() {
    // db.delAll();
    if (db.previousDataExists()) {
      categoryList = db.readFromDatabase();
    } else {
      db.saveToDatabase(categoryList);
    }
  }

  List<Category> getCategoryList() {
    return db.readFromDatabase();
  }


  List<Task> starList = [];

  int getCategoryCount() {
    return categoryList.length;
  }

  int getTasksCount(String categoryN) {
    Category relevantCategory = getRelevantCategory(categoryN);
    return relevantCategory.tasksList.length;
  }

  int getSubTasksCount(String categoryN, String taskN) {
    Task relevantTask = getRelevantTask(categoryN, taskN);
    return relevantTask.subtasks.length;
  }

  List<Category> getCategorys() {
    return categoryList;
  }

  List<Task> getTasks(String categoryN) {
    Category relevantCategory = getRelevantCategory(categoryN);
    return relevantCategory.tasksList;
  }

  List<SubTask> getSubTasks(String categoryN, String taskN) {
    Task relevantTask = getRelevantTask(categoryN, taskN);
    return relevantTask.subtasks;
  }

  void addCategory(String categoryN) {
    categoryList.add(Category(categoryName: categoryN, tasksList: []));
    db.saveToDatabase(categoryList);
    notifyListeners();
  }

  void addTask(String categoryN, String taskN, DateTime date) {
    Category relevantCategory = getRelevantCategory(categoryN);
    relevantCategory.tasksList.add(Task(
      taskName: taskN,
      subtasks: [],
      isStarred: false,
      deadline: date,
    ));
    db.saveToDatabase(categoryList);

    notifyListeners();
  }

  void addSubTask(String categoryN, String taskN, String subtaskN) {
    Task relevantTask = getRelevantTask(categoryN, taskN);
    relevantTask.subtasks.add(SubTask(subTaskName: subtaskN));
    db.saveToDatabase(categoryList);

    notifyListeners();
  }

  void addSubTasks(String categoryN, String taskN, List subtasks) {
    Task relevantTask = getRelevantTask(categoryN, taskN);
    for (var subT in subtasks) {
      relevantTask.subtasks.add(SubTask(subTaskName: subT));
    }
    db.saveToDatabase(categoryList);

    notifyListeners();
  }

  void delCategory(String categoryN) {
    Category relevantCategory = getRelevantCategory(categoryN);
    categoryList.remove(relevantCategory);
    notifyListeners();
  }

  void delTask(String categoryN, String taskN) {
    Category relevantCategory = getRelevantCategory(categoryN);
    Task relevantTask = getRelevantTask(categoryN, taskN);
    relevantCategory.tasksList.remove(relevantTask);
    db.saveToDatabase(categoryList);

    notifyListeners();
  }

  void delSubTask(
    String categoryN,
    String taskN,
  ) {
    Task relevantTask = getRelevantTask(categoryN, taskN);
    SubTask relevantSubTask = getRelevantSubTask(categoryN, taskN);
    relevantTask.subtasks.remove(relevantSubTask);
    db.saveToDatabase(categoryList);

    notifyListeners();
  }

  Category getRelevantCategory(String catName) {
    Category category =
        categoryList.firstWhere((cat) => cat.categoryName == catName);
    return category;
  }

  Task getRelevantTask(String catName, String taskName) {
    Category relevantCat = getRelevantCategory(catName);
    Task task =
        relevantCat.tasksList.firstWhere((task) => task.taskName == taskName);
    return task;
  }

  SubTask getRelevantSubTask(String catName, String taskName) {
    Task task = getRelevantTask(catName, taskName);
    SubTask subtask =
        task.subtasks.firstWhere((subtask) => subtask.subTaskName == taskName);
    return subtask;
  }

  void addStar(String taskName) {
    starList.add(Task(
      taskName: taskName,
      subtasks: [],
      isStarred: false,
      deadline: DateTime(2023, 8, 20),
    ));
    db.saveToDatabase(categoryList);

    notifyListeners();
  }

  void toggleStar(int index) {
    categoryList[index].tasksList[index].isStarred =
        !categoryList[index].tasksList[index].isStarred;
    db.saveToDatabase(categoryList);

    notifyListeners();
  }

  void removeStar(String taskName) {
    starList.remove(Task(
      taskName: taskName,
      subtasks: [],
      isStarred: false,
      deadline: DateTime(2023, 8, 31),
    ));
    db.saveToDatabase(categoryList);

    notifyListeners();
  }
}
