// import 'package:flutter/material.dart';
// import 'package:kadai/models/category_provider.dart';
// import 'package:kadai/widgets/taskrow.dart';
// import 'package:provider/provider.dart';

// import '../models/category_data.dart';
// import '../screens/task.dart';

// class CategoryWidget extends StatelessWidget {
//   final int ind;

//   const CategoryWidget(this.ind, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//     final category = categoryProvider.categories[ind];
//     return Consumer<CategoryData>(
//         // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
//         builder: (context, CategoryData, child) {
//       return ListView.builder(
//         itemCount: CategoryData.getRelevantCategory(categoryN).tasksList.length,
//         itemBuilder: (context, index) {
//           String taskName = CategoryData.getRelevantCategory(categoryN)
//               .tasksList[index]
//               .taskName;
//           return TaskRow(
//               taskN: taskName,
//               onTap: () {
//                 Navigator.pushNamed(context, Tasks.id);
//                 taskN = taskName;
//               },
//               star: (p0) {
//                 categoryProvider.toggleStar(ind, index);
//                 CategoryData.addStar(taskName);
//               },
//               date: (p0) {},
//               del: (p0) {
//                 CategoryData.delTask(categoryN, taskName);
//               },
//               text: taskName);
//         },
//       );
//     });
//     // return ListTile(
//     //   title: Text(category.categoryName),
//     //   leading: IconButton(
//     //     icon: Icon(
//     //       category.tasksList[index].isStarred ? Icons.star : Icons.star_border,
//     //       color:
//     //           category.tasksList[index].isStarred ? Colors.yellow : Colors.grey,
//     //     ),
//     //     onPressed: () {
//     //       categoryProvider.toggleStar(index, tind);
//     //     },
//     //   ),
//     // );
//   }
// }
