import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade300,
            ),
            child: const Text(
              'Side menu',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            onLongPress: () {},
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('f'),
                onTap: () => {Navigator.of(context).pop()},
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
