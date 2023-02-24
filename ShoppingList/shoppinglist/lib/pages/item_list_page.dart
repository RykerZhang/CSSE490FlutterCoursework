import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoppinglist/components/item_row_component.dart';
import 'package:shoppinglist/components/list_page_side_drawer.dart';
import 'package:shoppinglist/managers/auth_managers.dart';
import 'package:shoppinglist/managers/items_collection_manager.dart';
import 'package:shoppinglist/models/Item.dart';
import 'package:shoppinglist/pages/Item_detail_page.dart';
import 'package:shoppinglist/pages/login_front_page.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final nameTextController = TextEditingController();
  final countTextController = TextEditingController();
  final imageURLTextController = TextEditingController();
  final LinkTextController = TextEditingController();

  bool _isShowingAllItems = true;

  UniqueKey? _loginObserverKey;
  UniqueKey? _logoutObserverKey;

  @override
  void initState() {
    super.initState();

    _showAllItems();

    _loginObserverKey = AuthManager.instance.addLoginObserver(() {
      setState(() {});
    });

    _logoutObserverKey = AuthManager.instance.addLogoutObserver(() {
      _showAllItems();
      setState(() {});
    });
  }

  void _showAllItems() {
    setState(() {
      _isShowingAllItems = true;
    });
  }

  void _showOnlyMyItems() {
    setState(() {
      _isShowingAllItems = false;
    });
  }

  @override
  void dispose() {
    nameTextController.dispose();
    countTextController.dispose();
    LinkTextController.dispose();
    imageURLTextController.dispose();
    AuthManager.instance.removeObserver(_loginObserverKey);
    AuthManager.instance.removeObserver(_logoutObserverKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
        actions: AuthManager.instance.isSignedIn
            ? null
            : [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginFrontPage();
                      },
                    ));
                  },
                  tooltip: "Log in",
                  icon: const Icon(Icons.login),
                ),
              ],
      ),
      backgroundColor: Colors.grey[100],
      body: FirestoreListView<Item>(
        // query: _isShowingAllItems
        //     ? ItemsCollectionManager.instance.allItemsQuery
        //     : ItemsCollectionManager.instance.mineONlyItemsQuery,
        query: ItemsCollectionManager.instance.allItemsQuery,
        itemBuilder: (context, snapshot) {
          Item item = snapshot.data();

          return ItemRow(
            item: item,
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ItemDetailPage(
                        item.documentId!); // In Firebase use a documentId
                  },
                ),
              );
              setState(() {});
            },
          );
        },
      ),
      drawer: AuthManager.instance.isSignedIn
          ? ListPageSideDrawer(
              showAllCallback: () {
                _showAllItems();
              },
              showOnlyMineCallback: () {
                _showOnlyMyItems();
              },
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (AuthManager.instance.isSignedIn) {
            showCreateItemDialog(context);
          } else {
            showMustLogInDialog(context);
          }
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showCreateItemDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create an Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: nameTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the name',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: countTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the Count',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: imageURLTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the ImageURL',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: LinkTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the item link',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Create'),
              onPressed: () {
                setState(() {
                  if (countTextController.text.isEmpty) {
                    countTextController.text = "0";
                  }
                  ItemsCollectionManager.instance.add(
                    itemName: nameTextController.text,
                    count: int.parse(countTextController.text),
                    itemPicURL: imageURLTextController.text,
                    itemLink: LinkTextController.text,
                  );
                  nameTextController.text = "";
                  countTextController.text = "";
                  imageURLTextController.text = "";
                  LinkTextController.text = "";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showMustLogInDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Login Required"),
          content: const Text(
              "You must be signed in to post.  Would you like to sign in now?"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text("Go sign in"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const LoginFrontPage();
                  },
                ));
              },
            ),
          ],
        );
      },
    );
  }
}
