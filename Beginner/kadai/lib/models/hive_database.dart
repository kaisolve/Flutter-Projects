import 'package:hive_flutter/hive_flutter.dart';
import 'package:kadai/models/category.dart';

class HiveData {
  final _myBox = Hive.box("category_database");

  void delAll() {
    _myBox.deleteFromDisk();
  }

  bool previousDataExists() {
    if (_myBox.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void saveToDatabase(List<Category> categories) {
    final categoryList = convertObjectTocategoryList(categories);
    // final Category = convertObjectToCategories(categories);
    final taskList = convertObjectTotaskList(categories);
    _myBox.put("CATEGORY", categoryList);
    // _myBox.put("CATEGORY", categories);
    _myBox.put("TASKS", taskList);
  }

  List<Category> readFromDatabase() {
    List<Category> mySavedCategories = [];
    final categoryNames = _myBox.get("CATEGORY");
    // final buds = _myBox.get("MONEY");
    final taskDetails = _myBox.get("TASKS");

    for (int i = 0; i < categoryNames.length; i++) {
      List<Task> tasksInEachCategory = [];
      for (int j = 0; j < taskDetails[i].length; j++) {
        tasksInEachCategory.add(Task(
            taskName: taskDetails[i][j][0],
            deadline: DateTime.parse(taskDetails[i][j][1]),
            isStarred:false,
            subtasks: []));
      }
      Category category = Category(
        categoryName: categoryNames[i],
        tasksList: tasksInEachCategory,
      );
      mySavedCategories.add(category);
    }
    return mySavedCategories;
  }
}

List<String> convertObjectTocategoryList(List<Category> categories) {
  List<String> categoryList = [];
  for (int i = 0; i < categories.length; i++) {
    categoryList.add(
      categories[i].categoryName,
    );
  }
  return categoryList;
}

List<String> convertObjectToCategories(List<Category> category) {
  List<String> categoryList = [];
  for (int i = 0; i < category.length; i++) {
    categoryList.add(category[i].categoryName);
  }
  return categoryList;
}

List<List<List<String>>> convertObjectTotaskList(List<Category> categories) {
  List<List<List<String>>> taskList = [];
  for (int i = 0; i < categories.length; i++) {
    List<Task> taskInCategory = categories[i].tasksList;
    List<List<String>> individualCategory = [];
    for (int j = 0; j < taskInCategory.length; j++) {
      List<String> individualTask = [];
      individualTask.addAll(
        [
          taskInCategory[j].taskName,
          taskInCategory[j].deadline.toString(),
          taskInCategory[j].isStarred.toString(),
        ],
      );
      individualCategory.add(individualTask);
    }
    taskList.add(individualCategory);
  }
  return taskList;
}
