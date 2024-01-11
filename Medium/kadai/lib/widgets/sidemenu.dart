import 'package:flutter/material.dart';
import 'package:kadai/screens/setting.dart';
import 'package:kadai/screens/startasks.dart';

import '../screens/themes.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade400,
              // image: const DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/cover.jpg'))
            ),
            child: const Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Star Tasks'),
            onTap: () => {Navigator.of(context).pushNamed(Stars.id)},
          ),
          ExpansionTile(
            leading: const Icon(Icons.category_rounded),
            title: const Text('Category'),
            children: [
              ListTile(
                leading: const Icon(Icons.color_lens_rounded),
                title: const Text('Theme'),
                onTap: () =>
                    {Navigator.of(context).pushNamed(ThemeSelectionPage.id)},
              ),
            ],
            // subtitle: Consumer<CategoryData>(
            //   // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
            //   builder: (context, CategoryData, child) {
            //     return ListView.builder(
            //       itemCount: CategoryData.getCategoryCount(),
            //       itemBuilder: (context, index) {
            //         return Text(
            //             CategoryData.getCategorys()[index].categoryName);
            //       },
            //     );
            //   },
            // ),
            // onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.color_lens_rounded),
            title: const Text('Theme'),
            onTap: () =>
                {Navigator.of(context).pushNamed(ThemeSelectionPage.id)},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pushNamed(Settings.id)},
          ),
        ],
      ),
    );
  }
}
