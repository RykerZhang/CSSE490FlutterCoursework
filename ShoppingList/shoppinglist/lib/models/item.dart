import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppinglist/models/firestore_model_content_util.dart';

const String kItemCollectionPath = "ShoppingList";
const String kItemName = "itemName";
const String kLastTouched = "lastTouched";
const String kOwner = "owner";
const String kItemPicURL = "itemPicURL";
const String kItemLink = "itemLink";
const String kCount = "count";

class Item {
  String? documentId;
  String itemName;
  String owner;
  Timestamp lastTouched;
  int count;
  String itemPicURL;
  String itemLink;

  Item({
    this.documentId,
    required this.itemName,
    required this.owner,
    required this.lastTouched,
    required this.count,
    required this.itemLink,
    required this.itemPicURL,
  });

  Item.from(DocumentSnapshot doc)
      : this(
          documentId: doc.id,
          owner: FirestoreModelUtils.getStringField(doc, kOwner),
          itemName: FirestoreModelUtils.getStringField(doc, kItemName),
          lastTouched: FirestoreModelUtils.getTimestampField(doc, kLastTouched),
          count: FirestoreModelUtils.getIntField(doc, kCount),
          itemLink: FirestoreModelUtils.getStringField(doc, kItemLink),
          itemPicURL: FirestoreModelUtils.getStringField(doc, kItemPicURL),
        );

  Map<String, Object?> toMap() {
    return {
      kOwner: owner,
      kItemName: itemName,
      kLastTouched: lastTouched,
      kCount: count,
      kItemLink: itemLink,
      kItemPicURL: itemPicURL,
    };
  }

  @override
  String toString() {
    return "$itemName with number $count";
  }
}
