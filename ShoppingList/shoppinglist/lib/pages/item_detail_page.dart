import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppinglist/managers/Items_collection_manager.dart';
import 'package:shoppinglist/managers/Items_document_manager.dart';
import 'package:shoppinglist/managers/auth_managers.dart';

class ItemDetailPage extends StatefulWidget {
  final String documentId;
  const ItemDetailPage(this.documentId, {super.key});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final itemNameTextContorller = TextEditingController();
  final imageUrlTextController = TextEditingController();
  final countTextController = TextEditingController();
  final itemLinkController = TextEditingController();

  StreamSubscription? ItemSubscription;

  @override
  void initState() {
    super.initState();

    ItemSubscription = ItemDocumentManager.instance.startListening(
      widget.documentId,
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    itemNameTextContorller.dispose();
    imageUrlTextController.dispose();
    countTextController.dispose();
    itemLinkController.dispose();

    ItemDocumentManager.instance.stopListening(ItemSubscription!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool showEditeDelete =
        ItemDocumentManager.instance.latestItem != null &&
            AuthManager.instance.email.isNotEmpty &&
            AuthManager.instance.email ==
                ItemDocumentManager.instance.latestItem!.owner;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
        actions: [
          Visibility(
            visible: showEditeDelete,
            child: IconButton(
              onPressed: () {
                print("You clicked Edit!");
                showEditItemDialog(context);
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          Visibility(
            visible: showEditeDelete,
            child: IconButton(
              onPressed: () {
                final justDeletedName =
                    ItemDocumentManager.instance.latestItem!.itemName;
                final justDeleteCount =
                    ItemDocumentManager.instance.latestItem!.count;
                final justDeleteItemPic =
                    ItemDocumentManager.instance.latestItem!.itemPicURL;
                final justDeleteItemLink =
                    ItemDocumentManager.instance.latestItem!.itemLink;

                ItemDocumentManager.instance.delete();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Item Deleted'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        ItemsCollectionManager.instance.add(
                          itemName: justDeletedName,
                          count: justDeleteCount,
                          itemLink: justDeleteItemLink,
                          itemPicURL: justDeleteItemPic,
                        );
                        print("TODO: Figure out UNDO");
                      },
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            LabelledTextDisplay(
              title: "Item Name:",
              content: ItemDocumentManager.instance.latestItem?.itemName ?? "",
              iconData: Icons.format_quote_outlined,
            ),
            LabelledTextDisplay(
              title: "Item Count:",
              content:
                  ItemDocumentManager.instance.latestItem?.count.toString() ??
                      "",
              iconData: Icons.format_quote_outlined,
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
              child: CachedNetworkImage(
                imageUrl:
                    ItemDocumentManager.instance.latestItem?.itemPicURL ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showEditItemDialog(BuildContext context) {
    itemNameTextContorller.text =
        ItemDocumentManager.instance.latestItem?.itemName ?? "";
    imageUrlTextController.text =
        ItemDocumentManager.instance.latestItem?.itemPicURL ?? "";
    countTextController.text =
        ItemDocumentManager.instance.latestItem?.count.toString() ?? "";
    itemLinkController.text =
        ItemDocumentManager.instance.latestItem?.itemLink ?? "";

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit this Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: itemNameTextContorller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'ItemName:',
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
                    labelText: 'Item Count:',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: imageUrlTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Item Picture Link:',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: itemLinkController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Item Link:',
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
              child: const Text('Update'),
              onPressed: () {
                setState(() {
                  ItemDocumentManager.instance.update(
                    itemName: itemNameTextContorller.text,
                    count: int.parse(countTextController.text),
                    itemLink: itemLinkController.text,
                    itemPicURL: imageUrlTextController.text,
                  );

                  itemNameTextContorller.text = "";
                  countTextController.text = "";
                  itemLinkController.text = "";
                  imageUrlTextController.text = "";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LabelledTextDisplay extends StatelessWidget {
  final String title;
  final String content;
  final IconData iconData;

  const LabelledTextDisplay({
    super.key,
    required this.title,
    required this.content,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
                fontFamily: "Caveat"),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(iconData),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Flexible(
                    child: Text(
                      content,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
