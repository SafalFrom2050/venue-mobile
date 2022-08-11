import 'dart:html';

import 'package:flutter/material.dart';

import '../model/shopping_item.dart';

class ShoppingItemWidget extends StatelessWidget {
  final ShoppingItem item;
  final Animation<double> animation;
  final onClicked;

  const ShoppingItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: animation,
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black54,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            leading: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(item.urlImage),
            ),
            title: Text(item.title, style: TextStyle(fontSize: 20)),
            trailing: IconButton(
              icon: Icon(Icons.check_circle, color: Colors.green, size: 32),
              onPressed: onClicked,
            ),
          ),
        ),
      );
}
