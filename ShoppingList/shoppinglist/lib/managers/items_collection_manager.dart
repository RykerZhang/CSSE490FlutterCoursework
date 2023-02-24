import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppinglist/managers/auth_managers.dart';

import '../models/Item.dart';

class ItemsCollectionManager {
  List<Item> latestItems = [];
  final CollectionReference _ref;

  static final ItemsCollectionManager instance =
      ItemsCollectionManager._privateConstructor();

  ItemsCollectionManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kItemCollectionPath);

  StreamSubscription startListening(Function() observer,
      {bool isFilteredForMine = false}) {
    Query query = _ref;
    if (isFilteredForMine) {
      query = query.where(kOwner, isEqualTo: AuthManager.instance.uid);
    }
    return query.snapshots().listen((QuerySnapshot querySnapshot) {
      print(querySnapshot.docs);
      latestItems = querySnapshot.docs.map((doc) => Item.from(doc)).toList();
      observer();
    });
  }

  void stopListening(StreamSubscription? subscription) {
    subscription?.cancel();
  }

  Future<void> add({
    required String itemName,
    required int count,
    required String itemPicURL,
    required String itemLink,
  }) {
    return _ref
        .add({
          kOwner: AuthManager.instance.email,
          kItemName: itemName,
          kItemPicURL: itemPicURL,
          kLastTouched: Timestamp.now(),
          kItemLink: itemLink,
          kCount: count,
        })
        .then((DocumentReference docRef) => print("Item add with id"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Query<Item> get allItemsQuery =>
      _ref.orderBy(kLastTouched, descending: true).withConverter<Item>(
            fromFirestore: (snapshot, _) => Item.from(snapshot),
            toFirestore: (item, _) => item.toMap(),
          );

  Query<Item> get mineONlyItemsQuery =>
      allItemsQuery.where(kOwner, isEqualTo: AuthManager.instance.uid);
}
