import 'package:flutter/material.dart';
import 'package:shoppinglist/models/Item.dart';

class ItemRow extends StatelessWidget {
  final Item item;
  final Function() onTap;

  const ItemRow({
    required this.item,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: const Icon(Icons.movie_creation_outlined),
        trailing: const Icon(Icons.chevron_right),
        title: Text(
          item.itemName,
        ),
        subtitle: Text(
          item.owner,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
