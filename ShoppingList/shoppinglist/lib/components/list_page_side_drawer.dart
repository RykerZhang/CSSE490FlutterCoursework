import 'package:flutter/material.dart';
import 'package:shoppinglist/managers/auth_managers.dart';
import 'package:shoppinglist/pages/login_front_page.dart';
import 'package:shoppinglist/pages/profile_page.dart';

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
              color: Colors.purple,
            ),
            child: Text("Shopping List",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28.0,
                    color: Colors.white)),
          ),
          ListTile(
            title: const Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () {
              // Update the state of the app.
              // ...
              //Navigator.pop(context);
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return const ProfilePage();
                },
              ));
            },
          ),
          // ListTile(
          //   title: const Text('Show all Items'),
          //   leading: const Icon(Icons.people),
          //   onTap: () {
          //     showAllCallback();
          //     // Update the state of the app.
          //     // ...
          //     Navigator.of(context).pop();
          //   },
          // ),
          const Spacer(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();

              //TODO: add the auth sign out
              AuthManager.instance.signOut();
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return const LoginFrontPage();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
