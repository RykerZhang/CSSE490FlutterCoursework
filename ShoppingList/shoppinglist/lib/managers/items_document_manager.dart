import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppinglist/models/Item.dart';

class ItemDocumentManager {
  Item? latestItem;
  final CollectionReference _ref;

  static final ItemDocumentManager instance =
      ItemDocumentManager._privateConstructor();

  ItemDocumentManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kItemCollectionPath);

  StreamSubscription startListening(String documentId, Function() observer) {
    return _ref
        .doc(documentId)
        .snapshots()
        .listen((DocumentSnapshot docSnapshot) {
      latestItem = Item.from(docSnapshot);
      observer();
    });
  }

  void stopListening(StreamSubscription subscription) {
    subscription.cancel();
  }

  Future<void> add({
    required String itemName,
    required int count,
    required String itemPicURL,
    required String itemLink,
  }) {
    return _ref
        .add({
          //kOwner: AuthManager.instance.uid,
          kItemName: itemName,
          kItemPicURL: itemPicURL,
          kLastTouched: Timestamp.now(),
          kItemLink: itemLink,
          kCount: count,
        })
        .then((DocumentReference docRef) => print("Item add with id"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void update({
    required String itemName,
    required int count,
    required String itemPicURL,
    required String itemLink,
  }) {
    if (latestItem == null) {
      return;
    }
    _ref.doc(latestItem!.documentId!).update({
      kItemName: itemName,
      kItemPicURL: itemPicURL,
      kLastTouched: Timestamp.now(),
      kItemLink: itemLink,
      kCount: count,
    }).catchError((error) => print("Failed to add user: $error"));
  }

  void delete() {
    if (latestItem == null) {
      return;
    } else {
      _ref.doc(latestItem?.documentId!).delete();
    }
  }
}
