import 'package:flutter/material.dart';
import 'package:myhomepage/items/widget/shopping_item_widget.dart';

import 'data.dart';
import 'model/shopping_item.dart';

class ItemsScreen extends StatefulWidget {
  final String title;

  const ItemsScreen({
    required this.title,
  });

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.shoppingList);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: buildInsertButton(),
            ),
          ],
        ),
      );

  Widget buildItem(item, int index, Animation<double> animation) =>
      ShoppingItemWidget(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
      );

  Widget buildInsertButton() => RaisedButton(
        child: Text(
          'Request Items',
          style: TextStyle(fontSize: 14),
        ),
        color: Colors.black54,
        onPressed: () => insertItem(3, Data.shoppingList.first),
      );

  void insertItem(int index, ShoppingItem item) {
    items.insert(index, item);
    key.currentState?.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    key.currentState?.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }
}
