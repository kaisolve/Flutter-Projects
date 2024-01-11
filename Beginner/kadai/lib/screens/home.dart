import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kadai/screens/account.dart';
import 'package:kadai/screens/calendar.dart';
import 'package:kadai/widgets/addtask.dart';
import 'package:kadai/widgets/categorybuble.dart';
import 'package:kadai/widgets/categorylist.dart';
import 'package:kadai/widgets/sidemenu.dart';
import 'package:kadai/widgets/tasklist.dart';
import 'package:provider/provider.dart';

import '../models/category_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String id = "home";
  static String catName = "Work";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _currentIndex = 1;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onNavItemTapped(int index) {
    index == 0
        ? _scaffoldKey.currentState?.openDrawer()
        : index == 1
            ? Navigator.of(context).pushNamed(Home.id)
            : index == 2
                ? Navigator.of(context).pushNamed(Calendar.id)
                : Navigator.of(context).pushNamed(Account.id);
  }

  @override
  void initState() {
    // deleteFromDisk();
    Provider.of<CategoryData>(context, listen: false).db.delAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      })),
      drawer: const NavDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.plus),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTask(),
              ),
            ),
          );
        },
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
            width: double.infinity,
            child: Bubble(),
          ), // Bubble(),

          Expanded(
            child:
          TaskList(categoryN: CategoryList.category)
              // ?Container():TaskList(categoryN: CategoryList.category),


          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        onTap: _onNavItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
