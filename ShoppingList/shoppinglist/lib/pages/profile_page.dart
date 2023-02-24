import 'package:cube_transition/cube_transition.dart';
import 'package:flutter/material.dart';
import 'package:shoppinglist/managers/auth_managers.dart';
import 'package:shoppinglist/pages/item_list_page.dart';
import 'package:shoppinglist/pages/login_front_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 100,
                left: (MediaQuery.of(context).size.width) / 8,
                child: Text(
                  "Email:",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Positioned(
                top: 100,
                left: (MediaQuery.of(context).size.width) / 8 + 100,
                child: Text(
                  AuthManager.instance.email,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Positioned(
                top: 250,
                left: (MediaQuery.of(context).size.width) / 8,
                child: Text(
                  "UID:",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Positioned(
                top: 250,
                left: (MediaQuery.of(context).size.width) / 8 + 50,
                child: Text(
                  AuthManager.instance.uid,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Positioned(
                top: 600,
                left: (MediaQuery.of(context).size.width) / 8 + 80,
                child: IconButton(
                  icon: Icon(Icons.logout),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.of(context).pop();
                    AuthManager.instance.signOut();
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) {
                    //     return const LoginFrontPage();
                    //   },
                    // ));
                    Navigator.of(context).push(
                      CubePageRoute(
                        enterPage: LoginFrontPage(),
                        duration: const Duration(milliseconds: 600),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                  top: 550,
                  left: (MediaQuery.of(context).size.width) / 8,
                  child: Text(
                    "You may also log out here:",
                    style: Theme.of(context).textTheme.headline6,
                  )),
              Positioned(
                  top: 400,
                  left: (MediaQuery.of(context).size.width) / 8,
                  child: Text(
                    "Back to the list:",
                    style: Theme.of(context).textTheme.headline6,
                  )),
              Positioned(
                top: 450,
                left: (MediaQuery.of(context).size.width) / 8 + 80,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 35,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (BuildContext context) {
                    //     return const ItemListPage();
                    //   },
                    // ));
                    Navigator.of(context).push(
                      CubePageRoute(
                        enterPage: ItemListPage(),
                        duration: const Duration(milliseconds: 600),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width) / 2 + 80,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 80,
                left: (MediaQuery.of(context).size.width) / 2 + 80,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 130,
                left: (MediaQuery.of(context).size.width) / 2 + 80,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 180,
                left: (MediaQuery.of(context).size.width) / 2 + 80,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width) / 2 + 130,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 70,
                left: (MediaQuery.of(context).size.width) / 2 + 160,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 100,
                left: (MediaQuery.of(context).size.width) / 2 + 130,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 130,
                left: (MediaQuery.of(context).size.width) / 2 + 130,
                child: Icon(Icons.shopping_bag),
              ),
              Positioned(
                top: 180,
                left: (MediaQuery.of(context).size.width) / 2 + 160,
                child: Icon(Icons.shopping_bag),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
