import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/auth_manager.dart';

class ListPageSideDrawer extends StatelessWidget {
  final Function() showAllCallback;
  final Function() showOnlyMineCallback;
  const ListPageSideDrawer({
    required this.showAllCallback,
    required this.showOnlyMineCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // Important: Remove any padding from the ListView.
        //padding: EdgeInsets.zero,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Movie Quote',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28.0,
                    color: Colors.white)),
          ),
          ListTile(
            title: const Text('Show only my quote'),
            leading: const Icon(Icons.person),
            onTap: () {
              showOnlyMineCallback();
              // Update the state of the app.
              // ...
              //Navigator.pop(context);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Show all quotes'),
            leading: const Icon(Icons.people),
            onTap: () {
              showAllCallback();
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();
              AuthManager.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
